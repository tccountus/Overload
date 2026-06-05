file(GLOB_RECURSE TRACY_SOURCES CONFIGURE_DEPENDS
        "*.cpp"
        "*.hpp"
        "*.h"
)

if(WIN32)
    list(FILTER TRACY_SOURCES EXCLUDE REGEX ".*libbacktrace.*")
endif()

add_library(tracy STATIC ${TRACY_SOURCES})

target_include_directories(tracy
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)

if(MSVC)
    target_link_options(tracy PRIVATE /ignore:4006)
endif()