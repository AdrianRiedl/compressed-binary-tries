include(FetchContent)

if (NOT TARGET sdsl_lite::sdsl)
    FetchContent_Declare(
            sdsl_lite
            GIT_REPOSITORY https://github.com/AdrianRiedl/sdsl-lite.git
            GIT_TAG        "f7cdddedae1acb05d849ef151966658ceec29b3a"
    )

    FetchContent_MakeAvailable(sdsl_lite)

    # Prefer targets exported by sdsl-lite if present. Common names tried:
    if (TARGET sdsl::sdsl)
        add_library(sdsl_lite::sdsl ALIAS sdsl::sdsl)
    elseif (TARGET sdsl)
        add_library(sdsl_lite::sdsl ALIAS sdsl)
    else()
        # Fallback: create an INTERFACE imported target with include dir set to the fetched source
        FetchContent_GetProperties(sdsl_lite)
        add_library(sdsl_lite::sdsl INTERFACE IMPORTED)

        if (sdsl_lite_POPULATED)
            set_target_properties(sdsl_lite::sdsl PROPERTIES
                    INTERFACE_INCLUDE_DIRECTORIES "${sdsl_lite_SOURCE_DIR}/include"
            )
            # If the project produced a library install in its build tree, you can add IMPORTED_LOCATION here.
            # e.g. set_target_properties(sdsl_lite::sdsl PROPERTIES IMPORTED_LOCATION "${sdsl_lite_BINARY_DIR}/lib/libsdsl.a")
        endif()
    endif()
endif()
