package com.falsinsoft.example.batterylevel;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.content.Intent;
import android.os.BatteryManager;
import android.content.Context;

public class BatteryLevelListener
{
    private static Activity m_ActivityInstance;

    public static void Init(Activity ActivityInstance)
    {
        m_ActivityInstance = ActivityInstance;
    }

    public static native void BatteryStateChanged(int Level, boolean OnCharge);

    public static void InstallBatteryListener()
    {
        IntentFilter BatteryLevelFilter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);

        BroadcastReceiver BatteryLevelReceiver = new BroadcastReceiver()
        {
            public void onReceive(Context context, Intent intent)
            {
                boolean OnCharge = (intent.getIntExtra(BatteryManager.EXTRA_PLUGGED, -1) == 0) ? false : true;
                int Level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
                int Scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);

                if(Level >= 0 && Scale > 0)
                {
                    BatteryStateChanged((Level * 100) / Scale, OnCharge);
                }
            }
        };

        m_ActivityInstance.registerReceiver(BatteryLevelReceiver, BatteryLevelFilter);
    }
}
