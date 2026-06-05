file(GLOB_RECURSE SOLOUD_SOURCES CONFIGURE_DEPENDS
        "*.cpp"
        "*.c"
        "*.h"
)

add_library(soloud STATIC ${SOLOUD_SOURCES})

target_include_directories(soloud
        PUBLIC
        include
)

target_compile_definitions(soloud
        PUBLIC
        WITH_MINIAUDIO
)