# - Try to find ndt_map header files and libraries
#
# Once done this will define
#
# NDT_MAP

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)
set(ndt_map_INCLUDE_DIR "${PACKAGE_PREFIX_DIR}/ndt_map/include")
set(ndt_map_LIBRARIES "${PACKAGE_PREFIX_DIR}/ndt_map/libndt_map.a")
