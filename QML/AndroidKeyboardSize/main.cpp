#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtAndroidExtras>

QObject *pQmlRootObject = NULL;

void AndroidVirtualKeyboardStateChanged(JNIEnv *env, jobject thiz, jint VirtualKeyboardHeight)
{
    Q_UNUSED(env)
    Q_UNUSED(thiz)

    if(pQmlRootObject != NULL)
    {
        QMetaObject::invokeMethod(pQmlRootObject,
                                  "androidVirtualKeyboardStateChanged",
                                  Qt::AutoConnection,
                                  Q_ARG(QVariant, VirtualKeyboardHeight)
                                  );
    }
}

void InitializeForAndroid()
{
    JNINativeMethod methods[] = {
        {
            "VirtualKeyboardStateChanged",
            "(I)V",
            reinterpret_cast<void*>(AndroidVirtualKeyboardStateChanged)
        }
    };

    QAndroidJniObject javaClass("com/falsinsoft/example/keyboardsize/VirtualKeyboardListener");
    QAndroidJniEnvironment env;

    jclass objectClass = env->GetObjectClass(javaClass.object<jobject>());

    env->RegisterNatives(objectClass,
        methods,
        sizeof(methods) / sizeof(methods[0]));
    env->DeleteLocalRef(objectClass);

    QAndroidJniObject::callStaticMethod<void>("com/falsinsoft/example/keyboardsize/VirtualKeyboardListener", "InstallKeyboardListener");
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
