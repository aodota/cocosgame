#pragma once
#ifndef __LUA_EXPORT_H_
#define __LUA_EXPORT_H_


extern "C" {
#include "lauxlib.h"
}

void luaopen_lua_exts(lua_State *L);


#endif