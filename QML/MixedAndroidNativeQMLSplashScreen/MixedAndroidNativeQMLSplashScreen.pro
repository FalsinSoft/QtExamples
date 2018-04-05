QT += qml quick quickcontrols2 widgets androidextras
CONFIG += c++11

LIBS += -ljnigraphics

HEADERS += \
    androidimageprovider.h \
    androidinterface.h

SOURCES += main.cpp \
    androidimageprovider.cpp \
    androidinterface.cpp

RESOURCES += qml.qrc

DISTFILES += \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

