QT += qml quick androidextras

SOURCES += main.cpp

RESOURCES += qml.qrc

DISTFILES += \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
