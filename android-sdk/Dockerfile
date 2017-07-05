FROM openjdk:8u131-jdk

ARG TARGET_IP
ARG APK_URL

ENV ANDROID_HOME=/opt/adb


RUN mkdir -p ${ANDROID_HOME} &&\
  cd ${ANDROID_HOME} &&\
  wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip \
  unzip platform-tools-latest-linux.zip \ 
  cd tools/bin &&\
  echo y | ./sdkmanager platform-tools  

WORKSPACE ${ANDROID_HOME}


