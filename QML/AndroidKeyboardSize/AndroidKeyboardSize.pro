QT += qml quick androidextras

SOURCES += main.cpp

RESOURCES += qml.qrc

OTHER_FILES += \
    android/AndroidManifest.xml \
    android/src/com/falsinsoft/example/keyboardsize/AppActivity.java \
    android/src/com/falsinsoft/example/keyboardsize/VirtualKeyboardListener.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
