#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtAndroidExtras>

QObject *pQmlRootObject = NULL;

void AndroidSignalStrengthChanged(JNIEnv *env, jobject thiz, jint signalStrength)
{
    Q_UNUSED(env)
    Q_UNUSED(thiz)

    if(pQmlRootObject != NULL)
    {
        QMetaObject::invokeMethod(pQmlRootObject,
                                  "androidSignalStrengthChanged",
                                  Qt::AutoConnection,
                                  Q_ARG(QVariant, signalStrength)
                                  );
    }
}

void InitializeForAndroid()
{
    JNINativeMethod methods[] = {
        {
            "SignalStrengthChanged",
            "(I)V",
            reinterpret_cast<void*>(AndroidSignalStrengthChanged)
        }
    };

    QAndroidJniObject javaClass("com/falsinsoft/example/signalstrength/SignalStrengthListener");
    QAndroidJniEnvironment env;

    jclass objectClass = env->GetObjectClass(javaClass.object<jobject>());

    env->RegisterNatives(objectClass,
        methods,
        sizeof(methods) / sizeof(methods[0]));
    env->DeleteLocalRef(objectClass);

    QAndroidJniObject::callStaticMethod<void>("com/falsinsoft/example/signalstrength/SignalStrengthListener", "InstallSignalStrengthListener");
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    pQmlRootObject = engine.rootObjects().at(0);
    InitializeForAndroid();

    return app.exec();
}
