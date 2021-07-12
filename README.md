# MIRRORS_FOXCLOUD.NET

## bootstrap.sh / The structure and purpose of the script and project
### The script was added to the system image "Ngrigorascenco_ubuntu_image"

### At system startup, the script will automatically:

1. Automatically configures the correct hostname for the passed domain name in the openstack instance (*Domain DNS must be preconfigured*)
	The correct hostname for the instance, with "-" : "mirrors-foxcloud-ru"
	Thus, the domain name will be correctly read by the openstack service and my script reconfigure in "mirrors.foxcloud.ru" 
2. The user must mount a new storage with a large amount of memory to the created instance
3. Based on the mounted storage, the script checks for storage /dev/vdb also /dev/vdb1.
4. Automatically makes disk layout and mounts it along the path /mnt/mirrordata (If there is no storage, the machine goes to sleep 1m, and waits for the drive to be connected) 
5. After Mount the storage, you need to reboot instance.
6. Distributives of ubuntu, centos, debian are automatically mirrored. The process is long. Duration about 1-1.5 hours.
7. Each time the script is run, the script checks which steps it completed successfully and automatically skips them.
8. In the end, a web host is configured with the creation of a ssl certificate, Let's Encrypt 


### Notes:
> **Execution logs can be viewed in real time in bootstrap.log / tail -f bootstrap.log**


The setup configuration on the client machine are in the source-files separately for each distribution.

## Instructions for synchronizing the mirror with the local machine 

1. Download source.list for the OS you need with the wget command to the desired folder
2. source.list's are located on the open link on our portal data3.foxcloud.net
3. shared link :	wget --no-check-certificate https://data3.foxcloud.net/index.php/s/jHRAEyAeOLe78SY


## Instructions for using  image "Ngrigorascenco_ubuntu_image" :

1. Create your new instance with image "Ngrigorascenco_ubuntu_image" + write correct hostname (exp. mirrors-foxcloud-net) it will be automated reconfigured to mirrors.foxcloud.net
2. Mount a new storage in the Volumes -> Create Volume -> Mount to your new instance
3. After Mount the storage, you need to reboot instance
4. Wait until complete installation (~1h) . You can watch the script execution progress in real time on a new instance. Log file path ~ / bootstrap.log 
5. After installing mirrors will be availability to "https://your-hostname-mirror.zone"
6. You can take the files you want via:
 *HTTP(one click on file to download)
 By editing source.list and get files via "apt update / apt install"



## Openstack has 2 images on the basis of which you can create instances:

 1. "NGrigorascenco_ubuntu_image: Based on Ubuntu 18[Bionic] and shows itself to be more stable than version 20.
 2. "mirroring_image_v1": Based on Ubuntu 20[Focal-Fossa]. Due to problems in this Ubuntu version with apt-mirror, the system sometimes does not work correctly. Therefore, in this case, sometimes you have to manually run the script.
