
QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = MyApplication
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        main.cpp \
        mainwindow.cpp

HEADERS += \
        mainwindow.h

FORMS += \
        mainwindow.ui

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../MySharedLibrary/release/ -lMySharedLibrary
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../MySharedLibrary/debug/ -lMySharedLibrary
else:unix: LIBS += -L$$OUT_PWD/../MySharedLibrary/ -lMySharedLibrary

INCLUDEPATH += $$PWD/../MySharedLibrary
DEPENDPATH += $$PWD/../MySharedLibrary

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../MyStaticLibrary/release/ -lMyStaticLibrary
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../MyStaticLibrary/debug/ -lMyStaticLibrary
else:unix: LIBS += -L$$OUT_PWD/../MyStaticLibrary/ -lMyStaticLibrary

INCLUDEPATH += $$PWD/../MyStaticLibrary
DEPENDPATH += $$PWD/../MyStaticLibrary

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../MyStaticLibrary/release/libMyStaticLibrary.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../MyStaticLibrary/debug/libMyStaticLibrary.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../MyStaticLibrary/release/MyStaticLibrary.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../MyStaticLibrary/debug/MyStaticLibrary.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../MyStaticLibrary/libMyStaticLibrary.a
