project(MueLuLinkerError)
cmake_minimum_required(VERSION 3.23)

set(CMAKE_CXX_STANDARD 17)

find_package(Trilinos REQUIRED COMPONENTS Tpetra MueLu)

message("Trilinos_AR = ${Trilinos_AR}")
message("Trilinos_LINKER = ${Trilinos_LINKER}")

set(CMAKE_AR ${Trilinos_AR})
set(CMAKE_LINKER ${Trilinos_LINKER})

add_executable(example example.cc)
target_link_libraries(example  Trilinos::all_selected_libs)
