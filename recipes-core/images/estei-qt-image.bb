DESCRIPTION = "Qt image"
LICENSE = "MIT"

require estei-basic-image.bb

IMAGE_INSTALL += "\
	packagegroup-core-full-cmdline \
	packagegroup-distro-base \
	packagegroup-machine-base \
	packagegroup-qt5-toolchain-target \
"

export IMAGE_BASENAME = "qt-image"
