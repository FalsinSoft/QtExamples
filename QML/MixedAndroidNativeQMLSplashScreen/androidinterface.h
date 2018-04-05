#pragma once

#include <QObject>

class AndroidInterface : public QObject
{
    Q_OBJECT
public:
    AndroidInterface();
    Q_INVOKABLE void hideSplashScreen();
};
