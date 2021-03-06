################################################################################
#
# linux-drivers
#
################################################################################

LINUX_DRIVERS_VERSION = 2e923a486e3e5a57d09cba9d1cdc7caa54b7370f
LINUX_DRIVERS_SITE = $(call github,jgsun,linux-drivers,$(LINUX_DRIVERS_VERSION))
LINUX_DRIVERS_DEPENDENCIES = linux
LINUX_DRIVERS_INSTALL_MOD_DIR = boxing
LINUX_DRIVERS_LICENSE = GPLv2
LINUX_DRIVERS_LICENSE_FILES = COPYING
LINUX_DRIVERS_INSTALL_STAGING = YES

LINUX_DRIVERS_MAKE_OPTS += BUILD_TEST_DRIVERS=$(BR2_PACKAGE_LINUX_DRIVERS_TEST_DRIVERS)

define LINUX_DRIVERS_BUILD_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules \
		$(LINUX_DRIVERS_MAKE_OPTS) \
		KBUILD_EXTRA_SYMBOLS=$(LINUX_DRIVERS_EXTRA_SYMBOLS)
endef

define LINUX_DRIVERS_INSTALL_TARGET_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install \
		INSTALL_MOD_STRIP=1 \
		INSTALL_MOD_DIR=$(LINUX_DRIVERS_INSTALL_MOD_DIR) \
		$(LINUX_DRIVERS_MAKE_OPTS)
endef

define LINUX_DRIVERS_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) headers_install \
		DESTDIR=$(STAGING_DIR) \
		$(LINUX_DRIVERS_MAKE_OPTS)
endef

$(eval $(generic-package))
