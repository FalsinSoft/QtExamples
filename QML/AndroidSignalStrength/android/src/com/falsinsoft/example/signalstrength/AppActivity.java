package com.falsinsoft.example.signalstrength;

import android.app.Activity;

public class AppActivity extends org.qtproject.qt5.android.bindings.QtActivity
{
    public AppActivity()
    {
        SignalStrengthListener.Init(this);
    }
}
