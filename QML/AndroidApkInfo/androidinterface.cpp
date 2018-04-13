
#include <QtAndroidExtras>
#include <QDebug>
#include "androidinterface.h"

AndroidInterface::AndroidInterface()
{
}

QVariantMap AndroidInterface::getApkInfo()
{
    QAndroidJniObject activity = QtAndroid::androidActivity();
    QAndroidJniObject packageName, packageManager, packageInfo;
    QAndroidJniEnvironment env;
    QVariantMap info;

    packageManager = activity.callObjectMethod("getPackageManager", "()Landroid/content/pm/PackageManager;");
    packageName = activity.callObjectMethod("getPackageName", "()Ljava/lang/String;");

    packageInfo = packageManager.callObjectMethod("getPackageInfo",
                                                  "(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;",
                                                  packageName.object<jstring>(),
                                                  0
                                                  );
    if(!env->ExceptionCheck())
    {
        info["packageName"] = packageInfo.getObjectField<jstring>("packageName").toString();
        info["versionName"] = packageInfo.getObjectField<jstring>("versionName").toString();
        info["versionCode"] = packageInfo.getField<jint>("versionCode");
    }
    else
    {
        env->ExceptionClear();
    }

    return info;
}
