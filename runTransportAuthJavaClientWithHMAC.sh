#!/bin/sh -ex
#
# This requires a Conscrypt build from the MASQUE branch, e.g.
# https://gitlab.com/eighthave/conscrypt/-/jobs/2184223295

conscrypt_jar=conscrypt-openjdk-uber-2.5.2.jar
so_dir=META-INF/native

algorithm=HMAC
if [ -n "$1" ]; then
    algorithm=$1
fi

javac -h src/main/java/ -classpath .:${conscrypt_jar} \
      src/main/java/com/example/conscrypt_transportauthclient/HTTPSClient.java


java \
    -Djava.library.path=`pwd`/${so_dir} \
    -classpath .:src/main/java:${conscrypt_jar} \
    com.example.conscrypt_transportauthclient.HTTPSClient \
    $algorithm \
    `pwd`/src/main/resources/config.properties

