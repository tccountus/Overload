overload_sdk_library(OvPhysics)

target_link_libraries(OvPhysics
        PUBLIC
        bullet3

        OvDebug
        OvMaths
        OvTools
)

target_compile_options(OvPhysics PRIVATE
        -Wno-error=unused-parameter
)