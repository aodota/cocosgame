#ifndef __LUA_EXPORT_H_
#define __LUA_EXPORT_H_

#if defined(_USRDLL)
#define LUA_EXTENSIONS_DLL     __declspec(dllexport)
#else         /* use a DLL library */
#define LUA_EXTENSIONS_DLL
#endif

#ifdef __cplusplus
extern "C" {
#endif

#include "lua.h"
    
#ifdef __cplusplus
}
#endif

void LUA_EXTENSIONS_DLL luaopen_lua_exts(lua_State *L);


#endif