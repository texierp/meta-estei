DESCRIPTION = "Basic image"
LICENSE = "MIT"

inherit core-image

IMAGE_FEATURES += "debug-tweaks package-management ssh-server-openssh splash"

IMAGE_INSTALL += " \
	kernel-modules \
	openssh-sftp-server \
	tzdata \
	packagegroup-core-full-cmdline \
	packagegroup-distro-base \
	packagegroup-machine-base \
	packagegroup-estei-base \
    	${CORE_IMAGE_EXTRA_INSTALL} \
"

PACKAGE_EXCLUDE = "packagegroup-base-extended"

set_local_timezone() {
    ln -sf /usr/share/zoneinfo/Europe/Paris ${IMAGE_ROOTFS}/etc/localtime
}

ROOTFS_POSTPROCESS_COMMAND += " \
    set_local_timezone ; \
 "

export IMAGE_BASENAME = "base-image"
