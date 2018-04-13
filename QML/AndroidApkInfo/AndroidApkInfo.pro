QT += qml quick quickcontrols2 androidextras
CONFIG += c++11

SOURCES += \
        main.cpp \
        androidinterface.cpp

HEADERS += \
        androidinterface.h

RESOURCES += qml.qrc

DISTFILES += \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
