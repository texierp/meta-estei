DESCRIPTION = "Qt image"
LICENSE = "MIT"

inherit estei-base-image

IMAGE_INSTALL += "\
	qtbase \
	qtbase-plugins \
	qtbase-tools \
	qtbase-fonts \
	qt-simple-application \
"

export IMAGE_BASENAME = "qt-image"
