cmake_minimum_required(VERSION 2.9)
project(ndt_map)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden -fPIC")

if(NOT DEFINED CMAKE_SUPPRESS_DEVELOPER_WARNINGS)
     set(CMAKE_SUPPRESS_DEVELOPER_WARNINGS 1 CACHE INTERNAL "No dev warnings")
endif()

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")

find_package(PCL 1.11 REQUIRED)
find_package(OpenCV REQUIRED)
find_package(Eigen3 REQUIRED)

add_library(${PROJECT_NAME}
  src/ndt_cell.cpp
  src/ndt_map.cpp
  src/cell_vector.cpp
  src/lazy_grid.cpp
  src/ndt_histogram.cpp
)

include_directories(include
                    ${catkin_INCLUDE_DIRS}
                    ${EIGEN3_INCLUDE_DIR}
                    ${OpenCV_INCLUDE_DIRS}
                    ${PCL_INCLUDE_DIRS})

add_definitions(${EIGEN3_DEFINITIONS})

link_directories(${OpenCV_LIBRARY_DIRS})

target_link_libraries(${PROJECT_NAME}
                      ${PCL_LIBRARIES}
                      ${OpenCV_LIBRARIES})

install(TARGETS ${PROJECT_NAME}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}
  LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}
  RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION "include/${PROJECT_NAME}"
)

install(DIRECTORY cmake/
  DESTINATION "share/${PROJECT_NAME}"
  FILES_MATCHING PATTERN "*.cmake"
)
