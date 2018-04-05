#ifndef ANDROIDIMAGEPROVIDER_H
#define ANDROIDIMAGEPROVIDER_H

#include <QQuickImageProvider>
#include <QtAndroidExtras>

class AndroidImageProvider : public QQuickImageProvider
{
public:
    AndroidImageProvider();
    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize);
private:
    QImage AndroidBitmapToImage(const QAndroidJniObject &JniBmp);
};

#endif // ANDROIDIMAGEPROVIDER_H
