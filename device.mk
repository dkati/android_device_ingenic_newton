# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/ingenic/newton/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Tools
PRODUCT_PACKAGES += \
    mke2fs          \
    mke2fs_host     \
    e2fsck          \
    e2fsck_host     \
    setup_fs

# Voice Wakeup(DMIC)
PRODUCT_PACKAGES += \
    voicewakeup
# Voice Wakeup(DMIC)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/ivModel_v21.irf:system/etc/ivModel_v21.irf

# Hal
PRODUCT_PACKAGES +=      \
    camera.newton        \
    audio.primary.newton \
    lights.newton        \
    haptic.newton         \
    libdmmu              \
    libdmmu2             \
    libjzipu

#Invensense sensors related
PRODUCT_PACKAGES +=                        \
    libmplmpu                              \
    libmllite                              \
    libinvensense_hal                      \
    sensors.newton                         \
    com.invensense.android.hardware.pedapi \
    libmpl_ped_jni                         \
    libalg

# audio alsa
PRODUCT_PACKAGES +=	\
    libtinyalsa		\
    libaudioutils	\
    libaudioroute	\
    tinymix	\
    tinycap	\
    tinyplay	\
    tinypcminfo

# Camera related<Test only>
#PRODUCT_PACKAGES += \
    LegacyCamera

# Media
PRODUCT_PACKAGES += \
    libstagefrighthw	          \
    libstagefright_hard_vlume     \
    libstagefright_hard_alume     \
    libstagefright_hard_x264hwenc \
    libstagefright_xbdemux        \
    libOMX_Core

#media player temporarily use awesomeplayer.
PRODUCT_PROPERTY_OVERRIDES += \
   media.stagefright.use-awesome=true

# Media Codecs List
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/config/All_Setting.txt:system/etc/All_Setting.txt

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/init.board.rc:root/init.newton.rc                   \
    $(LOCAL_PATH)/config/init.board.usb.rc:root/init.newton.usb.rc           \
    $(LOCAL_PATH)/config/init.recovery.board.rc:root/init.recovery.newton.rc \
    $(LOCAL_PATH)/config/fstab.board:root/fstab.newton                       \
    $(LOCAL_PATH)/config/ueventd.board.rc:root/ueventd.newton.rc


#load serial numbers
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/serial_numbers.sh:root/sbin/script/serial_numbers.sh

# WIFI firmware
#ifeq ($(BOARD_HAVE_WIFI), true)
#ifeq ($(BOARD_WIFI_MODULE), BCM43438)
PRODUCT_COPY_FILES += \
    hardware/ingenic/wlan/wlan-bcm43438/fw_bcm43438_A1.bin:/system/lib/firmware/wifi/fw_43438_a1 \
    hardware/ingenic/wlan/wlan-bcm43438/bcmdhd.cal:/system/lib/firmware/wifi/cal_43438_a1 \
    hardware/ingenic/wlan/wlan-bcm43438/fw_bcmdhd.bin:/system/lib/firmware/wifi/fw_43438_a0 \
    hardware/ingenic/wlan/wlan-bcm43438/bcmdhd.cal:/system/lib/firmware/wifi/cal_43438_a0 \
    hardware/ingenic/wlan/wlan-bcm43438/fw_bcmdhd_apsta.bin:/system/lib/firmware/wifi/fw_apsta_43438_a0 \
	hardware/ingenic/wlan/wlan-bcm43438/fw_bcm43438_A1.bin:/system/lib/firmware/wifi/fw_apsta_43438_a1

#endif
# WIFI configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf               \
    $(LOCAL_PATH)/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml
#endif
# Bluetooth packages
PRODUCT_PACKAGES += \
    audio.a2dp.default
PRODUCT_PACKAGES +=       \
	bluetooth_default  \
	audio.a2dp.default \
	libbt-vendor       \
	libbt-hci          \
	libbt-utils
# Bluetooth firmware
#ifeq ($(BOARD_HAVE_BLUETOOTH), true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/bt_addr:system/etc/firmware/bcm43438/bt_addr               \
    hardware/ingenic/bluetooth/bt-bcm43438/BCM43438_A1.hcd:system/etc/firmware/bcm43438/BCM43430A1.hcd \
    hardware/ingenic/bluetooth/bt-bcm43438/BCM43438.hcd:system/etc/firmware/bcm43438/BCMFIRMWARE.hcd
# Bluetooth configuration files
#PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \
    system/bluetooth/data/input.conf:system/etc/bluetooth/input.conf  \
    system/bluetooth/data/audio.conf:system/etc/bluetooth/audio.conf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/hardware_adapter.sh:root/sbin/script/hardware_adapter.sh                   \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    $(LOCAL_PATH)/config/init.bluetooth.rc:root/init.bluetooth.rc \
	$(LOCAL_PATH)/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml
