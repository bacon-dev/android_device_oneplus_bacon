#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/oneplus/bacon

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8974
BOARD_VENDOR := oneplus

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := krait

# APEX
TARGET_FLATTEN_APEX := true

# Assertions
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := bacon,A0001

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 0
USE_XML_AUDIO_POLICY_CONF := 1
USE_LEGACY_AUDIO_POLICY := 1

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/vendor/bin/mm-qcamera-daemon=23 \
    /system/vendor/bin/cameraserver=23 \
    /system/vendor/bin/mediaserver=23 \
APPLY_MSM8974_1440P_EGL_WORKAROUND := true
HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
ifneq ($(TARGET_BUILD_VARIANT),eng)
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
WITH_DEXPREOPT_DEBUG_INFO := false
DONT_DEXPREOPT_PREBUILTS := true
USE_DEX2OAT_DEBUG := false
endif
endif

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

# DUP
BUILD_BROKEN_DUP_RULES := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Exclude serif fonts for saving system.img size.
EXCLUDE_SERIF_FONTS := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_ROOT_EXTRA_FOLDERS := firmware persist
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1388314624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13271448576
BOARD_USERDATAEXTRAIMAGE_PARTITION_SIZE := 59914792960
BOARD_USERDATAEXTRAIMAGE_PARTITION_NAME := 64G

# Gestures
TARGET_DRAW_V_NODE := "/proc/touchpanel/down_arrow_enable"
TARGET_DRAW_INVERSE_V_NODE := "/proc/touchpanel/up_arrow_enable"
TARGET_DRAW_O_NODE := "/proc/touchpanel/letter_o_enable"
TARGET_DRAW_ARROW_LEFT_NODE := "/proc/touchpanel/left_arrow_enable"
TARGET_DRAW_ARROW_RIGHT_NODE := "/proc/touchpanel/right_arrow_enable"
TARGET_TWO_FINGER_SWIPE_NODE := "/proc/touchpanel/double_swipe_enable"

# Graphics
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_USE_COMPAT_GRALLOC_PERFORM := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# HWUI
HWUI_COMPILE_FOR_PERF := true

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_msm8974
TARGET_RECOVERY_DEVICE_MODULES := //$(DEVICE_PATH):libinit_msm8974
TARGET_LIBINIT_MSM8974_DEFINES_FILE := $(DEVICE_PATH)/init/init_bacon.cpp

# Kernel
BOARD_DTBTOOL_ARGS := --force-v2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
LZMA_RAMDISK_TARGETS := [boot,recovery]
TARGET_KERNEL_ARCH := arm

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=bacon user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE += loop.max_part=7
TARGET_KERNEL_CONFIG := fz_bacon_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8974
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(PWD)/prebuilts/gcc/linux-x86/arm/arm-eabi-linaro-7/bin

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# PHONY
BUILD_BROKEN_PHONY_TARGETS := true

# Power
TARGET_USES_NON_LEGACY_POWERHAL := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Radio
DISABLE_RILD_OEM_HOOK := false
TARGET_USES_OLD_MNC_FORMAT := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.recovery

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_oppo
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
PLATFORM_SEPOLICY_VERSION_TEST := false

# TWRP
ifeq ($(WITH_TWRP),true)
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)/twrp
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_USE_SBIN_VOLD := true
TW_THEME := portrait_hdpi
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
endif

# Wi-Fi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
PRODUCT_VENDOR_MOVE_ENABLED      := true
TARGET_DISABLE_WCNSS_CONFIG_COPY := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# Inherit from the proprietary version
include vendor/oneplus/bacon/BoardConfigVendor.mk
