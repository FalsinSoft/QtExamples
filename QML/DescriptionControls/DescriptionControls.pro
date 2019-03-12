QT       += qml quick quickcontrols2

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = DescriptionControls
TEMPLATE = app

CONFIG += c++11

SOURCES += \
        main.cpp

RESOURCES += \
    qml.qrc
