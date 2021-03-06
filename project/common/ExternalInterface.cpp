#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#include <hx/CFFI.h>
#include "MobilePrefs.h"
#include <stdio.h>

using namespace mobileprefs;

#ifdef IPHONE

value mobileprefs_set_user_preference(value inId,value inValue)
{
   bool result = SetUserPreference(val_string(inId),val_string(inValue));
   return alloc_bool(result);
}
DEFINE_PRIM(mobileprefs_set_user_preference,2);

value mobileprefs_get_user_preference(value inId)
{
   std::string result = GetUserPreference(val_string(inId));
   return alloc_string(result.c_str());
}
DEFINE_PRIM(mobileprefs_get_user_preference,1);

value mobileprefs_clear_user_preference(value inId)
{
   bool result = ClearUserPreference(val_string(inId));
   return alloc_bool(result);
}
DEFINE_PRIM(mobileprefs_clear_user_preference,1);

#endif

extern "C" void mobileprefs_main ()
{
  val_int(0); // Fix Neko init
}
DEFINE_ENTRY_POINT(mobileprefs_main);

extern "C" int mobileprefs_register_prims()
{
  return 0;
}