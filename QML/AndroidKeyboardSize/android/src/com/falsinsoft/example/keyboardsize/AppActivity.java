package com.falsinsoft.example.keyboardsize;

import android.app.Activity;

public class AppActivity extends org.qtproject.qt5.android.bindings.QtActivity
{
    public AppActivity()
    {
        VirtualKeyboardListener.Init(this);
    }
}
