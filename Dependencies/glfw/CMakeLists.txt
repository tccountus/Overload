file(GLOB GLFW_SOURCES
        src/*.c
        src/*.h
)

if(WIN32)

    list(FILTER GLFW_SOURCES EXCLUDE REGEX ".*cocoa.*")
    list(FILTER GLFW_SOURCES EXCLUDE REGEX ".*x11.*")
    list(FILTER GLFW_SOURCES EXCLUDE REGEX ".*glx.*")
    list(FILTER GLFW_SOURCES EXCLUDE REGEX ".*nsgl.*")

    add_library(glfw STATIC ${GLFW_SOURCES})

    target_compile_definitions(glfw
            PUBLIC
            _GLFW_WIN32
    )

elseif(UNIX)

    list(FILTER GLFW_SOURCES EXCLUDE REGEX ".*win32.*")
    list(FILTER GLFW_SOURCES EXCLUDE REGEX ".*cocoa.*")
    list(FILTER GLFW_SOURCES EXCLUDE REGEX ".*wgl.*")
    list(FILTER GLFW_SOURCES EXCLUDE REGEX ".*nsgl.*")

    add_library(glfw STATIC ${GLFW_SOURCES})

    target_compile_definitions(glfw
            PUBLIC
            _GLFW_X11
            _GNU_SOURCE
    )

endif()

target_include_directories(glfw
        PUBLIC
        include
)