#endif
# Audio configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/mixer_paths.xml:system/etc/mixer_paths.xml     \
    $(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# ICM30630 firmware & related
PRODUCT_COPY_FILES += \
    hardware/invensense/30630/firmware/icm30630fw.bin:/system/lib/firmware/icm30630fw.bin \
    $(LOCAL_PATH)/config/init.icm30630.rc:root/init.icm30630.rc
# Sensors configuration files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# GPS
#PRODUCT_PACKAGES += \
    gps.newton
#PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

# logo
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/logo.rle:root/logo.rle                           \
    $(LOCAL_PATH)/bootanimation.zip:system/media/bootanimation.zip

# Key layout file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/gpio-keys.kl:/system/usr/keylayout/gpio-keys.kl

# Tool for debugging
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/fb2bmp:/system/bin/fb2bmp \
    $(LOCAL_PATH)/prebuilts/regrw:/system/bin/regrw

# Libs for iwop apps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/libiwds.so:/system/lib/libiwds.so \
    $(LOCAL_PATH)/prebuilts/libsafeparcel.so:/system/lib/libsafeparcel.so

#############################################################################################

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/ingenic/newton/overlay

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES +=    \
    ro.debuggable=1              \
    service.adb.root=1
endif
PRODUCT_PROPERTY_OVERRIDES +=           \
    persist.sys.timezone=Asia/Shanghai  \
    ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES +=    \
    wifi.interface=wlan0         \
    wifi.supplicant_scan_interval=15

#http://developer.android.com/guide/practices/screens_support.html#support
# Supporting Multiple Screens
# ldpi(120), mdpi(160), hdpi(240), xhdpi(320), xxhdpi(480), xxxhdpi(640)
PRODUCT_PROPERTY_OVERRIDES +=    \
    ro.opengles.version=131072

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only


# Fix USE_OPENGL_RENDERER by ro.kernel.qemu && ro.kernel.qemu.gles
#
# Code location: You can check the exactly meanings in these files.
# <android_dir>/frameworks/native/opengl/libs/EGL/Loader.cpp
# <android_dir>/frameworks/base/core/jni/android_view_GLES20Canvas.cpp
#
# Usages:
#   ro.kernel.qemu = <number>      -> tells us that we run inside the emulator
#      ro.kernel.qemu = 1          #have emulator
#
#   ro.kernel.qemu.gles=<number>   -> choose one of them, tells us the GLES GPU emulation status
#      ro.kernel.qemu.gles = 0     #SurfaceFlinger && HardwareRender not use GPU
#      ro.kernel.qemu.gles = 1     #SurfaceFlinger && HardwareRender use GPU
#      ro.kernel.qemu.gles = 2     #SurfaceFlinger use GPU && HardwareRender not use GPU
#
# Examples: We can just use two methods.
#   1. App Not use OpenGL_Render
#      ro.kernel.qemu=1
#      ro.kernel.qemu.gles=2
#
#   2. App use OpenGL_Render
#      ro.kernel.qemu=1
#      ro.kernel.qemu.gles=1

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=64m \
    dalvik.vm.heapgrowthlimit=64m \
    dalvik.vm.heapsize=384m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m

PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=true
#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.jit.codecachesize=0

#PRODUCT_PROPERTY_OVERRIDES += ro.adb.secure=1
PRODUCT_PROPERTY_OVERRIDES += ro.build.selinux=1

# setup dalvik vm configs.
#$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
#$(call inherit-product, hardware/ingenic/display/gpu/gpu-gc1000/gpu-gc1000-v5-08/gpu.mk)
#$(call inherit-product, hardware/ingenic/display/gpu/gpu-gc1000/gpu-gc1000-v5-0.11.p1/gpu.mk)
#$(call inherit-product, hardware/ingenic/display/gpu/gpu-gc1000/gpu-gc1000-v5-0.11.p3/gpu.mk)
#$(call inherit-product, hardware/ingenic/display/gpu/gpu-gc1000/gpu-gc1000-v5-0.11.p4/gpu.mk)
$(call inherit-product, hardware/ingenic/display/gpu/gpu-gc1000/gpu-gc1000-v5-0.11.p6/gpu-gc1000-android-l/gpu.mk)
$(call inherit-product, hardware/ingenic/media/firmware/firmware/xbomx.mk)
# inherit from the non-open-source side, if present
$(call inherit-product-if-exists, vendor/ingenic/newton/products/addon.mk)
$(call inherit-product-if-exists, vendor/google/products/gms.mk)
