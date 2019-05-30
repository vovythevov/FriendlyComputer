# Generate a launcher to the given path based on a list of libraries
MACRO(GenerateLauncher)
  SET(options)
  SET(oneValueArgs
    OUTPUT_DIRECTORY
    )
  SET(multiValueArgs
    EXTERNAL_LIBRARIES
    INTERNAL_LIBRARIES_PATHS
    )
  CMAKE_PARSE_ARGUMENTS(FriendlyComputer
    "${options}"
    "${oneValueArgs}"
    "${multiValueArgs}"
    ${ARGN}
    )

  # Get the paths from the external libraries
  LIST(APPEND launcher_library_dirs)
  FOREACH(library ${LostComputer_EXTERNAL_LIBRARIES})
    GET_TARGET_PROPERTY(library_path ${library} LOCATION)
    GET_FILENAME_COMPONENT(library_dir ${library_path} DIRECTORY)
    LIST(APPEND launcher_library_dirs ${library_dir})
  ENDFOREACH()

  # Get the paths from the internal libraries
  FOREACH(library_path ${LostComputer_INTERNAL_LIBRARIES_PATHS})
    LIST(APPEND launcher_library_dirs
      ${library_path}
      ${library_path}/Debug
      ${library_path}/Release
      ${library_path}/RelWithDebInfo
      )
  ENDFOREACH()

  LIST(REMOVE_DUPLICATES launcher_library_dirs)

  # Create launcher
  SET(LostComputer_LAUNCHER_PATH "${FriendlyComputer_OUTPUT_DIRECTORY}/Launcher.bat")
  SET(LostComputer_to_configure "${CMAKE_CURRENT_SOURCE_DIR}/Launcher.bat.in")

  CONFIGURE_FILE(${LostComputer_to_configure} ${LostComputer_LAUNCHER_PATH})
ENDMACRO()
