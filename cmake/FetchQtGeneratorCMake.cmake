include(FetchContent)

set(QTGENERATORCMAKE_REPOSITORY "https://github.com/OlivierLDff/QtGeneratorCMake.git" CACHE STRING "QtGeneratorCmake repository, can be local url")
set(QTGENERATORCMAKE_TAG "master" CACHE STRING "QtGeneratorCmake git tag")

FetchContent_Declare(
    QtGeneratorCMake
    GIT_REPOSITORY ${QTGENERATORCMAKE_REPOSITORY}
    GIT_TAG ${QTGENERATORCMAKE_TAG}
)

FetchContent_MakeAvailable(QtGeneratorCMake)
