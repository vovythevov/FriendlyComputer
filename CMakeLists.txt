cmake_minimum_required(VERSION 3.10)

set(kit FriendlyComputer)
project(FriendlyComputer)

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_BINARY_DIR}
  )

option(BUILD_TESTING "Test the project" OFF)

set(CMAKE_AUTOMOC ON)
set(${kit}_QT_MODULES
  Core
  Gui
  OpenGL
  Qml
  Quick
  Network
  QuickControls2
  Svg
  Xml
  Widgets
  )
find_package(Qt5 REQUIRED COMPONENTS ${${kit}_QT_MODULES})

set(MOC_SRCS
  )

set(SRC_FILES
  main.cpp
  )

set(QRC_SRCS
  all.qrc
  )

qt5_add_resources(QRC_BUILT_SRCS ${QRC_SRCS})

source_group("Resources" FILES
  ${QRC_SRCS}
  )

source_group("Generated" FILES
  ${MOC_SRCS}
  ${QRC_BUILT_SRCS}
  )

add_executable(${kit}
  ${SRC_FILES}
  ${MOC_SRCS}
  ${QRC_BUILT_SRCS}
  )
qt5_use_modules(${kit} ${${kit}_QT_MODULES})

# Install executable
set(${kit}_INSTALL_BIN_DIR bin)
install(TARGETS ${kit}
  DESTINATION ${${kit}_INSTALL_BIN_DIR} COMPONENT Runtime)

# Install Qt
set(QT_DLL_LIST)
foreach(qtlib ${${kit}_QT_MODULES})
  get_target_property(release_location Qt5::${qtlib} LOCATION_RELEASE)
  list(APPEND QT_DLL_LIST ${release_location})
endforeach(qtlib)

install(FILES
  ${QT_DLL_LIST}
  DESTINATION ${${kit}_INSTALL_BIN_DIR} COMPONENT Runtime
  CONFIGURATIONS RELEASE RELWITHDEBINFO)

set(QT_DIR "${Qt5_DIR}/../../..")

# Other Qt dlls
install(FILES
  ${QT_DIR}/bin/Qt5QuickTemplates2.dll
  DESTINATION ${${kit}_INSTALL_BIN_DIR} COMPONENT Runtime
  CONFIGURATIONS RELEASE RELWITHDEBINFO
  )

# Qt Quick
install(DIRECTORY
  ${QT_DIR}/qml/QtQuick
  DESTINATION ${${kit}_INSTALL_BIN_DIR} COMPONENT Runtime
  )
install(DIRECTORY
  ${QT_DIR}/qml/QtQuick.2
  DESTINATION ${${kit}_INSTALL_BIN_DIR} COMPONENT Runtime
  )

# Qt plugins
install(FILES
  ${QT_DIR}/plugins/platforms/qwindows.dll
  DESTINATION ${${kit}_INSTALL_BIN_DIR}/platforms COMPONENT Runtime
  )
#install(DIRECTORY
#  ${QT_DIR}/plugins/imageformats
#  DESTINATION ${${kit}_INSTALL_BIN_DIR}/plugins COMPONENT Runtime
#  )
