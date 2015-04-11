package org.apache.cordova.devicecontrol;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.apache.cordova.LOG;

import android.util.Log;
import android.content.Context;
import android.view.WindowManager;
import android.util.DisplayMetrics;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class DeviceControl extends CordovaPlugin {
  private static final String TAG = DeviceControl.class.getSimpleName();
  public static final String ACTION_DISPLAY_DIMENSIONS = "displayDimensions";

  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {
    if (ACTION_DISPLAY_DIMENSIONS.equals(action)) {
        Log.v(TAG, "ACTION_DISPLAY_DIMENSIONS 1");
        DisplayMetrics metrics = new DisplayMetrics();
        Context context=this.cordova.getActivity().getApplicationContext(); 
        WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        wm.getDefaultDisplay().getMetrics(metrics);
        JSONObject resp = new JSONObject();
        try {
            resp.put("type", ACTION_DISPLAY_DIMENSIONS);
            resp.put("metrics", metrics);
        } catch (JSONException e) {
            callbackContext.error("Json error during  " + ACTION_DISPLAY_DIMENSIONS);
            return false;
        }
        PluginResult pr = new PluginResult(PluginResult.Status.OK, "resp");
        callbackContext.sendPluginResult(pr);
        Log.v(TAG, "ACTION_DISPLAY_DIMENSIONS 2");

        return true;
    } 
    callbackContext.error("Unknown action: " + action);
    return false;
  }
}
