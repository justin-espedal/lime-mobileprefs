package com.mobileprefs;

import org.haxe.lime.*;
import org.haxe.extension.Extension;

import android.app.*;
import android.content.*;

public class MobilePrefs extends Extension
{
    private static final String GLOBAL_PREF_FILE = "nmeAppPrefs";
    
    public static String getUserPreference (String inId)
    {
        SharedPreferences prefs = mainActivity.getSharedPreferences (GLOBAL_PREF_FILE, Context.MODE_PRIVATE);
        return prefs.getString (inId, "");
    }
    
    public static void setUserPreference (String inId, String inPreference)
    {
        SharedPreferences prefs = mainActivity.getSharedPreferences (GLOBAL_PREF_FILE, Context.MODE_PRIVATE);
        SharedPreferences.Editor prefEditor = prefs.edit ();
        prefEditor.putString (inId, inPreference);
        prefEditor.commit ();
    }
    
    public static void clearUserPreference (String inId)
    {
        SharedPreferences prefs = mainActivity.getSharedPreferences (GLOBAL_PREF_FILE, Context.MODE_PRIVATE);
        SharedPreferences.Editor prefEditor = prefs.edit ();
        prefEditor.putString (inId, "");
        prefEditor.commit ();
    }
}