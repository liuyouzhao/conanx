package com.alibaba.cloudx.unittest;

import android.content.Context;
import android.os.Handler;
import android.os.Message;

import com.alibaba.cloudx.platform.SoundManager;

public class SoundPoolTest {
    public static void go(Context ctx) {
        SoundManager.initSoundManager(ctx);
        SoundManager.loadSoundFromAsset("menu.mp3", false);
        SoundManager.loadSoundFromAsset("menu2.mp3", false);
        SoundManager.loadSoundFromAsset("menu3.mp3", false);
        SoundManager.loadSoundFromAsset("menu4.mp3", false);

        Message msg = soundHandler.obtainMessage(0, "menu.mp3");
        soundHandler.sendMessageDelayed(msg, 4000);

        msg = soundHandler.obtainMessage(0, "menu2.mp3");
        soundHandler.sendMessageDelayed(msg, 6000);

        msg = soundHandler.obtainMessage(0, "menu3.mp3");
        soundHandler.sendMessageDelayed(msg, 8000);

        msg = soundHandler.obtainMessage(0, "menu4.mp3");
        soundHandler.sendMessageDelayed(msg, 10000);
    }

    public static Handler soundHandler = new Handler() {
        public void handleMessage(Message msg) {
            String name = (String) msg.obj;

            if(SoundManager.soundReady(name)) {
                SoundManager.playSound(name);
            }
            else {
                Message msg2 = soundHandler.obtainMessage(0, name);
                soundHandler.sendMessageDelayed(msg2, 2000);
            }
        }
    };
}
