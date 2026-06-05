function(overload_sdk_library TARGET_NAME)

    file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS
            "*.cpp"
            "*.h"
            "*.hpp"
            "*.inl"
    )

    add_library(${TARGET_NAME} STATIC)

    target_sources(${TARGET_NAME}
            PRIVATE
            ${SOURCES}
    )

    target_include_directories(${TARGET_NAME}
            PUBLIC
            ${CMAKE_CURRENT_SOURCE_DIR}/include
    )

    target_compile_features(${TARGET_NAME}
            PUBLIC
            cxx_std_20
    )

    if(MSVC)
        target_compile_options(${TARGET_NAME}
                PRIVATE
                /W4
                /WX
        )
    else()
        target_compile_options(${TARGET_NAME}
                PRIVATE
                -Wall
                -Wextra
                -Wpedantic
                #-Werror # TODO: Enable back
        )
    endif()

    if(MSVC)
        target_compile_options(${TARGET_NAME}
                PRIVATE
                /bigobj
        )
    endif()

endfunction()