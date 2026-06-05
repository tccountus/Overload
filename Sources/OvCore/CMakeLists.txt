overload_sdk_library(OvCore)

target_link_libraries(OvCore
        PUBLIC
        glad
        ImGui
        lua
        sol
        tinyxml2
        tracy

        OvAudio
        OvDebug
        OvMaths
        OvPhysics
        OvRendering
        OvTools
        OvUI
        OvWindowing
)

if(MSVC)
    target_compile_options(OvCore
            PRIVATE
            /bigobj
    )
endif()