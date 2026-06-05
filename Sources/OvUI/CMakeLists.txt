overload_sdk_library(OvUI)

target_link_libraries(OvUI
        PUBLIC
        ImGui

        OvMaths
        OvTools
        OvDebug
        OvWindowing
)

target_compile_options(OvUI PRIVATE
        -Wno-error=unused-parameter -Wno-error=reorder
)