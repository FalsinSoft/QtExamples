package com.falsinsoft.example.batterylevel;

import android.app.Activity;

public class AppActivity extends org.qtproject.qt5.android.bindings.QtActivity
{
    public AppActivity()
    {
        BatteryLevelListener.Init(this);
    }
}
