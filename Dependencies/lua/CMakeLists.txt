file(GLOB_RECURSE LUA_SOURCES CONFIGURE_DEPENDS
        "*.c"
        "*.h"
)

add_library(lua STATIC ${LUA_SOURCES})

target_include_directories(lua
        PUBLIC
        include
)

target_compile_features(lua PUBLIC c_std_17)