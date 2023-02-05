cmake_minimum_required(VERSION 3.15.0 FATAL_ERROR)

set(QFLUENT_MAIN_PROJECT OFF)
if (CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
  set(QFLUENT_MAIN_PROJECT ON)
endif()

include(cmake/Version.cmake)

set(QFLUENT_PROJECT "QFluent" CACHE STRING "Project Name")
set(QFLUENT_TARGET ${QFLUENT_PROJECT} CACHE STRING "Target Name")
set(QFLUENT_FOLDER_PREFIX ${QFLUENT_PROJECT} CACHE STRING "Prefix folder for all QFluent generated targets in generated project (only decorative)")
set(QFLUENT_VERBOSE ${QFLUENT_MAIN_PROJECT} CACHE BOOL "QFluent log configuration")
set(QFLUENT_BUILD_SHARED OFF CACHE BOOL "Build as a shared library")
set(QFLUENT_ENABLE_TESTS OFF CACHE BOOL "Build QFluent test executable")
set(QFLUENT_ENABLE_PCH ON CACHE BOOL
 "Enable precompile headers support for 'QFluent'. \"
 Only work if CMake support 'target_precompile_headers'. \"
 This can speed up compilation time.")
set(QFLUENT_ENABLE_UNITY_BUILD ON CACHE BOOL "QFluent source files will be combined into batches for faster compilation.")
set(QFLUENT_ENABLE_HIGHDPIFIX ON CACHE BOOL "Fix high dpi at application startup without any additional code")

set(QFLUENT_ENABLE_ICONS ON CACHE BOOL "Embed Mdi Icons in QFluent.Icons")
set(QFLUENT_ICONS "*.svg" CACHE STRING "Filter embedded icons")

set(QFLUENT_ENABLE_ROBOTO ON CACHE BOOL "Embed to qrc Roboto Regular & Medium")
set(QFLUENT_ENABLE_ROBOTOMONO ON CACHE BOOL "Embed to qrc RobotoMono Regular")
set(QFLUENT_ENABLE_LATO ON CACHE BOOL "Embed to qrc Lato Regular")

set(QFLUENT_ENABLE_INSTALL ${QFLUENT_MAIN_PROJECT} CACHE BOOL "Generate the install target")

project(${QFLUENT_PROJECT} VERSION ${QFLUENT_VERSION} LANGUAGES CXX)
if(QFLUENT_MAIN_PROJECT)
  set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()

if(QFLUENT_VERBOSE)

  message(STATUS "------ ${QFLUENT_TARGET} Configuration ------")

  message(STATUS "QFLUENT_PROJECT                : ${QFLUENT_PROJECT}")
  message(STATUS "QFLUENT_TARGET                 : ${QFLUENT_TARGET}")
  message(STATUS "QFLUENT_VERSION                : ${QFLUENT_VERSION}")
  message(STATUS "QFLUENT_VERSION_TAG_HEX        : ${QFLUENT_VERSION_TAG_HEX}")
  message(STATUS "QFLUENT_BUILD_SHARED           : ${QFLUENT_BUILD_SHARED}")
  message(STATUS "QFLUENT_FOLDER_PREFIX          : ${QFLUENT_FOLDER_PREFIX}")
  message(STATUS "QFLUENT_ENABLE_PCH             : ${QFLUENT_ENABLE_PCH}")
  message(STATUS "QFLUENT_ENABLE_UNITY_BUILD     : ${QFLUENT_ENABLE_UNITY_BUILD}")
  message(STATUS "QFLUENT_ENABLE_HIGHDPIFIX      : ${QFLUENT_ENABLE_HIGHDPIFIX}")

  message(STATUS "QFLUENT_ENABLE_ICONS           : ${QFLUENT_ENABLE_ICONS}")
  message(STATUS "QFLUENT_ICONS                  : ${QFLUENT_ICONS}")

  message(STATUS "QFLUENT_ENABLE_ROBOTO          : ${QFLUENT_ENABLE_ROBOTO}")
  message(STATUS "QFLUENT_ENABLE_ROBOTOMONO      : ${QFLUENT_ENABLE_ROBOTOMONO}")
  message(STATUS "QFLUENT_ENABLE_LATO            : ${QFLUENT_ENABLE_LATO}")

  message(STATUS "QFLUENT_ENABLE_TESTS           : ${QFLUENT_ENABLE_TESTS}")
  message(STATUS "QFLUENT_ENABLE_INSTALL         : ${QFLUENT_ENABLE_INSTALL}")


  message(STATUS "------ ${QFLUENT_TARGET} End Configuration ------")

endif()

find_package(Qt5 REQUIRED COMPONENTS
    Core
    Gui
    Qml
    Quick
    QuickControls2
    Svg
    Xml
    QuickCompiler
)

include(cmake/Dependencies.cmake)
include(cmake/FetchQOlm.cmake)
include(cmake/FetchQtGeneratorCMake.cmake)

add_subdirectory(qml)
