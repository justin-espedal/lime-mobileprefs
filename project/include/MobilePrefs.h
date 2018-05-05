#ifndef MobilePrefs_H
#define MobilePrefs_H

#include <string>

namespace mobileprefs 
{	
    bool SetUserPreference(const char *inId, const char *inPreference);
    std::string GetUserPreference(const char *inId);
    bool ClearUserPreference(const char *inId);
}

#endif
