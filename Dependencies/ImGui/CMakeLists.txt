file(GLOB_RECURSE IMGUI_SOURCES CONFIGURE_DEPENDS
        "*.cpp"
        "*.h"
)

add_library(ImGui STATIC ${IMGUI_SOURCES})

target_include_directories(ImGui
        PUBLIC
        include
)

target_compile_definitions(ImGui
        PUBLIC
        IMGUI_ENABLE_FREETYPE
)

target_link_libraries(ImGui
        PUBLIC
        freetype
        glfw
)