TEMPLATE = subdirs

SUBDIRS += \
    MyApplication \
    MySharedLibrary \
    MyStaticLibrary

MyApplication.depends = MySharedLibrary MyStaticLibrary
