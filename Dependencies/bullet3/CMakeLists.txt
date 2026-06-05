file(GLOB_RECURSE BULLET_SOURCES CONFIGURE_DEPENDS
        "*.cpp"
        "*.c"
        "*.h"
)

list(FILTER BULLET_SOURCES EXCLUDE REGEX ".*All\\.cpp$")

add_library(bullet3 STATIC ${BULLET_SOURCES})

target_include_directories(bullet3
        PUBLIC
        .
        bullet
)

target_compile_definitions(bullet3
        PUBLIC
        B3_USE_CLEW
        BT_USE_SSE_IN_API
)

if(MSVC)
    target_link_options(bullet3 PRIVATE /ignore:4006)
endif()