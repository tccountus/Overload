file(GLOB_RECURSE GLAD_SOURCES CONFIGURE_DEPENDS
        "*.c"
        "*.h"
)

add_library(glad STATIC ${GLAD_SOURCES})

target_include_directories(glad
        PUBLIC
        include
)