#!/bin/bash
CURRENT_PATH=/home/freya/jni
#���ű����ڵ�Ŀ¼λ��
NDKROOT_PATH=/home/freya/android-ndk-r13
#NDK����Ŀ¼
PLATFORM_X86_64_API=android-21
#��ӦX86_64��ANDROID API
PLATFORM_NDK_TOOLCHAIN_VERSION=4.9
#��Ӧ��TOOLCHAIN�汾

##########################################################������˽���##########################################################

#Ԥ����ʼ
trap "" INT
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/x86_64
rm -rf $CURRENT_PATH/freya_sdk_build_finished/x86_64/*.so
rm -rf $CURRENT_PATH/Application.mk
export PATH=$PATH:$NDKROOT_PATH
#Ԥ�������

#����X86_64��ʼ
echo "APP_PLATFORM := $PLATFORM_X86_64_API" >> $CURRENT_PATH/Application.mk
echo "APP_OPTIM := release" >> $CURRENT_PATH/Application.mk
echo "APP_ABI := x86_64" >> $CURRENT_PATH/Application.mk
echo "APP_STL := gnustl_static" >> $CURRENT_PATH/Application.mk
echo "APP_CPPFLAGS := -frtti -fexceptions" >> $CURRENT_PATH/Application.mk
echo "NDK_TOOLCHAIN_VERSION := $PLATFORM_NDK_TOOLCHAIN_VERSION" >> $CURRENT_PATH/Application.mk
ndk-build APP_BUILD_SCRIPT=$CURRENT_PATH/Android.mk NDK_APPLICATION_MK=$CURRENT_PATH/Application.mk NDK_PROJECT_PATH=$CURRENT_PATH/
rm -rf $CURRENT_PATH/Application.mk
cp -R $CURRENT_PATH/libs/x86_64/*.so $CURRENT_PATH/freya_sdk_build_finished/x86_64
#����X86_64����

#����ʼ
cd $CURRENT_PATH
chmod -R 777 *
#�������