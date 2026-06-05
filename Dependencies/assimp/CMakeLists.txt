cmake_minimum_required(VERSION 3.20)

project(assimp LANGUAGES CXX)

add_library(assimp STATIC)

set_target_properties(assimp PROPERTIES
        CXX_STANDARD 20
        CXX_STANDARD_REQUIRED ON
        CXX_EXTENSIONS OFF
)

target_include_directories(assimp PRIVATE
        .
        contrib
        contrib/irrXML
        contrib/unzip
        contrib/pugixml/src
        contrib/zlib
        contrib/utf8cpp/source
        code
)

target_include_directories(assimp PUBLIC
        include
)

# ------------------------------------------------------------------
# Files
# ------------------------------------------------------------------

file(GLOB_RECURSE ASSIMP_HEADERS
        "include/*"
)

file(GLOB_RECURSE ASSIMP_UNZIP
        "contrib/unzip/*"
)

file(GLOB ASSIMP_ZLIB
        "contrib/zlib/*"
)

file(GLOB_RECURSE ASSIMP_COMMON
        "code/Common/*"
)

file(GLOB_RECURSE ASSIMP_POSTPROCESSING
        "code/PostProcessing/*"
)

file(GLOB_RECURSE ASSIMP_MATERIAL
        "code/Material/*"
)

file(GLOB_RECURSE ASSIMP_CAPI
        "code/CApi/*"
)

file(GLOB_RECURSE ASSIMP_GEOMETRY
        "code/Geometry/*"
)

file(GLOB_RECURSE ASSIMP_OBJ
        "code/AssetLib/Obj/*"
)

file(GLOB_RECURSE ASSIMP_FBX
        "code/AssetLib/FBX/*"
)

target_sources(assimp PRIVATE
        ${ASSIMP_HEADERS}
        ${ASSIMP_UNZIP}
        ${ASSIMP_ZLIB}
        ${ASSIMP_COMMON}
        ${ASSIMP_POSTPROCESSING}
        ${ASSIMP_MATERIAL}
        ${ASSIMP_CAPI}
        ${ASSIMP_GEOMETRY}
        ${ASSIMP_OBJ}
        ${ASSIMP_FBX}
)

# ------------------------------------------------------------------
# Importers
# ------------------------------------------------------------------

