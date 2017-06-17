#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtAndroidExtras>

QObject *pQmlRootObject = NULL;

void AndroidBatteryStateChanged(JNIEnv *env, jobject thiz, jint level, jboolean onCharge)
{
    Q_UNUSED(env)
    Q_UNUSED(thiz)

    if(pQmlRootObject != NULL)
    {
        QMetaObject::invokeMethod(pQmlRootObject,
                                  "androidBatteryStateChanged",
                                  Qt::AutoConnection,
                                  Q_ARG(QVariant, level),
                                  Q_ARG(QVariant, onCharge)
                                  );
    }
}

void InitializeForAndroid()
{
    JNINativeMethod methods[] = {
        {
            "BatteryStateChanged",
            "(IZ)V",
            reinterpret_cast<void*>(AndroidBatteryStateChanged)
        }
    };

    QAndroidJniObject javaClass("com/falsinsoft/example/batterylevel/BatteryLevelListener");
    QAndroidJniEnvironment env;

    jclass objectClass = env->GetObjectClass(javaClass.object<jobject>());

    env->RegisterNatives(objectClass,
        methods,
        sizeof(methods) / sizeof(methods[0]));
    env->DeleteLocalRef(objectClass);

    QAndroidJniObject::callStaticMethod<void>("com/falsinsoft/example/batterylevel/BatteryLevelListener", "InstallBatteryListener");
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    pQmlRootObject = engine.rootObjects().at(0);
    InitializeForAndroid();

    return app.exec();
}
