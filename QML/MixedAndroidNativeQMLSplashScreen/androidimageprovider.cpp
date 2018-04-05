#include "androidimageprovider.h"
#include <android/bitmap.h>
#include <QDebug>
#include <QApplication>
#include <QDesktopWidget>
#include <QScreen>

AndroidImageProvider::AndroidImageProvider() : QQuickImageProvider(QQmlImageProviderBase::Image)
{
}

QImage AndroidImageProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    QAndroidJniObject activity = QtAndroid::androidActivity();
    QAndroidJniObject resources, bitmap, packageName;
    int resourceID = 0;
    QImage Image;

    resources = activity.callObjectMethod("getResources", "()Landroid/content/res/Resources;");
    packageName = activity.callObjectMethod("getPackageName", "()Ljava/lang/String;");

    resourceID = resources.callMethod<jint>("getIdentifier",
                                            "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I",
                                            QAndroidJniObject::fromString(id).object<jstring>(),
                                            QAndroidJniObject::fromString("drawable").object<jstring>(),
                                            packageName.object<jstring>()
                                            );

    bitmap = QAndroidJniObject::callStaticObjectMethod("android/graphics/BitmapFactory",
                                                       "decodeResource",
                                                    "(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;",
                                                    resources.object(),
                                                    static_cast<jint>(resourceID)
                                                    );
    Image = AndroidBitmapToImage(bitmap);

    if(!Image.isNull())
    {
        *size = Image.size();
        if(requestedSize.isValid()) return Image.scaled(requestedSize);
    }

    return Image;
}

// Function get from:
// https://www.kdab.com/qt-on-android-how-to-convert-qt-images-to-android-images-and-vice-versa-2/
QImage AndroidImageProvider::AndroidBitmapToImage(const QAndroidJniObject &JniBmp)
{
    QAndroidJniEnvironment env;
    AndroidBitmapInfo info;
    if (AndroidBitmap_getInfo(env, JniBmp.object(), &info) != ANDROID_BITMAP_RESULT_SUCCESS)
        return QImage();

    QImage::Format format;
    switch (info.format) {
        case ANDROID_BITMAP_FORMAT_RGBA_8888:
            format = QImage::Format_RGBA8888;
            break;
        case ANDROID_BITMAP_FORMAT_RGB_565:
            format = QImage::Format_RGB16;
            break;
        case ANDROID_BITMAP_FORMAT_RGBA_4444:
            format = QImage::Format_ARGB4444_Premultiplied;
            break;
        case ANDROID_BITMAP_FORMAT_A_8:
            format = QImage::Format_Alpha8;
            break;
        default:
            return QImage();
    }

    void *pixels;
    if (AndroidBitmap_lockPixels(env, JniBmp.object(), &pixels) != ANDROID_BITMAP_RESULT_SUCCESS)
        return QImage();

    QImage image(info.width, info.height, format);

    if (info.stride == uint32_t(image.bytesPerLine())) {
        memcpy((void*)image.constBits(), pixels, info.stride * info.height);
    } else {
        uchar *bmpPtr = static_cast<uchar *>(pixels);
        const unsigned width = std::min(info.width, (uint)image.width());
        const unsigned height = std::min(info.height, (uint)image.height());
        for (unsigned y = 0; y < height; y++, bmpPtr += info.stride)
            memcpy((void*)image.constScanLine(y), bmpPtr, width);
    }

    if (AndroidBitmap_unlockPixels(env, JniBmp.object()) != ANDROID_BITMAP_RESULT_SUCCESS)
        return QImage();

    return image;
}

