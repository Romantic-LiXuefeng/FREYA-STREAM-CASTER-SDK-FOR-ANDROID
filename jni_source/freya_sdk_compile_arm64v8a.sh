#!/bin/bash
CURRENT_PATH=/home/freya/jni
#���ű����ڵ�Ŀ¼λ��
NDKROOT_PATH=/home/freya/android-ndk-r13
#NDK����Ŀ¼
PLATFORM_ARM64V8A_API=android-21
#��ӦARM64-V8A��ANDROID API
PLATFORM_NDK_TOOLCHAIN_VERSION=4.9
#��Ӧ��TOOLCHAIN�汾

##########################################################������˽���##########################################################

#Ԥ����ʼ
trap "" INT
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/arm64-v8a
rm -rf $CURRENT_PATH/freya_sdk_build_finished/arm64-v8a/*.so
rm -rf $CURRENT_PATH/Application.mk
export PATH=$PATH:$NDKROOT_PATH
#Ԥ�������

#����ARM64-V8A��ʼ
echo "APP_PLATFORM := $PLATFORM_ARM64V8A_API" >> $CURRENT_PATH/Application.mk
echo "APP_OPTIM := release" >> $CURRENT_PATH/Application.mk
echo "APP_ABI := arm64-v8a" >> $CURRENT_PATH/Application.mk
echo "APP_STL := gnustl_static" >> $CURRENT_PATH/Application.mk
echo "APP_CPPFLAGS := -frtti -fexceptions" >> $CURRENT_PATH/Application.mk
echo "NDK_TOOLCHAIN_VERSION := $PLATFORM_NDK_TOOLCHAIN_VERSION" >> $CURRENT_PATH/Application.mk
ndk-build APP_BUILD_SCRIPT=$CURRENT_PATH/Android.mk NDK_APPLICATION_MK=$CURRENT_PATH/Application.mk NDK_PROJECT_PATH=$CURRENT_PATH/
rm -rf $CURRENT_PATH/Application.mk
cp -R $CURRENT_PATH/libs/arm64-v8a/*.so $CURRENT_PATH/freya_sdk_build_finished/arm64-v8a
#����ARM64-V8A����

#����ʼ
cd $CURRENT_PATH
chmod -R 777 *
#�������