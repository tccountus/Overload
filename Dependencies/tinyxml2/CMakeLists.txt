file(GLOB_RECURSE TINYXML2_SOURCES CONFIGURE_DEPENDS
        "*.cpp"
        "*.h"
)

add_library(tinyxml2 STATIC ${TINYXML2_SOURCES})

target_include_directories(tinyxml2
        PUBLIC
        include
)