target_compile_definitions(assimp PRIVATE

        ASSIMP_BUILD_NO_3D_IMPORTER
        ASSIMP_BUILD_NO_3DS_IMPORTER
        ASSIMP_BUILD_NO_3MF_IMPORTER
        ASSIMP_BUILD_NO_AC_IMPORTER
        ASSIMP_BUILD_NO_AMF_IMPORTER
        ASSIMP_BUILD_NO_ASE_IMPORTER
        ASSIMP_BUILD_NO_USD_IMPORTER
        ASSIMP_BUILD_NO_ASSBIN_IMPORTER
        ASSIMP_BUILD_NO_B3D_IMPORTER
        ASSIMP_BUILD_NO_BLEND_IMPORTER
        ASSIMP_BUILD_NO_BVH_IMPORTER
        ASSIMP_BUILD_NO_C4D_IMPORTER
        ASSIMP_BUILD_NO_COB_IMPORTER
        ASSIMP_BUILD_NO_COLLADA_IMPORTER
        ASSIMP_BUILD_NO_CSM_IMPORTER
        ASSIMP_BUILD_NO_DXF_IMPORTER

        # ASSIMP_BUILD_NO_FBX_IMPORTER

        ASSIMP_BUILD_NO_GLTF_IMPORTER
        ASSIMP_BUILD_NO_HMP_IMPORTER
        ASSIMP_BUILD_NO_IFC_IMPORTER
        ASSIMP_BUILD_NO_IQM_IMPORTER
        ASSIMP_BUILD_NO_IRR_IMPORTER
        ASSIMP_BUILD_NO_IRRMESH_IMPORTER
        ASSIMP_BUILD_NO_LWO_IMPORTER
        ASSIMP_BUILD_NO_LWS_IMPORTER
        ASSIMP_BUILD_NO_M3D_IMPORTER
        ASSIMP_BUILD_NO_MD2_IMPORTER
        ASSIMP_BUILD_NO_MD3_IMPORTER
        ASSIMP_BUILD_NO_MD5_IMPORTER
        ASSIMP_BUILD_NO_MDC_IMPORTER
        ASSIMP_BUILD_NO_MDL_IMPORTER
        ASSIMP_BUILD_NO_MMD_IMPORTER
        ASSIMP_BUILD_NO_MS3D_IMPORTER
        ASSIMP_BUILD_NO_NDO_IMPORTER
        ASSIMP_BUILD_NO_NFF_IMPORTER

        # ASSIMP_BUILD_NO_OBJ_IMPORTER

        ASSIMP_BUILD_NO_OFF_IMPORTER
        ASSIMP_BUILD_NO_OGRE_IMPORTER
        ASSIMP_BUILD_NO_OPENGEX_IMPORTER
        ASSIMP_BUILD_NO_PLY_IMPORTER
        ASSIMP_BUILD_NO_Q3BSP_IMPORTER
        ASSIMP_BUILD_NO_Q3D_IMPORTER
        ASSIMP_BUILD_NO_RAW_IMPORTER
        ASSIMP_BUILD_NO_SIB_IMPORTER
        ASSIMP_BUILD_NO_SMD_IMPORTER
        ASSIMP_BUILD_NO_STEP_IMPORTER
        ASSIMP_BUILD_NO_STL_IMPORTER
        ASSIMP_BUILD_NO_TERRAGEN_IMPORTER
        ASSIMP_BUILD_NO_X_IMPORTER
        ASSIMP_BUILD_NO_X3D_IMPORTER
        ASSIMP_BUILD_NO_XGL_IMPORTER

        # Exporters

        ASSIMP_BUILD_NO_COLLADA_EXPORTER
        ASSIMP_BUILD_NO_X_EXPORTER
        ASSIMP_BUILD_NO_STEP_EXPORTER
        ASSIMP_BUILD_NO_OBJ_EXPORTER
        ASSIMP_BUILD_NO_STL_EXPORTER
        ASSIMP_BUILD_NO_PLY_EXPORTER
        ASSIMP_BUILD_NO_3DS_EXPORTER
        ASSIMP_BUILD_NO_GLTF_EXPORTER
        ASSIMP_BUILD_NO_ASSBIN_EXPORTER
        ASSIMP_BUILD_NO_ASSXML_EXPORTER
        ASSIMP_BUILD_NO_X3D_EXPORTER
        ASSIMP_BUILD_NO_FBX_EXPORTER
        ASSIMP_BUILD_NO_M3D_EXPORTER
        ASSIMP_BUILD_NO_3MF_EXPORTER
        ASSIMP_BUILD_NO_ASSJSON_EXPORTER
        ASSIMP_BUILD_NO_PBRT_EXPORTER
)

# ------------------------------------------------------------------
# Linux
# ------------------------------------------------------------------

if(UNIX AND NOT APPLE)
    target_compile_definitions(assimp PRIVATE
            HAVE_UNISTD_H
    )
endif()

# ------------------------------------------------------------------
# Configurations
# ------------------------------------------------------------------

target_compile_definitions(assimp PRIVATE
        $<$<CONFIG:Debug>:DEBUG _DEBUG>
        $<$<CONFIG:Release>:NDEBUG>
        $<$<CONFIG:Publish>:NDEBUG>
)

if(MSVC)
    target_compile_options(assimp PRIVATE /W0)

    target_compile_options(assimp PRIVATE
            $<$<CONFIG:Release>:/O2>
            $<$<CONFIG:Publish>:/O2>
    )
else()
    target_compile_options(assimp PRIVATE -w)

    target_compile_options(assimp PRIVATE
            $<$<CONFIG:Release>:-O3>
            $<$<CONFIG:Publish>:-O3>
    )
endif()