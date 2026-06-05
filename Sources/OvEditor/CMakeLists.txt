file(GLOB_RECURSE OVEDITOR_SOURCES CONFIGURE_DEPENDS
        "*.cpp"
        "*.h"
        "*.hpp"
        "*.inl"
        "*.rc"
)

add_executable(OvEditor ${OVEDITOR_SOURCES})

target_include_directories(OvEditor
        PRIVATE
        include
)

add_dependencies(OvEditor OvGame)

target_link_libraries(OvEditor
        PRIVATE

        bullet3
        freetype
        glad
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

        assimp
        glfw
)

if(WIN32)

    target_link_libraries(OvEditor
            PRIVATE
            dbghelp
            opengl32
    )

endif()

if(UNIX AND NOT APPLE)

    target_link_libraries(OvEditor
            PRIVATE
            dl
            pthread
            GL
            X11
    )

endif()

set(OVERLOAD_BUILD_DIR
        "${CMAKE_SOURCE_DIR}/Build/$<CONFIG>"
)

add_custom_command(
        TARGET OvEditor
        POST_BUILD

        COMMAND ${CMAKE_COMMAND} -E remove_directory
        "${OVERLOAD_BUILD_DIR}/Data"

        COMMAND ${CMAKE_COMMAND} -E make_directory
        "${OVERLOAD_BUILD_DIR}/Data"

        COMMAND ${CMAKE_COMMAND} -E make_directory
        "${OVERLOAD_BUILD_DIR}/Config"

        COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${CMAKE_SOURCE_DIR}/Resources/Engine"
        "${OVERLOAD_BUILD_DIR}/Data/Engine"

        COMMAND ${CMAKE_COMMAND} -E copy_directory
        "${CMAKE_SOURCE_DIR}/Resources/Editor"
        "${OVERLOAD_BUILD_DIR}/Data/Editor"

        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${CMAKE_CURRENT_SOURCE_DIR}/layout.ini"
        "${OVERLOAD_BUILD_DIR}/Config/layout.ini"

        COMMAND ${CMAKE_COMMAND} -E copy
        "$<TARGET_FILE:OvEditor>"
        "${OVERLOAD_BUILD_DIR}"
)