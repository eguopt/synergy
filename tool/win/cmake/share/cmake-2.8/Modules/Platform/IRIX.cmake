SET(CMAKE_DL_LIBS "")
SET(CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS "-shared -rdata_shared")
SET(CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS "-shared -rdata_shared") 
SET(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG "-Wl,-rpath,")       # -rpath
SET(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG_SEP "")   # : or empty
IF(NOT CMAKE_COMPILER_IS_GNUCXX)
  SET(CMAKE_CXX_CREATE_STATIC_LIBRARY
      "<CMAKE_CXX_COMPILER> -ar -o <TARGET> <OBJECTS>")
  SET (CMAKE_CXX_FLAGS_INIT "")
  SET (CMAKE_CXX_FLAGS_DEBUG_INIT "-g")
  SET (CMAKE_CXX_FLAGS_MINSIZEREL_INIT "-O3 -DNDEBUG")
  SET (CMAKE_CXX_FLAGS_RELEASE_INIT "-O2 -DNDEBUG")
  SET (CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-O2")
  SET (CMAKE_C_FLAGS_INIT "")
ENDIF(NOT CMAKE_COMPILER_IS_GNUCXX)
# set flags for gcc support
INCLUDE(Platform/UnixPaths)

IF(NOT CMAKE_COMPILER_IS_GNUCC)
  SET (CMAKE_C_CREATE_PREPROCESSED_SOURCE "<CMAKE_C_COMPILER> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
  SET (CMAKE_C_CREATE_ASSEMBLY_SOURCE
    "<CMAKE_C_COMPILER> <FLAGS> -S <SOURCE>"
    "mv `basename \"<SOURCE>\" | sed 's/\\.[^./]*$$//'`.s <ASSEMBLY_SOURCE>"
    )
ENDIF(NOT CMAKE_COMPILER_IS_GNUCC)

IF(NOT CMAKE_COMPILER_IS_GNUCXX)
  SET (CMAKE_CXX_CREATE_PREPROCESSED_SOURCE "<CMAKE_CXX_COMPILER> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
  SET (CMAKE_CXX_CREATE_ASSEMBLY_SOURCE
    "<CMAKE_CXX_COMPILER> <FLAGS> -S <SOURCE>"
    "mv `basename \"<SOURCE>\" | sed 's/\\.[^./]*$$//'`.s <ASSEMBLY_SOURCE>"
    )
ENDIF(NOT CMAKE_COMPILER_IS_GNUCXX)

# Initialize C link type selection flags.  These flags are used when
# building a shared library, shared module, or executable that links
# to other libraries to select whether to use the static or shared
# versions of the libraries.
FOREACH(type SHARED_LIBRARY SHARED_MODULE EXE)
  SET(CMAKE_${type}_LINK_STATIC_C_FLAGS "-Wl,-Bstatic")
  SET(CMAKE_${type}_LINK_DYNAMIC_C_FLAGS "-Wl,-Bdynamic")
ENDFOREACH(type)

# The IRIX linker needs to find transitive shared library dependencies
# in the -L path.
SET(CMAKE_LINK_DEPENDENT_LIBRARY_DIRS 1)
