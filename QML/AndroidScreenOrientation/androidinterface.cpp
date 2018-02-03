
#include <QtAndroidExtras>
#include "androidinterface.h"

AndroidInterface::AndroidInterface()
{
}

bool AndroidInterface::setScreenOrientation(int orientation)
{
	QAndroidJniObject activity = QtAndroid::androidActivity();

	if(activity.isValid())
	{
		activity.callMethod<void>("setRequestedOrientation", "(I)V", orientation);
		return true;
	}
	
	return false;
}
