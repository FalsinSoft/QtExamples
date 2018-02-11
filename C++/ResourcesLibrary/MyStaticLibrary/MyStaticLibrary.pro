
QT       -= gui

TARGET = MyStaticLibrary
TEMPLATE = lib
CONFIG += staticlib

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        mystaticlibrary.cpp

HEADERS += \
        mystaticlibrary.h

RESOURCES += \
    mystaticlibrary.qrc
