################################################################################
#
# lvlg-desktop-v1.0 for dongshanpi
#
################################################################################
		  			 		  						  					  				 	   		  	  	 	  
LVGL_DESKTOP_VERSION = 6a0e670b5e09ab4b529dc62f4f29adabf05c9486
LVGL_DESKTOP_SITE = https://github.com/DongshanPI/lv_100ask_linux_desktop.git
LVGL_DESKTOP_SITE_METHOD = git
LVGL_DESKTOP_DEPENDENCIES = libinput dbus
LVGL_DESKTOP_LICENSE = GPL-3.0
		  			 		  						  					  				 	   		  	  	 	  
  			 		  					  					  				 	   		  	  	 	  
define LVGL_DESKTOP_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef
		  			 		  						  					  				 	   		  	  	 	  
define LVGL_DESKTOP_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/lvgl
endef

define LVGL_DESKTOP_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D  $(BR2_EXTERNAL_ST_PATH)/package/lvgl-desktop/S05lvgl \
		$(TARGET_DIR)/etc/init.d/S99myirhmi2
endef
 			 		  						  					  				 	   		  	  	 	  
$(eval $(generic-package))