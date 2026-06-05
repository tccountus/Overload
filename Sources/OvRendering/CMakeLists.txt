overload_sdk_library(OvRendering)

target_link_libraries(OvRendering
        PUBLIC
        assimp
        glad
        stb_image
        tracy

        OvDebug
        OvMaths
        OvTools
)

target_compile_options(OvRendering PRIVATE
        -Wno-error=pedantic -Wno-error=unused-parameter -Wno-error=reorder -Wno-error=missing-field-initializers -Wno-error=unused-function -Wno-error=unused-variable -Wno-error=delete-non-virtual-dtor -Wno-error=pessimizing-move
)