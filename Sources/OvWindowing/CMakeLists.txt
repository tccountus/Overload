overload_sdk_library(OvWindowing)

target_link_libraries(OvWindowing
        PUBLIC
        glfw

        OvRendering
        OvTools
)

if(WIN32)
    target_compile_definitions(OvWindowing
            PUBLIC
            _MBCS
    )
endif()

target_compile_options(OvWindowing PRIVATE
        -Wno-error=ignored-attributes -Wno-error=reorder -Wno-error=unused-parameter
)