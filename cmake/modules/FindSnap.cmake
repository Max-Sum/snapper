IF (DEFINED SNAP_PREFIX)
  MESSAGE(STATUS "Snap library prefix set to ${SNAP_PREFIX}")
ELSE (DEFINED SNAP_PREFIX)
  MESSAGE(STATUS "Snap path not set. Looking for it.")
ENDIF (DEFINED SNAP_PREFIX)

if(SNAP_INCLUDE_DIR AND SNAP_LIBRARY)
	# Already in cache, be silent
	SET(SNAP_FIND_QUIETLY TRUE)
endif(SNAP_INCLUDE_DIR AND SNAP_LIBRARY)

set(SNAP_LIBRARY)
set(SNAP_INCLUDE_DIR)

IF (DEFINED SNAP_PREFIX)
  MESSAGE( STATUS "Looking in ${SNAP_PREFIX}")
  FIND_PATH(SNAP_INCLUDE_DIR snap/Snap.h
    ${SNAP_PREFIX}/include
    NO_DEFAULT_PATH
    NO_SYSTEM_ENVIRONMENT_PATH
    NO_CMAKE_SYSTEM_PATH
  )
  FIND_LIBRARY(SNAP_LIBRARY NAMES snap
    PATHS
    ${SNAP_PREFIX}/lib
    ${SNAP_PREFIX}/lib64
    NO_DEFAULT_PATH
    NO_SYSTEM_ENVIRONMENT_PATH
    NO_CMAKE_SYSTEM_PATH
  )
ELSE (DEFINED SNAP_PREFIX)
  FIND_PATH(SNAP_INCLUDE_DIR snap/Snap.h
    /usr/include
    /usr/local/include
  )
  FIND_LIBRARY(SNAP_LIBRARY NAMES snap
    PATHS
    /usr/lib
    /usr/local/lib
  )
ENDIF (DEFINED SNAP_PREFIX)

if(SNAP_INCLUDE_DIR AND SNAP_LIBRARY)
   MESSAGE( STATUS "Snap found: includes in ${SNAP_INCLUDE_DIR}, library in ${SNAP_LIBRARY}")
   set(SNAP_FOUND TRUE)
else(SNAP_INCLUDE_DIR AND SNAP_LIBRARY)
   MESSAGE( FATAL "Snap not found")
endif(SNAP_INCLUDE_DIR AND SNAP_LIBRARY)

MARK_AS_ADVANCED(SNAP_INCLUDE_DIR SNAP_LIBRARY)