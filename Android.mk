LOCAL_PATH := $(call my-dir)

ifeq ($(BUILD_PREBUILT_JDSP),true)

ifeq ($(JDSP_USE_BP),true)
        JDSP_DRIVER := bp
    else
        JDSP_DRIVER := ff
endif

ifeq ($PRODUCT_MANUFACTURER),HUAWEI)
    JDSP_TARGET := huawei
    else ifneq (,$(filter $(TARGET_ARCH), x86 x86_64))
        JDSP_TARGET := x86
    else
         JDSP_TARGET := arm
endif

include $(CLEAR_VARS)
LOCAL_MODULE := JamesDSPPrebuilt
LOCAL_MODULE_TAGS := debug
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SHARED_LIBRARIES := libjamesdsp
LOCAL_SRC_FILES := $(JDSP_DRIVER)/JamesDSPManager.apk
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := libjamesdspprebuilt
LOCAL_MODULE_STEM := libjamesdsp
LOCAL_MODULE_TAGS := debug
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/soundfx
LOCAL_SRC_FILES := $(JDSP_DRIVER)/$(JDSP_TARGET)/libjamesdsp.so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := privapp-permissions-james.dsp
LOCAL_MODULE_TAGS := debug
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_SUFFIX := .xml
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := privapp-permissions-james.dsp.xml
include $(BUILD_PREBUILT)

endif
