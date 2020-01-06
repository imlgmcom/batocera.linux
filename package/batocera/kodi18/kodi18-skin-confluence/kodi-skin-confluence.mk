################################################################################
#
# kodi-skin-confluence
#
################################################################################

KODI18_SKIN_CONFLUENCE_VERSION = cffcb8320003e6048abe4b26316e5d5f3d50eac9
KODI18_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI18_SKIN_CONFLUENCE_VERSION))
KODI18_SKIN_CONFLUENCE_LICENSE = GPL-2.0
KODI18_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
KODI18_SKIN_CONFLUENCE_DEPENDENCIES = kodi18

define KODI18_SKIN_CONFLUENCE_BUILD_CMDS
	$(HOST_DIR)/bin/TexturePacker -input $(@D)/media/ -output $(@D)/media/Textures.xbt -dupecheck -use_none
endef

define KODI18_SKIN_CONFLUENCE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
	cp -dpfr $(@D)/* $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.jpg -delete
	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.png -delete
endef

$(eval $(generic-package))
