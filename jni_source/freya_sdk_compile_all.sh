#!/bin/bash
CURRENT_PATH=/home/freya/jni
#���ű����ڵ�Ŀ¼λ��
NDKROOT_PATH=/home/freya/android-ndk-r13
#NDK����Ŀ¼
PLATFORM_ARM_API=android-15
#��ӦARM��ANDROID API
PLATFORM_ARMV7A_API=android-15
#��ӦARMV7-A��ANDROID API
PLATFORM_ARM64V8A_API=android-21
#��ӦARM64-V8A��ANDROID API
PLATFORM_X86_API=android-15
#��ӦX86��ANDROID API
PLATFORM_X86_64_API=android-21
#��ӦX86_64��ANDROID API
PLATFORM_MIPS_API=android-15
#��ӦMIPS��ANDROID API
PLATFORM_MIPS64_API=android-21
#��ӦMIPS64��ANDROID API
PLATFORM_NDK_TOOLCHAIN_VERSION=4.9
#��Ӧ��TOOLCHAIN�汾

##########################################################������˽���##########################################################

#Ԥ����ʼ
trap "" INT
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/armeabi
rm -rf $CURRENT_PATH/freya_sdk_build_finished/armeabi/*.so
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/armeabi-v7a
rm -rf $CURRENT_PATH/freya_sdk_build_finished/armeabi-v7a/*.so
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/arm64-v8a
rm -rf $CURRENT_PATH/freya_sdk_build_finished/arm64-v8a/*.so
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/x86
rm -rf $CURRENT_PATH/freya_sdk_build_finished/x86/*.so
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/x86_64
rm -rf $CURRENT_PATH/freya_sdk_build_finished/x86_64/*.so
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/mips
rm -rf $CURRENT_PATH/freya_sdk_build_finished/mips/*.so
mkdir -p $CURRENT_PATH/freya_sdk_build_finished/mips64
rm -rf $CURRENT_PATH/freya_sdk_build_finished/mips64/*.so
rm -rf $CURRENT_PATH/Application.mk
export PATH=$PATH:$NDKROOT_PATH
#Ԥ�������

#����ARM��ʼ
echo "APP_PLATFORM := $PLATFORM_ARM_API" >> $CURRENT_PATH/Application.mk
echo "APP_OPTIM := release" >> $CURRENT_PATH/Application.mk
echo "APP_ABI := armeabi" >> $CURRENT_PATH/Application.mk
echo "APP_STL := gnustl_static" >> $CURRENT_PATH/Application.mk
echo "APP_CPPFLAGS := -frtti -fexceptions" >> $CURRENT_PATH/Application.mk
echo "NDK_TOOLCHAIN_VERSION := $PLATFORM_NDK_TOOLCHAIN_VERSION" >> $CURRENT_PATH/Application.mk
ndk-build APP_BUILD_SCRIPT=$CURRENT_PATH/Android.mk NDK_APPLICATION_MK=$CURRENT_PATH/Application.mk NDK_PROJECT_PATH=$CURRENT_PATH/
rm -rf $CURRENT_PATH/Application.mk
cp -R $CURRENT_PATH/libs/armeabi/*.so $CURRENT_PATH/freya_sdk_build_finished/armeabi
#����ARM����

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

#����X86��ʼ
echo "APP_PLATFORM := $PLATFORM_X86_API" >> $CURRENT_PATH/Application.mk
echo "APP_OPTIM := release" >> $CURRENT_PATH/Application.mk
echo "APP_ABI := x86" >> $CURRENT_PATH/Application.mk
echo "APP_STL := gnustl_static" >> $CURRENT_PATH/Application.mk
echo "APP_CPPFLAGS := -frtti -fexceptions" >> $CURRENT_PATH/Application.mk
echo "NDK_TOOLCHAIN_VERSION := $PLATFORM_NDK_TOOLCHAIN_VERSION" >> $CURRENT_PATH/Application.mk
ndk-build APP_BUILD_SCRIPT=$CURRENT_PATH/Android.mk NDK_APPLICATION_MK=$CURRENT_PATH/Application.mk NDK_PROJECT_PATH=$CURRENT_PATH/
rm -rf $CURRENT_PATH/Application.mk
cp -R $CURRENT_PATH/libs/x86/*.so $CURRENT_PATH/freya_sdk_build_finished/x86
#����X86����

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

#����MIPS��ʼ
echo "APP_PLATFORM := $PLATFORM_MIPS_API" >> $CURRENT_PATH/Application.mk
echo "APP_OPTIM := release" >> $CURRENT_PATH/Application.mk
echo "APP_ABI := mips" >> $CURRENT_PATH/Application.mk
echo "APP_STL := gnustl_static" >> $CURRENT_PATH/Application.mk
echo "APP_CPPFLAGS := -frtti -fexceptions" >> $CURRENT_PATH/Application.mk
echo "NDK_TOOLCHAIN_VERSION := $PLATFORM_NDK_TOOLCHAIN_VERSION" >> $CURRENT_PATH/Application.mk
ndk-build APP_BUILD_SCRIPT=$CURRENT_PATH/Android.mk NDK_APPLICATION_MK=$CURRENT_PATH/Application.mk NDK_PROJECT_PATH=$CURRENT_PATH/
rm -rf $CURRENT_PATH/Application.mk
cp -R $CURRENT_PATH/libs/mips/*.so $CURRENT_PATH/freya_sdk_build_finished/mips
#����MIPS����

#����MIPS64��ʼ
echo "APP_PLATFORM := $PLATFORM_MIPS64_API" >> $CURRENT_PATH/Application.mk
echo "APP_OPTIM := release" >> $CURRENT_PATH/Application.mk
echo "APP_ABI := mips64" >> $CURRENT_PATH/Application.mk
echo "APP_STL := gnustl_static" >> $CURRENT_PATH/Application.mk
echo "APP_CPPFLAGS := -frtti -fexceptions" >> $CURRENT_PATH/Application.mk
echo "NDK_TOOLCHAIN_VERSION := $PLATFORM_NDK_TOOLCHAIN_VERSION" >> $CURRENT_PATH/Application.mk
ndk-build APP_BUILD_SCRIPT=$CURRENT_PATH/Android.mk NDK_APPLICATION_MK=$CURRENT_PATH/Application.mk NDK_PROJECT_PATH=$CURRENT_PATH/
rm -rf $CURRENT_PATH/Application.mk
cp -R $CURRENT_PATH/libs/mips64/*.so $CURRENT_PATH/freya_sdk_build_finished/mips64
#����MIPS64����

#����ʼ
cd $CURRENT_PATH
chmod -R 777 *
#�������