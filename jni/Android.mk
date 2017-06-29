ROOT_PATH := $(call my-dir)
BASE_PATH := $(call my-dir)
LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE:= boost_date_time
LOCAL_SRC_FILES:= thirdparty/libboost/libboost_date_time-gcc-mt-1_53.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_filesystem
LOCAL_SRC_FILES:= thirdparty/libboost/libboost_filesystem-gcc-mt-1_53.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_iostreams
LOCAL_SRC_FILES:= thirdparty/libboost/libboost_iostreams-gcc-mt-1_53.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_program_options
LOCAL_SRC_FILES:= thirdparty/libboost/libboost_program_options-gcc-mt-1_53.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_regex
LOCAL_SRC_FILES:= thirdparty/libboost/libboost_regex-gcc-mt-1_53.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_signals
LOCAL_SRC_FILES:= thirdparty/libboost/libboost_signals-gcc-mt-1_53.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_system
LOCAL_SRC_FILES:= thirdparty/libboost/libboost_system-gcc-mt-1_53.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_thread
LOCAL_SRC_FILES:= thirdparty/libboost/libboost_thread-gcc-mt-1_53.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_MODULE:= libv8
#LOCAL_SRC_FILES:= v8/libv8.a
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
#include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/v8/Android.mk
LOCAL_PATH := $(BASE_PATH)

include $(LOCAL_PATH)/thirdparty/giflib/Android.mk
LOCAL_PATH := $(ROOT_PATH)

include $(LOCAL_PATH)/thirdparty/jpeg/Android.mk
LOCAL_PATH := $(ROOT_PATH)

include $(LOCAL_PATH)/thirdparty/libpng/Android.mk
LOCAL_PATH := $(ROOT_PATH)

#include $(LOCAL_PATH)/thirdparty/freetype/Android.mk
#LOCAL_PATH := $(ROOT_PATH)

#include $(LOCAL_PATH)/thirdparty/skia/Android.mk
#LOCAL_PATH := $(ROOT_PATH)



include $(CLEAR_VARS)


LOCAL_LDLIBS := -fno-exception -llog -lEGL -lGLESv2 -ldl -lm -lz

LOCAL_SRC_FILES:=	\
	util/fs.cpp	\
	util/FloatRect.cpp	\
	util/Base64.cpp	\
	util/Assert.cpp	\
	\
	src/CallBackFuncs.cpp	\
	src/ThreadPool.cpp	\
	src/Script.cpp	\
	graphics/Image.cpp \
	graphics/ImageData.cpp \
	graphics/PixelArray.cpp \
	loader/ImageLoader.cpp \
	loader/DCSocket.cpp \
	loader/JsLoader.cpp \
	loader/ResourceLoader.cpp \
	\
	graphics/webgl/WebGLBuffer.cpp	\
	graphics/webgl/WebGLShader.cpp	\
	graphics/webgl/WebGLGraphicsContext.cpp	\
	graphics/webgl/WebGLProgram.cpp	\
	graphics/webgl/WebGLTexture.cpp	\
	graphics/webgl/WebGLFrameBuffer.cpp	\
	graphics/webgl/WebGLRenderBuffer.cpp	\
	graphics/webgl/WebGLContextAttributes.cpp\
	graphics/webgl/WebGLGetInfo.cpp \
	graphics/webgl/WebGLActiveInfo.cpp\
	graphics/webgl/WebGLVertexArrayObjectOES.cpp\
	graphics/webgl/WebGLObject.cpp  \
	util/webgl/ArrayBuffer.cpp	\
	util/webgl/ArrayBufferView.cpp	\
	util/webgl/Float32Array.cpp	\
	util/webgl/Uint16Array.cpp	\
	util/webgl/Int32Array.cpp	\
	util/webgl/Int8Array.cpp	\
	util/webgl/Uint8Array.cpp	\
	util/webgl/Int16Array.cpp	\
	util/webgl/Uint32Array.cpp	\
	util/webgl/Float64Array.cpp	\
	\
	aligl2/effect.cpp \
	aligl2/graphics2d.cpp \
	aligl2/shaders.cpp \
	aligl2/sprite2d.cpp \
	aligl2/system.cpp \
	aligl2/AliTransformationMatrix.cpp	\
	aligl2/NativeEnv.cpp	\
	aligl2/gl3d_impl.cpp	\
	v8bindings/graphics/V8WebGLGraphicsContext.cpp	\
	v8bindings/graphics/V8Image.cpp \
	v8bindings/graphics/V8Orc2d.cpp	\
	v8bindings/graphics/V8Sprite.cpp	\
	v8bindings/util3d/V8ArrayBufferView.cpp	\
	v8bindings/util3d/V8ArrayBuffer.cpp	\
	v8bindings/V8GlobalFunctions.cpp	\
	v8bindings/V8Script.cpp	\
	v8bindings/V8ResourceManager.cpp \
	defines.cpp \
	mainjni.cpp
	
