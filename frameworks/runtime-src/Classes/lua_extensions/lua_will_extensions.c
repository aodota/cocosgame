
#include "lua_will_extensions.h"

#if __cplusplus
extern "C" {
#endif

#include "lpack/lpack.h"
#include "lua_zlib/lua_zlib.h"
#include "cjson/lua_cjson.h"

    
// socket
#include "luasocket/luasocket.h"
#include "luasocket/luasocket_scripts.h"
#include "luasocket/mime.h"

static luaL_Reg luax_will_exts[] = {
    {"socket.core", luaopen_socket_core},
    {"mime.core", luaopen_mime_core},
    { "pack", luaopen_pack},
    { "zlib", luaopen_zlib},
    { "cjson", luaopen_cjson_safe},
    {NULL, NULL}
};

void luaopen_lua_will_extensions(lua_State *L)
{
    // load extensions
    luaL_Reg* lib = luax_will_exts;
    lua_getglobal(L, "package");
    lua_getfield(L, -1, "preload");
    for (; lib->func; lib++)
    {
        lua_pushcfunction(L, lib->func);
        lua_setfield(L, -2, lib->name);
    }
    lua_pop(L, 2);

    luaopen_luasocket_scripts(L);
}

#if __cplusplus
} // extern "C"
#endif
