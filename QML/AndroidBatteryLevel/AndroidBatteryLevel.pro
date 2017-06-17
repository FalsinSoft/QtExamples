QT += qml quick androidextras

SOURCES += main.cpp

RESOURCES += qml.qrc

OTHER_FILES += \
    android/AndroidManifest.xml \
    android/src/com/falsinsoft/example/batterylevel/AppActivity.java \
    android/src/com/falsinsoft/example/batterylevel/BatteryLevelListener.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
