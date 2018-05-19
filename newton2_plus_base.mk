PRODUCT_PACKAGES := \
    libfwdlockengine \
    OpenWnn \
    libWnnEngDic \
    libWnnJpnDic \
    libwnndict \
    WAPPushManager

# Additional settings used in all AOSP builds
PRODUCT_PROPERTY_OVERRIDES := \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.config.ringtone=Ring_Synth_04.ogg \
    ro.config.notification_sound=pixiedust.ogg

# Put en_US first in the list, so make it default.
PRODUCT_LOCALES := en_US

# Include drawables for all densities
PRODUCT_AAPT_CONFIG := normal

# Get some sounds
$(call inherit-product-if-exists, frameworks/base/data/sounds/AllAudio.mk)

# Get the TTS language packs
$(call inherit-product-if-exists, external/svox/pico/lang/all_pico_languages.mk)

# Get a list of languages.
$(call inherit-product, $(SRC_TARGET_DIR)/product/locales_full.mk)


PRODUCT_PACKAGES += \
    Bluetooth \
    Gallery2 \
    Provision \
    SystemUI \
    WallpaperCropper \
    wpa_supplicant

PRODUCT_PACKAGES += \
    clatd \
    clatd.conf \
    pppd \
    screenrecord

PRODUCT_PACKAGES += \
    librs_jni \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer

PRODUCT_PACKAGES += \
    audio.primary.default \
    audio_policy.default \
    local_time.default \
    vibrator.default \
    power.default

PRODUCT_PACKAGES += \
    local_time.default

PRODUCT_COPY_FILES += \
    frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only

$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/dancing-script/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/carrois-gothic-sc/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/coming-soon/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/cutive-mono/fonts.mk)
$(call inherit-product-if-exists, external/lohit-fonts/fonts.mk)
$(call inherit-product-if-exists, external/noto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product-if-exists, frameworks/webview/chromium/chromium.mk)

PRODUCT_PACKAGES += \
    BasicDreams \
    CaptivePortalLogin \
    CertInstaller \
    DocumentsUI \
    Exchange2 \
    ExternalStorageProvider \
    FusedLocation \
    InputDevices \
    KeyChain \
    Keyguard \
    ManagedProvisioning \
    PicoTts \
    PacProcessor \
    libpac \
    PrintSpooler \
    ProxyHandler \
    Settings \
    SharedStorageBackup \
    Telecom \
    VpnDialogs

#    TeleService \
    MmsService


PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=OnTheHunt.ogg \
    ro.config.alarm_alert=Alarm_Classic.ogg

PRODUCT_PACKAGES += \
    DefaultContainerService \
    TelephonyProvider \
    UserDictionaryProvider \
    atrace \
    libandroidfw \
    libaudiopreprocessing \
    libaudioutils \
    libfilterpack_imageproc \
    libgabi++ \
    libmdnssd \
    libnfc_ndef \
    libpowermanager \
    libspeexresampler \
    libstagefright_soft_aacdec \
    libstagefright_soft_aacenc \
    libstagefright_soft_amrdec \
    libstagefright_soft_amrnbenc \
    libstagefright_soft_amrwbenc \
    libstagefright_soft_flacenc \
    libstagefright_soft_g711dec \
    libstagefright_soft_gsmdec \
    libstagefright_soft_h264dec \
    libstagefright_soft_h264enc \
    libstagefright_soft_hevcdec \
    libstagefright_soft_mp3dec \
    libstagefright_soft_mpeg4dec \
    libstagefright_soft_mpeg4enc \
    libstagefright_soft_opusdec \
    libstagefright_soft_rawdec \
    libstagefright_soft_vorbisdec \
    libstagefright_soft_vpxdec \
    libstagefright_soft_vpxenc \
    libvariablespeed \
    libwebrtc_audio_preprocessing \
    mdnsd \
    requestsync \
    wifi-service

