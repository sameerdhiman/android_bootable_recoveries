LOCAL_PATH := $(call my-dir)

# Build libtwrpmtp library

include $(CLEAR_VARS)

LOCAL_MODULE := libtwrpmtp
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS = -D_FILE_OFFSET_BITS=64 -DMTP_DEVICE -DMTP_HOST -fno-strict-aliasing
LOCAL_C_INCLUDES += $(LOCAL_PATH) bionic external/stlport/stlport frameworks/base/include system/core/include bionic/libc/private/
LOCAL_SRC_FILES = \
    btree.cpp \
    MtpDataPacket.cpp \
    MtpDebug.cpp \
    MtpDevice.cpp \
    MtpDeviceInfo.cpp \
    MtpEventPacket.cpp \
    MtpObjectInfo.cpp \
    MtpPacket.cpp \
    MtpProperty.cpp \
    MtpRequestPacket.cpp \
    MtpResponsePacket.cpp \
    MtpServer.cpp \
    MtpStorage.cpp \
    MtpStorageInfo.cpp \
    MtpStringBuffer.cpp \
    MtpUtils.cpp \
    mtp_MtpServer.cpp \
    twrpMtp.cpp \
    mtp_MtpDatabase.cpp \
    node.cpp
LOCAL_SHARED_LIBRARIES += libz libc libusbhost libstdc++ libstlport libdl libcutils libutils

ifneq ($(TW_MTP_DEVICE),)
	LOCAL_CFLAGS += -DUSB_MTP_DEVICE=$(TW_MTP_DEVICE)
endif

include $(BUILD_SHARED_LIBRARY)

# Build twrpmtp binary / executable

include $(CLEAR_VARS)

LOCAL_MODULE := twrpmtp
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS = -D_FILE_OFFSET_BITS=64 -DMTP_DEVICE -DMTP_HOST -DTWRPMTP
LOCAL_C_INCLUDES += $(LOCAL_PATH) bionic external/stlport/stlport frameworks/base/include system/core/include bionic/libc/private/
LOCAL_SRC_FILES = \
    btree.cpp \
    MtpDataPacket.cpp \
    MtpDebug.cpp \
    MtpDevice.cpp \
    MtpDeviceInfo.cpp \
    MtpEventPacket.cpp \
    MtpObjectInfo.cpp \
    MtpPacket.cpp \
    MtpProperty.cpp \
    MtpRequestPacket.cpp \
    MtpResponsePacket.cpp \
    MtpServer.cpp \
    MtpStorage.cpp \
    MtpStorageInfo.cpp \
    MtpStringBuffer.cpp \
    MtpUtils.cpp \
    mtp_MtpServer.cpp \
    twrpMtp.cpp \
    mtp_MtpDatabase.cpp \
    node.cpp
LOCAL_SHARED_LIBRARIES += libz libc libusbhost libstdc++ libstlport libdl libcutils libutils
include $(BUILD_EXECUTABLE)
