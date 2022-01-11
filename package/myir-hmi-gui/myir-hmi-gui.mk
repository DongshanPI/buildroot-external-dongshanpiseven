################################################################################
#
# myir-hmi-v2.0 for weidongshan@qq.com
#
################################################################################
		  			 		  						  					  				 	   		  	  	 	  
MYIR_HMI_GUI_VERSION = 8fdbfedb47dcdfeef38a10152fea0c0c0fc53dc5
MYIR_HMI_GUI_SITE = https://gitee.com/weidongshan/Qtmxapp-desktop.git
MYIR_HMI_GUI_SITE_METHOD = git
MYIR_HMI_GUI_DEPENDENCIES = qt5multimedia qt5base qt5declarative qt5quickcontrols qt5quickcontrols2
MYIR_HMI_GUI_LICENSE = GPL-3.0
		  			 		  						  					  				 	   		  	  	 	  
define MYIR_HMI_GUI_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
endef
		  			 		  						  					  				 	   		  	  	 	  
define MYIR_HMI_GUI_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef
		  			 		  						  					  				 	   		  	  	 	  
define MYIR_HMI_GUI_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/mxapp2 \
		$(TARGET_DIR)/usr/bin/mxapp2 
	mkdir -p $(TARGET_DIR)/usr/share/;
	mkdir -p $(TARGET_DIR)/usr/share/qt5/
	mkdir -p  $(TARGET_DIR)/usr/share/myir/; 
	mkdir -p  $(TARGET_DIR)/usr/lib/fonts/; 
	mkdir -p  $(TARGET_DIR)/usr/share/fonts/ttf/; 
	cp -rdpf $(@D)/Samplelibrary/share/qt5/cursor.json $(TARGET_DIR)/usr/share/qt5/;
	cp -rdpf $(@D)/Samplelibrary/lib/fonts/msyh.ttc $(TARGET_DIR)/usr/lib/fonts/;
	cp -rdpf $(@D)/Samplelibrary/lib/fonts/msyh.ttc $(TARGET_DIR)/usr/share/fonts/ttf/;
	cp -rdpf $(@D)/Samplelibrary/myir $(TARGET_DIR)/usr/share/;
endef
		  			 		  						  					  				 	   		  	  	 	  
define MYIR_HMI_GUI_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D  $(BR2_EXTERNAL_ST_PATH)/package/myir-hmi-gui/S99myirhmi2 \
		$(TARGET_DIR)/etc/init.d/S99myirhmi2
endef

define MYIR_HMI_GUI_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 777 $(BR2_EXTERNAL_ST_PATH)/package/myir-hmi-gui/start.sh \
		$(TARGET_DIR)/usr/bin/start.sh 
	$(INSTALL) -D -m 644 $(BR2_EXTERNAL_ST_PATH)/package/myir-hmi-gui/myir.service \
		$(TARGET_DIR)/usr/lib/systemd/system/myir.service
endef
		  			 		  						  					  				 	   		  	  	 	  
$(eval $(generic-package))
