include(FetchContent)

set(FLUENTDESIGNICONS_REPOSITORY "https://github.com/RyukNet/FluentIconsSvg" CACHE STRING "FluentIconsSvg repo url")
set(FLUENTDESIGNICONS_TAG master CACHE STRING "FluentIconsSvg git tag")

FetchContent_Declare(
    FluentIconsSvg
    GIT_REPOSITORY ${FLUENTDESIGNICONS_REPOSITORY}
    GIT_TAG ${FLUENTDESIGNICONS_TAG}
)

message(STATUS "Fetching ${FluentIconsSvg} from ${FLUENTDESIGNICONS_REPOSITORY}")
FetchContent_MakeAvailable(FluentIconsSvg)

set(FLUENTDESIGNICONS_ICONS_DIR "${FluentIconsSvg_SOURCE_DIR}/icons")
