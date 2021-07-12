#!/bin/bash

debmirror --nosource --passive --i18n --host=deb.debian.org --root=debian --method=http --progress --ignore-release-gpg --dist=stretch  --arch=amd64,i386  --section=main,conrib,non-free /mnt/mirrordata/debian