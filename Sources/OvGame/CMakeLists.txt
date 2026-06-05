file(GLOB_RECURSE OVGAME_SOURCES CONFIGURE_DEPENDS
        "*.cpp"
        "*.h"
        "*.hpp"
        "*.inl"
        "*.rc"
)

add_executable(OvGame ${OVGAME_SOURCES})

target_include_directories(OvGame
        PRIVATE
        include
)

target_link_libraries(OvGame
        PRIVATE

        assimp
        bullet3
        freetype
        glad
        glfw
        ImGui
        lua
        soloud
        tinyxml2
        tracy

        OvAudio
        OvCore
        OvDebug
        OvMaths
        OvPhysics
        OvRendering
        OvTools
        OvUI
        OvWindowing
)

if(WIN32)

    target_link_libraries(OvGame
            PRIVATE
            dbghelp
            opengl32
    )

endif()

if(UNIX AND NOT APPLE)

    target_link_libraries(OvGame
            PRIVATE
            dl
            pthread
            GL
            X11
    )

endif()

add_custom_command(
        TARGET OvGame
        POST_BUILD

        COMMAND ${CMAKE_COMMAND} -E make_directory
        "$<TARGET_FILE_DIR:OvGame>/Data"

        COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${CMAKE_SOURCE_DIR}/Resources/Engine"
        "$<TARGET_FILE_DIR:OvGame>/Data/Engine"
)

set(OVERLOAD_BUILD_DIR
        "${CMAKE_SOURCE_DIR}/Build/$<CONFIG>"
)

add_custom_command(
        TARGET OvGame
        POST_BUILD

        COMMAND ${CMAKE_COMMAND} -E copy
        "$<TARGET_FILE:OvGame>"
        "${OVERLOAD_BUILD_DIR}"
)