PRODUCT_PACKAGES += \
    BackupRestoreConfirmation \
    HTMLViewer \
    MediaProvider \
    PackageInstaller \
    SettingsProvider \
    Shell \
    bcc \
    bu \
    com.android.future.usb.accessory \
    com.android.location.provider \
    com.android.location.provider.xml \
    com.android.media.remotedisplay \
    com.android.media.remotedisplay.xml \
    com.android.mediadrm.signer \
    com.android.mediadrm.signer.xml \
    drmserver \
    ethernet-service \
    framework-res \
    idmap \
    installd \
    ip \
    ip-up-vpn \
    ip6tables \
    iptables \
    keystore \
    keystore.default \
    libbcc \
    libOpenMAXAL \
    libOpenSLES \
    libdownmix \
    libdrmframework \
    libdrmframework_jni \
    libfilterfw \
    libkeystore \
    libsqlite_jni \
    libwilhelm \
    logd \
    make_ext4fs \
    e2fsck \
    resize2fs \
    screencap \
    sensorservice \
    uiautomator \
    uncrypt \
    voip-common \
    webview \
    wifi-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml

# The order of PRODUCT_BOOT_JARS matters.
PRODUCT_BOOT_JARS := \
    core-libart \
    conscrypt \
    okhttp \
    core-junit \
    bouncycastle \
    ext \
    framework \
    telephony-common \
    voip-common \
    ims-common \
    android.policy \
    apache-xml

#   core-libart \
    conscrypt \
    okhttp \
    core-junit \
    bouncycastle \
    ext \
    framework \
    telephony-common \
    voip-common \
    ims-common \
    mms-common \
    android.policy \
    apache-xml


# The order of PRODUCT_SYSTEM_SERVER_JARS matters.
PRODUCT_SYSTEM_SERVER_JARS := \
    services \
    ethernet-service \
    wifi-service

PRODUCT_RUNTIMES := runtime_libart_default

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.zygote=zygote32
PRODUCT_COPY_FILES += \
    system/core/rootdir/init.zygote32.rc:root/init.zygote32.rc

# Base modules (will move elsewhere, previously user tagged)
PRODUCT_PACKAGES += \
    20-dns.conf \
    95-configured \
    appwidget \
    appops \
    am \
    android.policy \
    android.test.runner \
    app_process \
    applypatch \
    blkid \
    bmgr \
    bugreport \
    content \
    dhcpcd \
    dhcpcd-run-hooks \
    dnsmasq \
    dpm \
    framework \
    fsck_msdos \
    ime \
    input \
    javax.obex \
    libandroid \
    libandroid_runtime \
    libandroid_servers \
    libaudioeffect_jni \
    libaudioflinger \
    libaudiopolicyservice \
    libaudiopolicymanager \
    libbundlewrapper \
    libcamera_client \
    libcameraservice \
    libdl \
    libdrmclearkeyplugin \
    libeffectproxy \
    libeffects \
    libinput \
    libinputflinger \
    libiprouteutil \
    libjnigraphics \
    libldnhncr \
    libmedia \
    libmedia_jni \
    libmediaplayerservice \
    libmtp \
    libnetd_client \
    libnetlink \
    libnetutils \
    libpdfium \
    libreference-ril \
    libreverbwrapper \
    libril \
    librtp_jni \
    libsensorservice \
    libskia \
    libsonivox \
    libsoundpool \
    libsoundtrigger \
    libsoundtriggerservice \
    libsqlite \
    libstagefright \
    libstagefright_amrnb_common \
    libstagefright_avc_common \
    libstagefright_enc_common \
    libstagefright_foundation \
    libstagefright_omx \
    libstagefright_yuv \
    libusbhost \
    libutils \
    libvisualizer \
    libvorbisidec \
    libmediandk \
    libwifi-service \
    media \
    media_cmd \
    mediaserver \
    monkey \
    mtpd \
    ndc \
    netcfg \
    netd \
    ping \
    ping6 \
    platform.xml \
    pppd \
    pm \
    racoon \
    run-as \
    schedtest \
    sdcard \
    services \
    settings \
    svc \
    tc \
    vdc \
    vold \
    wm

PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
    frameworks/base/preloaded-classes:system/etc/preloaded-classes)

# Note: it is acceptable to not have a compiled-classes file. In that case, all boot classpath
#       classes will be compiled.
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
    frameworks/base/compiled-classes:system/etc/compiled-classes)

$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)
