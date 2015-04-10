package org.apache.cordova.deviceControl;


import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.apache.cordova.LOG;

import android.util.Log;
import android.content.Context;
import android.view.WindowManager;
import android.util.DisplayMetrics;




public class SpeechRecognition extends CordovaPlugin {
  private static final String TAG = SpeechRecognition.class.getSimpleName();
  public static final String ACTION_DISPLAY_DIMENSIONS = "displayDimensions";

  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {
    this.callbackContext = callbackContext;

        if (ACTION_DISPLAY_DIMENSIONS.equals(action)) {
           JSONObject resp = new JSONObject();
            DisplayMetrics metrics = new DisplayMetrics();
            WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
            wm.getDefaultDisplay().getMetrics(metrics);
            resp.metrics = metrics;
            callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, resp));
            
            return metrics;
      }

    } else {
        callbackContext.error("Unknown action: " + action);
        return false;
    }
    return true;
  }
}
