TARGET_NO_BOOTLOADER := true
#TARGET_PROVIDES_INIT_RC := true

TARGET_ARCH := mips
TARGET_ARCH_VARIANT := mips32r2-fp-xburst
ARCH_MIPS_PAGE_SHIFT := 12
TARGET_CPU_ABI := mips
TARGET_CPU_ABI2 := mips
TARGET_BOARD_PLATFORM := M200
TARGET_BOARD_PLATFORM_GPU := GC1000
BOARD_EGL_CFG := device/ingenic/newton/config/egl.cfg
# TARGET_BOOTLOADER_BOARD_NAME MUST equals to $(ro.hardware).
TARGET_BOOTLOADER_BOARD_NAME := newton
TARGET_AAPT_CHARACTERISTICS := tablet
PRODUCT_VENDOR_KERNEL_HEADERS := hardware/ingenic/kernel-headers/3.0.8/kernel-headers

# Dalvik definition
WITH_JIT := true

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif

# Graphic definition
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Audio definition
USE_LEGACY_AUDIO_POLICY := 1
AUDIO_HAL_TYPE := alsa
#AUDIO_HAL_TYPE := oss


# Wi-Fi hardware selection
BOARD_HAVE_WIFI             := true
BOARD_WIFI_MODULE           := BCM43438
WIFIMAC_INTERFACE		:= efuse_crc32

# Wi-Fi hardware configure
ifeq ($(BOARD_WIFI_MODULE), BCM43438)
WIFI_DRIVER_FW_PATH_STA	:= "/system/lib/firmware/wifi/fw"
WIFI_DRIVER_FW_PATH_AP := "/system/lib/firmware/wifi/fw_apsta"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
endif
PRODUCT_DEFAULT_WIFI_CHANNELS := 13
#WIFI_DRIVER_MODULE_NAME :=  "bcmdhd"
#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcmdhd.ko"
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
#WIFI_DRIVER_FW_PATH_P2P := ""
WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/wifi.conf"
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd

# Bluetooth definition
BOARD_HAVE_BLUETOOTH_BCM    := true
BOARD_HAVE_BLUETOOTH        := true
#BOARD_BT_MODULE             := BCM20710
#BOARD_BT_MODULE             := BCM43438
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/ingenic/aw808/bluetooth

# Camera definition
#CAMERA_INTERFACE := misc
CAMERA_INTERFACE := v4l2
CAMERA_SUPPORT_VIDEOSNAPSHOT := false
CONVERT_WITH_SOFT := false
CAMERA_VERSION := 1
# Define facing information according to the order of sensors in 'struct ovisp_camera_client'
ID_FACING_FRONT := 0
#ID_FACING_BACK := 0

# File system definition
TARGET_USERIMAGES_USE_EXT4 := true
# system size is 700M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 734003200
# data size is 960M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1006632960
# cache size is 30M
BOARD_CACHEIMAGE_PARTITION_SIZE := 31457280
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

TARGET_RECOVERY_UI_LIB := librecovery_ui_newton
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_newton
TARGET_RELEASETOOLS_EXTENSIONS := device/ingenic/newton

# Invensense sensors definition
BOARD_HAL_SENSORS_USE_THIRD_PARTY := true
BOARD_HAL_SENSORS_THIRD_PARTY := invensense
BOARD_HAL_SENSORS_INVENSENSE_IIO := true
BOARD_HAL_SENSORS_AKM_COMPASS_INTEGRATED := true
BOARD_HAL_SENSORS_LIST := Gyroscope Accelerometer Magnetic Orientation

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# # Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := false

#VOICE_TRIGER_SUPPORT := true
