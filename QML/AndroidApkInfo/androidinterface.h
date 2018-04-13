#pragma once

#include <QObject>
#include <QVariantMap>

class AndroidInterface : public QObject
{
    Q_OBJECT
public:
    AndroidInterface();
    Q_INVOKABLE QVariantMap getApkInfo();
};
