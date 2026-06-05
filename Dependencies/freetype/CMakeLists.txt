project(freetype LANGUAGES C)

add_library(freetype STATIC)

target_sources(freetype PRIVATE
        include
)

file(GLOB_RECURSE FREETYPE_HEADERS CONFIGURE_DEPENDS
        "include/*.h"
)

target_sources(freetype PRIVATE ${FREETYPE_HEADERS})

target_sources(freetype PRIVATE
        src/autofit/autofit.c
        src/base/ftbase.c
        src/base/ftbbox.c
        src/base/ftbdf.c
        src/base/ftbitmap.c
        src/base/ftcid.c
        src/base/ftdebug.c
        src/base/ftfstype.c
        src/base/ftgasp.c
        src/base/ftglyph.c
        src/base/ftgxval.c
        src/base/ftinit.c
        src/base/ftmm.c
        src/base/ftotval.c
        src/base/ftpatent.c
        src/base/ftpfr.c
        src/base/ftstroke.c
        src/base/ftsynth.c
        src/base/ftsystem.c
        src/base/fttype1.c
        src/base/ftwinfnt.c

        src/bdf/bdf.c
        src/bzip2/ftbzip2.c
        src/cache/ftcache.c
        src/cff/cff.c
        src/cid/type1cid.c
        src/dlg/dlgwrap.c
        src/gxvalid/gxvalid.c
        src/gzip/ftgzip.c
        src/lzw/ftlzw.c
        src/otvalid/otvalid.c
        src/pcf/pcf.c
        src/pfr/pfr.c
        src/psaux/psaux.c
        src/pshinter/pshinter.c
        src/psnames/psnames.c
        src/raster/raster.c
        src/sdf/sdf.c
        src/sfnt/sfnt.c
        src/smooth/smooth.c
        src/svg/svg.c
        src/truetype/truetype.c
        src/type1/type1.c
        src/type42/type42.c
        src/winfonts/winfnt.c
)

target_include_directories(freetype PUBLIC
        include
        src
)

target_compile_definitions(freetype PRIVATE
        FT2_BUILD_LIBRARY
)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(freetype PRIVATE DEBUG _DEBUG)
    target_compile_options(freetype PRIVATE -g)
endif()

if(CMAKE_BUILD_TYPE STREQUAL "Release" OR CMAKE_BUILD_TYPE STREQUAL "Publish")
    target_compile_definitions(freetype PRIVATE NDEBUG)
    target_compile_options(freetype PRIVATE -O3)
endif()