#!/bin/bash

rsync -avzqlH --delete --delay-updates rsync://ftp.osuosl.org/centos/7/ /mnt/mirrordata/centos