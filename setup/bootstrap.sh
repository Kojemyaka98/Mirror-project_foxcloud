#!/bin/bash

# Mirror bootstrap script
#
# This script is used to setup a mirror server that is capable of serving
# offical packages for the following Linux distributions:
# * Ubuntu 18, 20
# * CentOS 7, 8
# * Debian 9, 10
# 
# Usage:
# ./bootstrap.sh
# 

MIRRORDATA_DEVICE="/dev/vdb"
MIRRORDATA_MOUNTPOINT="/mnt/mirrordata"
ASSETS_ROOT="./assets"
FETCHER_BASE_DIR="/opt"

ACTIONS=(
    setup_hostname
    wait_disk
    setup_disk_layout
    setup_disk_mount
    setup_ubuntu_fetcher
    setup_debian_fetcher
    setup_centos_fetcher
    setup_frontend
)

setup_hostname__should_run() {
    if echo "$(hostname)" | grep -e '.'; then
        return -1
    else
        return 0
    fi
}

setup_hostname__run() {
    new_hostname=$(hostname | sed 's/-/\./g')
    hostname "${new_hostname}"
    echo "${new_hostname}" > /etc/hostname
}

wait_disk__should_run() {
    if [ -b "${MIRRORDATA_DEVICE}" ]; then
        return -1
    else
        return 0
    fi
}

wait_disk__run() {
    while ! [ -b "${MIRRORDATA_DEVICE}" ]; do
        sleep 1m
    done
}

setup_disk_layout__should_run() {
    disk_summary="$(parted ${MIRRORDATA_DEVICE} print)"

    if ! echo "${disk_summary}" | grep "Partition Table:" | grep -i "gpt"; then
        return 0
    fi

    if ! echo "${disk_summary}" | grep -e "^1.\+ext4"; then
        return 0
    fi
    
    return -1
}

setup_disk_layout__run() {
    parted "${MIRRORDATA_DEVICE}" mklabel gpt
    parted "${MIRRORDATA_DEVICE}" mkpart primary ext4 0% 100%
    mkfs.ext4 "${MIRRORDATA_DEVICE}1"
}

setup_disk_mount__should_run() {
    if ! cat /etc/fstab | grep "${MIRRORDATA_DEVICE}1"; then
        return 0
    fi

    if ! [ -d "${MIRRORDATA_MOUNTPOINT}" ]; then
        return 0
    fi

    return -1
}

setup_disk_mount__run() {
   echo "${MIRRORDATA_DEVICE}1 ${MIRRORDATA_MOUNTPOINT} ext4 defaults 0 0" >> /etc/fstab
   mkdir -p "${MIRRORDATA_MOUNTPOINT}"
   mount "${MIRRORDATA_DEVICE}1" "${MIRRORDATA_MOUNTPOINT}"
}

__fetcher_should_run() {
    fetcher_file_name="$1"
    fetcher_path="${FETCHER_BASE_DIR}/${fetcher_file_name}"
    
    if ! [ -f "${fetcher_path}" ]; then
        return 0
    fi

    if ! cat /etc/crontab | grep -e "@daily ${fetcher_path}"; then
        return 0
    fi

    return -1 
}

__fetcher_install() {
    fetcher_file_name="$1"
    cp "${ASSETS_ROOT}/${fetcher_file_name}" "${FETCHER_BASE_DIR}"
    cat "@daily ${FETCHER_BASE_DIR}/${fetcher_file_name}" >> /etc/crontab
}

setup_ubuntu_fetcher__should_run() {
    return $(__fetcher_should_run "ubuntu-fetcher.sh")
}

setup_ubuntu_fetcher__run() {
    apt-get update && \
        apt-get install -y make git

    git clone https://github.com/Stifler6996/apt-mirror.git && \
        (cd apt-mirror && make install) && \
        rm -rf apt-mirror

    mkdir -p "${MIRRORDATA_MOUNTPOINT}/ubuntu"
    
    cp "${ASSETS_ROOT}/mirror.list" /etc/apt/mirror.list

    __fetcher_install "ubuntu-fetcher.sh"
}

setup_debian_fetcher__should_run() {
    return $(__fetcher_should_run "debian-fetcher.sh")
}

setup_debian_fetcher__run() {
    apt-get update && \
        apt-get install debmirror

    mkdir -p "${MIRRORDATA_MOUNTPOINT}/debian"

    __fetcher_install "debian-fetcher.sh"
}

setup_centos_fetcher__should_run() {
    return $(__fetcher_should_run "centos-fetcher.sh")
}

setup_centos_fetcher__run() {
    __fetcher_install "centos-fetcher.sh"
}

setup_frontend__should_run() {
    if [ -d "/var/www/mirror" ]; then
        return -1
    else
        return 0
    fi
}

setup_frontend__run() {
    apt-get update
    apt-get install -y apache2 certbot python3-certbot-apache gettext
  
    hostname="$(hostname)"
    cp "${ASSETS_ROOT}/apache2.conf" /etc/apache2/apache2.conf
    cat "${ASSETS_ROOT}/apache-virtual-host.conf" \
    | envsubst > "/etc/apache2/sites-available/${hostname}.conf"
   
    mirror_webhost_root="/var/www/mirror"
    hostname_placeholder='%HOSTNAME_PLACEHOLDER%'
    cp -r "${ASSETS_ROOT}/wwwmirror" "${mirror_webhost_root}"
    grep -rle "${hostname_placeholder}" "${mirror_webhost_root}" \
    | xargs sed -i "s|${hostname_placeholder}|https://${hostname}|g"
   
    a2ensite "${hostname}"
    systemctl enable --now apache2
   
    certbot --apache -n --agree-tos --email admin@foxcloud.net --redirect --domains "${hostname},www.${hostname}"
}

configure_server() {
    echo "=== Configuring mirror server ==="
    echo

    for action in "${ACTIONS[@]}"; do
        if eval "${action}__should_run"; then
            echo "==> [RUNNING] ${action}"
            eval "${action}__run"
        else
            echo "==> [SKIPPING] ${action}"
        fi
    done

    echo
    echo "Server configuration completed!"
}

configure_server
