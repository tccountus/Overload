overload_sdk_library(OvAudio)

target_link_libraries(OvAudio
        PUBLIC
        soloud

        OvDebug
        OvMaths
        OvTools
)