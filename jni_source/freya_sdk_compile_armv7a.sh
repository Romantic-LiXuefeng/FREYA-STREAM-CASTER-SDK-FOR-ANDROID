#!/bin/bash
CURRENT_PATH=/home/freya/jni
#���ű����ڵ�Ŀ¼λ��
NDKROOT_PATH=/home/freya/android-ndk-r13
#NDK����Ŀ¼
PLATFORM_ARMV7A_API=android-15
#��ӦARMV7-A��ANDROID API
PLATFORM_NDK_TOOLCHAIN_VERSION=4.9
#��Ӧ��TOOLCHAIN�汾

##########################################################������˽���##########################################################

#Ԥ����ʼ
trap "" INT
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/armeabi-v7a
rm -rf $CURRENT_PATH/freya_sdk_build_finished/armeabi-v7a/*.so
rm -rf $CURRENT_PATH/Application.mk
export PATH=$PATH:$NDKROOT_PATH
#Ԥ�������

#����ARMV7-A��ʼ
echo "APP_PLATFORM := $PLATFORM_ARMV7A_API" >> $CURRENT_PATH/Application.mk
echo "APP_OPTIM := release" >> $CURRENT_PATH/Application.mk
echo "APP_ABI := armeabi-v7a" >> $CURRENT_PATH/Application.mk
echo "APP_STL := gnustl_static" >> $CURRENT_PATH/Application.mk
echo "APP_CPPFLAGS := -frtti -fexceptions" >> $CURRENT_PATH/Application.mk
echo "NDK_TOOLCHAIN_VERSION := $PLATFORM_NDK_TOOLCHAIN_VERSION" >> $CURRENT_PATH/Application.mk
ndk-build APP_BUILD_SCRIPT=$CURRENT_PATH/Android.mk NDK_APPLICATION_MK=$CURRENT_PATH/Application.mk NDK_PROJECT_PATH=$CURRENT_PATH/
rm -rf $CURRENT_PATH/Application.mk
cp -R $CURRENT_PATH/libs/armeabi-v7a/*.so $CURRENT_PATH/freya_sdk_build_finished/armeabi-v7a
#����ARMV7-A����

#����ʼ
cd $CURRENT_PATH
chmod -R 777 *
#�������