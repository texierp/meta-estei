DESCRIPTION = "Basic image"
LICENSE = "MIT"

# set password to estei
inherit extrausers
EXTRA_USERS_PARAMS = " \
    usermod -P estei root; \
    "

inherit core-image

# Package gesture
IMAGE_FEATURES += "package-management"

# SSH gesture
IMAGE_FEATURES += "ssh-server-openssh"

# To Include splash at boot-up
IMAGE_FEATURES += "splash"

CORE_OS_INSTALL = " \
    	tzdata \
    	dbus \
    	sysfsutils \
    	mtd-utils \
    	mtd-utils-ubifs \
 "

KERNEL_EXTRA_INSTALL = " \
    	kernel-modules \
 "
 
WIFI_SUPPORT_INSTALL = " \
    	iw \
    	linux-firmware-ath9k \
    	linux-firmware-ralink \
    	linux-firmware-rtl8192ce \
    	linux-firmware-rtl8192cu \
    	linux-firmware-rtl8192su \
    	wireless-tools \
    	wpa-supplicant \
 "

IMAGE_INSTALL += " \
	${CORE_OS_INSTALL} \
	${KERNEL_EXTRA_INSTALL} \
	${WIFI_SUPPORT_INSTALL} \
	openssh-sftp-server \
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

# some default locales
IMAGE_LINGUAS ?= "fr-fr en-us"

# In case we use systemd
IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"

export IMAGE_BASENAME = "base-image"

