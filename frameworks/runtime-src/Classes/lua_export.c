
#include "lua_export.h"
#include "lpack/lpack.h"
#include "lua_zlib/lua_zlib.h"
#include "cjson/lua_cjson.h"

static luaL_Reg lua_exts[] = {
	{ "pack", luaopen_pack},
	{ "zlib", luaopen_zlib},
	{ "cjson", luaopen_cjson_safe},

	{ NULL, NULL }
};

void luaopen_lua_exts(lua_State *L)
{
	// load extensions
	luaL_Reg* lib = lua_exts;
	lua_getglobal(L, "package");
	lua_getfield(L, -1, "preload");
	for (; lib->func; lib++)
	{
		lua_pushcfunction(L, lib->func);
		lua_setfield(L, -2, lib->name);
	}
	lua_pop(L, 2);
}
