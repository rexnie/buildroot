################################################################################
#
# ply 
#
################################################################################

PLY_VERSION = 2.1.1
PLY_SITE = https://github.com/wkz/ply/releases/download/$(PLY_VERSION)
# fetched from Github, with no configure script
PLY_AUTORECONF = YES
PLY_DEPENDENCIES = host-bison host-flex
PLY_LICENSE = GPL-2.0+
PLY_LICENSE_FILES = COPYING

$(eval $(autotools-package))
