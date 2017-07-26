package com.falsinsoft.example.signalstrength;

import android.app.Activity;
import android.content.Context;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.telephony.SignalStrength;
import android.util.Log;

public class SignalStrengthListener
{
    private static Activity m_ActivityInstance;

    public static void Init(Activity ActivityInstance)
    {
        m_ActivityInstance = ActivityInstance;
    }

    public static native void SignalStrengthChanged(int SignalStrength);

    public static void InstallSignalStrengthListener()
    {
        final TelephonyManager TelephonyMngr = (TelephonyManager)m_ActivityInstance.getSystemService(Context.TELEPHONY_SERVICE);

        m_ActivityInstance.runOnUiThread(new Runnable()
        {
            @Override
            public void run()
            {
                TelephonyMngr.listen(new SignalStateListener(), PhoneStateListener.LISTEN_SIGNAL_STRENGTHS);
            }
        });
    }

    private static class SignalStateListener extends PhoneStateListener
    {
        @Override
        public void onSignalStrengthsChanged(SignalStrength signalStrength)
        {
            super.onSignalStrengthsChanged(signalStrength);

            SignalStrengthChanged(signalStrength.getGsmSignalStrength());
        }
    }
}
