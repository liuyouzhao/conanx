package com.alibaba.cloudx;

import java.io.InputStream;

import org.apache.http.util.EncodingUtils;

import com.alibaba.cloudx.platform.ResourceManager;
import com.alibaba.cloudx.unittest.SoundPoolTest;
import com.aliyun.cloudapp.directcanvas.JNILIB;

import android.os.Bundle;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.graphics.Color;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;

public class MainActivity extends Activity {
  /// this is the canvas
    GLView                  mCanvas;
    boolean mHasInited = false;

    public String readCode() {
        String fileName = "orc2dTest.js";
        String res = "";
        try {
            InputStream in = getResources().getAssets().open(fileName);
            int length = in.available();
            byte[] buffer = new byte[length];

            in.read(buffer);
            in.close();
            res = EncodingUtils.getString(buffer, "UTF-8");
            return res;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if(mHasInited) {
            return;
        }
        ResourceManager.init(this);
        mCanvas = new GLView(getApplication());
        String code = readCode();
        Log.e("HUJIA", code);
        mCanvas.setCode(code);


        setContentView(mCanvas);

        mHasInited = true;
        //SoundPoolTest.go(this);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    public void onPause() {
        super.onPause();
        mCanvas.onPause();
    }

    public void onResume() {
        super.onResume();
        mCanvas.onResume();
    }

    public void dialogAlert() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);

        builder.setTitle("Exit ?");
        builder.setMessage("Actually Want Exit ?");
        builder.setPositiveButton("YES", new DialogInterface.OnClickListener() {
           @Override
           public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
                System.exit(0);
           }
        });
        builder.setNegativeButton("NO", new DialogInterface.OnClickListener() {
           @Override
           public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
           }
        });
        AlertDialog alert = builder.create();
        alert.show();
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        if ((keyCode == KeyEvent.KEYCODE_BACK))
        {
            dialogAlert();
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public void onStop() {
        super.onStop();
    }
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        return;
    }
}
