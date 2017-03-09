FROM openjdk:8u121-jdk

ENV ANDROID_HOME=/opt/android
ENV KODI_VERSION=17.0-Krypton

# http://mirrors.kodi.tv/releases/android/arm/

RUN mkdir -p ${ANDROID_HOME} &&\
  cd ${ANDROID_HOME} &&\
  wget -q -O tools.zip https://dl.google.com/android/repository/tools_r25.2.3-linux.zip &&\
  wget -q -O kodi.apk http://mirrors.kodi.tv/releases/android/arm/kodi-${KODI_VERSION}-armeabi-v7a.apk
  unzip tools.zip &&\
  cd tools/bin &&\
  echo y | ./sdkmanager platform-tools  

WORKSPACE ${ANDROID_HOME}


