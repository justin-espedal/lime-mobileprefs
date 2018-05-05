package;

#if android
import lime.system.JNI;
#end

#if ios
import lime.system.CFFI;
#end

class MobilePrefs
{	
	private function new() {}
	
	public static function getUserPreference(name:String):String
	{
		#if ios
		return mobileprefs_get_user_preference(name);
		#end
		
		#if android
		if(funcGetPreference == null)
		{
			funcGetPreference = JNI.createStaticMethod("com/mobileprefs/MobilePrefs", "getUserPreference", "(Ljava/lang/String;)Ljava/lang/String;", true);
		}
		
		return funcGetPreference([name]);
		#end
	}
	
	public static function setUserPreference(name:String, value:String):Bool
	{
		#if ios
		mobileprefs_set_user_preference(name, value);
		#end
		
		#if android
		if(funcSetPreference == null)
		{
			funcSetPreference = JNI.createStaticMethod("com/mobileprefs/MobilePrefs", "setUserPreference", "(Ljava/lang/String;)V", true);
		}
		
		funcSetPreference([name, value]);
		#end
		
		return true;
	}
	
	public static function clearUserPreference(name:String):Bool
	{
		#if ios
		mobileprefs_clear_user_preference(name);
		#end
		
		#if android
		if(funcClearPreference == null)
		{
			funcClearPreference = JNI.createStaticMethod("com/mobileprefs/MobilePrefs", "clearUserPreference", "(Ljava/lang/String;)V", true);
		}
		
		funcClearPreference([name]);
		#end
		
		return true;
	}
	
	#if android
	private static var funcGetPreference:Dynamic;
	private static var funcSetPreference:Dynamic;
	private static var funcClearPreference:Dynamic;
	#end
	
	#if(ios)
	static var mobileprefs_get_user_preference = CFFI.load("mobileprefs","mobileprefs_get_user_preference",1);
	static var mobileprefs_set_user_preference = CFFI.load("mobileprefs","mobileprefs_set_user_preference",2);
	static var mobileprefs_clear_user_preference = CFFI.load("mobileprefs","mobileprefs_clear_user_preference",1);
	#end
}