#!/bin/sh -ex
#
# This requires a Conscrypt build from the MASQUE branch, e.g.
# https://gitlab.com/eighthave/conscrypt/-/jobs/2184223295

conscrypt_jar=conscrypt-openjdk-uber-2.5.2.jar
so_dir=META-INF/native

if [ ! -e ${so_dir}/*.so ]; then
    unzip $conscrypt_jar \
	  $so_dir/conscrypt_openjdk_jni-windows-x86.dll \
	  $so_dir/conscrypt_openjdk_jni-windows-x86_64.dll \
	  $so_dir/libconscrypt_openjdk_jni-linux-x86_64.so \
	  $so_dir/libconscrypt_openjdk_jni-osx-x86_64.dylib
    ln -s libconscrypt_openjdk_jni-linux-x86_64.so \
       $so_dir/libconscrypt_openjdk_jni.so
fi

javac -h src/main/java/ -classpath .:${conscrypt_jar} \
      src/main/java/com/example/conscrypt_transportauth/FileResourcesUtils.java \
      src/main/java/com/example/conscrypt_transportauth/HTTPSServer.java

java \
    -Djava.library.path=`pwd`/${so_dir} \
    -classpath .:src/main/java:${conscrypt_jar} \
    com.example.conscrypt_transportauth.HTTPSServer \
    `pwd`/src/main/resources/config.properties

