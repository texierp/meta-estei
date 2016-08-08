DESCRIPTION = "Qt image"
LICENSE = "MIT"

inherit estei-base-image

IMAGE_INSTALL += "\
	packagegroup-qt5-toolchain-target \
"

export IMAGE_BASENAME = "qt-image"
