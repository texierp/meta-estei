DESCRIPTION = "Basic image"
LICENSE = "MIT"

inherit core-image

SPLASH = "psplash-estei"

IMAGE_FEATURES += "debug-tweaks package-management ssh-server-dropbear splash"

IMAGE_INSTALL += " \
	kernel-modules \
	openssh-sftp-server \
	packagegroup-estei-base \
    	${CORE_IMAGE_EXTRA_INSTALL} \
"

PACKAGE_EXCLUDE = "packagegroup-base-extended"

export IMAGE_BASENAME = "basic-image"
