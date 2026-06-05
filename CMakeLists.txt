cmake_minimum_required(VERSION 3.25)

include(cmake/OverloadTargets.cmake)

file(READ "${CMAKE_SOURCE_DIR}/VERSION.txt" OVERLOAD_VERSION)
string(STRIP "${OVERLOAD_VERSION}" OVERLOAD_VERSION)

project(
        Overload
        VERSION ${OVERLOAD_VERSION}
        LANGUAGES C CXX
)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CONFIGURATION_TYPES
        Debug
        Release
        Publish
        CACHE STRING "" FORCE
)

add_compile_definitions(
        LUA_SCRIPTING
        GRAPHICS_API_OPENGL
        SOL_NO_LUA_HPP
        OVERLOAD_VERSION="${OVERLOAD_VERSION}"
)

add_compile_definitions(
        $<$<OR:$<CONFIG:Debug>,$<CONFIG:Release>>:TRACY_ENABLE>
        $<$<OR:$<CONFIG:Debug>,$<CONFIG:Release>>:TRACY_ON_DEMAND>
        $<$<OR:$<CONFIG:Debug>,$<CONFIG:Release>>:TRACY_MEMORY_ENABLE>
)

if(MSVC)
    add_compile_options(/FS)
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY
        ${CMAKE_SOURCE_DIR}/Bin/$<CONFIG>
)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY
        ${CMAKE_SOURCE_DIR}/Bin/$<CONFIG>
)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY
        ${CMAKE_SOURCE_DIR}/Bin/$<CONFIG>
)

add_subdirectory(Dependencies)

add_subdirectory(Sources/OvMaths)
add_subdirectory(Sources/OvTools)
add_subdirectory(Sources/OvDebug)
add_subdirectory(Sources/OvAudio)

add_subdirectory(Sources/OvRendering)
add_subdirectory(Sources/OvWindowing)
add_subdirectory(Sources/OvUI)
add_subdirectory(Sources/OvPhysics)

add_subdirectory(Sources/OvCore)

add_subdirectory(Sources/OvGame)
add_subdirectory(Sources/OvEditor)