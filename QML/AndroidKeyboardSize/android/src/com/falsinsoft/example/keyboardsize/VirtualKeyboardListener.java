package com.falsinsoft.example.keyboardsize;

import android.app.Activity;
import android.graphics.Rect;
import android.view.View;
import android.view.Window;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

public class VirtualKeyboardListener
{
    private static Activity m_ActivityInstance;

    public static void Init(Activity ActivityInstance)
    {
        m_ActivityInstance = ActivityInstance;
    }

    public static native void VirtualKeyboardStateChanged(int VirtualKeyboardHeight);

    public static void InstallKeyboardListener()
    {
        final View AppRootView = ((ViewGroup)m_ActivityInstance.findViewById(android.R.id.content)).getChildAt(0);

        AppRootView.getViewTreeObserver().addOnGlobalLayoutListener(
            new ViewTreeObserver.OnGlobalLayoutListener()
            {
                @Override
                public void onGlobalLayout()
                {
                    int ScreenHeight, VirtualKeyboardHeight;
                    Rect WindowFrameRect = new Rect();
                    Rect ContentFrameRect = new Rect();

                    m_ActivityInstance.getWindow().getDecorView().getWindowVisibleDisplayFrame(WindowFrameRect);
                    AppRootView.getWindowVisibleDisplayFrame(ContentFrameRect);
                    ScreenHeight = AppRootView.getRootView().getHeight();

                    VirtualKeyboardHeight = (ScreenHeight - (ContentFrameRect.bottom - ContentFrameRect.top) - WindowFrameRect.top);

                    if(VirtualKeyboardHeight < 100) VirtualKeyboardHeight = 0;

                    VirtualKeyboardStateChanged(VirtualKeyboardHeight);
                }
            }
        );
    }
}
