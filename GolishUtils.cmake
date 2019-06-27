function(golish_collect_files)
   cmake_parse_arguments(ARG "NO_HEADER;RELATIVE" "OUTPUT_VAR;DIR;SKIP_DIR" "" ${ARGN})
   set(GLOB ${ARG_DIR})
   if(NO_HEADER)
      string(APPEND GLOB "/*[|.m|.mm|.cpp]")
   else()
      string(APPEND GLOB "/*[.h|.m|.mm|.cpp]")
   endif()
   if (ARG_RELATIVE)
      file(GLOB_RECURSE TEMP_OUTPUTFILES
         LIST_DIRECTORIES false
         RELATIVE ${ARG_DIR}
         ${GLOB})
   else()
      file(GLOB_RECURSE TEMP_OUTPUTFILES
         LIST_DIRECTORIES false
         ${GLOB})
   endif()

   
   string(TOLOWER ${CMAKE_SYSTEM_NAME} LOWERCASE_SYSTEM_NAME)

   foreach(platform "android" "darwin" "linux" "windows")
      if (NOT ${LOWERCASE_SYSTEM_NAME} MATCHES ${platform})
        list(FILTER TEMP_OUTPUTFILES EXCLUDE REGEX "${platform}\.")
      endif()
   endforeach()

   if(ARG_SKIP_DIR)
      list(FILTER TEMP_OUTPUTFILES EXCLUDE REGEX ${ARG_SKIP_DIR})
   endif()
   list(APPEND ${ARG_OUTPUT_VAR} ${TEMP_OUTPUTFILES})
   set(${ARG_OUTPUT_VAR} ${${ARG_OUTPUT_VAR}} PARENT_SCOPE)
endfunction()