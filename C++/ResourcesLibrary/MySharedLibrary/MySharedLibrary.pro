
QT       -= gui

TARGET = MySharedLibrary
TEMPLATE = lib

DEFINES += MYSHAREDLIBRARY_LIBRARY

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        mysharedlibrary.cpp

HEADERS += \
        mysharedlibrary.h \
        mysharedlibrary_global.h 

RESOURCES += \
    mysharedlibrary.qrc