LOCAL_LDFLAGS := -export-dynamic -rdynamic
	
LOCAL_STATIC_LIBRARIES := boost_date_time
LOCAL_STATIC_LIBRARIES += boost_filesystem
LOCAL_STATIC_LIBRARIES += boost_iostreams
LOCAL_STATIC_LIBRARIES += boost_program_options
LOCAL_STATIC_LIBRARIES += boost_regex
LOCAL_STATIC_LIBRARIES += boost_signals
LOCAL_STATIC_LIBRARIES += boost_system
LOCAL_STATIC_LIBRARIES += boost_thread

LOCAL_STATIC_LIBRARIES	:=	\
	libv8 \
	libpng
	
LOCAL_SHARED_LIBRARIES :=	\
	libandroid_runtime	\
	libc \
	libEGL	\
	libGLESv2	\
	libstlport	\
	liblog	\
	libdl	\
	libicuuc	\
	libicudata	\
	libicui18n	\
	libutils	\
	libcutils	\
    libmedia	\
	libbinder	\
	libstdc++ \
	libsoundpool	\
	libcamera_client	\
	libboost \
	libsqlite

LOCAL_C_INCLUDES := \
	$(JNI_H_INCLUDE)	\
	external/icu4c/common	\
	external/icu4c/i18n	\
	$(LOCAL_PATH)/	\
	$(LOCAL_PATH)/v8/include \
	$(LOCAL_PATH)/graphics	\
	$(LOCAL_PATH)/graphics/webgl	\
	$(LOCAL_PATH)/graphics/canvas	\
	$(LOCAL_PATH)/loader	\
	$(LOCAL_PATH)/sql	\
	$(LOCAL_PATH)/src	\
	$(LOCAL_PATH)/util	\
	$(LOCAL_PATH)/util/webgl	\
	$(LOCAL_PATH)/jni	\
	$(LOCAL_PATH)/net	\
	$(LOCAL_PATH)/media	\
	$(LOCAL_PATH)/v8bindings	\
	$(LOCAL_PATH)/v8bindings/graphics	\
	$(LOCAL_PATH)/v8bindings/util3d	\
	$(LOCAL_PATH)/aligl2 \
	$(LOCAL_PATH)/android-14/usr/include \
	$(LOCAL_PATH)/thirdparty/libpng

#	$(LOCAL_PATH)/webview	\
#	$(LOCAL_PATH)/v8bindings/webview	\
		
LOCAL_CFLAGS := -D__ANDROID__ \
				-D__DEBUGMEMORY__ \
				-D__LOGMEMORY__ \
				-DHAVE_STRUCT_TIMEVAL \
				-DHAVE_CONFIG_H -DANDROID=1 \
				-D__POSIX__=1 \
				-DNATIVE_SURFACE=0 \
				-include "MemoryManager.h" \
				-D_ANDROID_4_0_0_=400 \
				-DUSE_SKIA_ANDROID=0 \
				-fpermissive

#APP_ABI := armeabi 

LOCAL_MODULE:= libalibabacloudx

include $(BUILD_SHARED_LIBRARY)



#include $(CLEAR_VARS)       
#LOCAL_MODULE    := Test_v8Engine
#LOCAL_SRC_FILES := Test_v8Engine.cpp
#
#LOCAL_LDLIBS := -fno-exception -llog -lEGL -lGLESv2 -ldl -lm
#
#LOCAL_C_INCLUDES := \
#	$(JNI_H_INCLUDE)	\
#	external/icu4c/common	\
#	external/icu4c/i18n	\
#	$(LOCAL_PATH)/	\
#	$(LOCAL_PATH)/v8/include \
#	$(LOCAL_PATH)/graphics	\
#	$(LOCAL_PATH)/graphics/webgl	\
#	$(LOCAL_PATH)/graphics/canvas	\
#	$(LOCAL_PATH)/loader	\
#	$(LOCAL_PATH)/sql	\
#	$(LOCAL_PATH)/src	\
#	$(LOCAL_PATH)/util	\
#	$(LOCAL_PATH)/util/webgl	\
#	$(LOCAL_PATH)/jni	\
#	$(LOCAL_PATH)/net	\
#	$(LOCAL_PATH)/media	\
#	$(LOCAL_PATH)/v8bindings	\
#	$(LOCAL_PATH)/v8bindings/graphics	\
#	$(LOCAL_PATH)/v8bindings/util3d	\
#	$(LOCAL_PATH)/aligl2 \
#	$(LOCAL_PATH)/android-14/usr/include
#						
#LOCAL_STATIC_LIBRARIES	:=	\
#	libv8
#	
#LOCAL_SHARED_LIBRARIES := \
#						libcutils \
#						libdl \
#						libutils \
#					    libstlport \
#					    libstdc++ \
#					    libalibabacloudx \
#						libandroid_runtime
#						
#LOCAL_LDFLAGS := -export-dynamic -rdynamic
#
#include $(BUILD_EXECUTABLE)   



