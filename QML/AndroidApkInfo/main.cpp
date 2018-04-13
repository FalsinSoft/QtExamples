#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "androidinterface.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    AndroidInterface android;

    engine.rootContext()->setContextProperty("android", &android);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
