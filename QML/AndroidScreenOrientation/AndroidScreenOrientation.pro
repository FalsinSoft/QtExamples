QT += qml quick androidextras
CONFIG += c++11

SOURCES += main.cpp \
    androidinterface.cpp

RESOURCES += qml.qrc

DISTFILES += \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    androidinterface.h
