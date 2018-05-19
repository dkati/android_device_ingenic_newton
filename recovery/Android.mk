#ifneq ($(filter watch,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES += bootable/recovery
LOCAL_SRC_FILES := recovery_ui.cpp

# should match TARGET_RECOVERY_UI_LIB set in BoardConfig.mk
LOCAL_MODULE := librecovery_ui_$(TARGET_DEVICE)

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

# Edify extension functions for doing bootloader updates on watch device.

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES += bootable/recovery
LOCAL_SRC_FILES := recovery_updater.c

# should match TARGET_RECOVERY_UPDATER_LIBS set in BoardConfig.mk
LOCAL_MODULE := librecovery_updater_watch

include $(BUILD_STATIC_LIBRARY)

#endif
