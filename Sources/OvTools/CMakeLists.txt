overload_sdk_library(OvTools)

target_link_libraries(OvTools
        PUBLIC
        tracy
)

if(WIN32)
    target_compile_definitions(OvTools
            PUBLIC
            _MBCS
    )
endif()