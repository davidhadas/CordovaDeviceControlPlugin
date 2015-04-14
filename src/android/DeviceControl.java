package com.zLineup.cordova.plugin.deviceCtrl;

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
        
        float dim_s, dim_l;
        String orientation;
        if (metrics.widthPixels>metrics.heightPixels) {
            dim_s = metrics.heightPixels/metrics.xdpi;
            dim_l = metrics.widthPixels/metrics.ydpi;
            orientation = "tall";
        } else {
            dim_s = metrics.widthPixels/metrics.xdpi;
            dim_l = metrics.heightPixels/metrics.ydpi;            
            orientation = "wide";
        }
        JSONObject resp = new JSONObject();
        try {
            resp.put("type", ACTION_DISPLAY_DIMENSIONS);
            resp.put("dim_s", dim_s);
            resp.put("dim_l", dim_l);
            resp.put("orientation", orientation);
            resp.put("metrics", metrics);
        } catch (JSONException e) {
            callbackContext.error("Json error during  " + ACTION_DISPLAY_DIMENSIONS);
            return false;
        }
        PluginResult pr = new PluginResult(PluginResult.Status.OK, resp);
        callbackContext.sendPluginResult(pr);
        Log.v(TAG, "ACTION_DISPLAY_DIMENSIONS 2");

        return true;
    } 
    callbackContext.error("Unknown action: " + action);
    return false;
  }
}
