#!/bin/bash
#rm -rf build
#mkdir build
#./config_trilinos.sh
#./build_trilinos.sh

rm -Rf CMakeCache.txt CMakeFiles build.ninja

ARGS=(
  -GNinja
  -D CMAKE_BUILD_TYPE=RELEASE
  -D CMAKE_C_COMPILER=/projects/sierra/linux_rh7/SDK/mpi/openmpi/4.0.5-nvidia-11.2.1-RHEL7/bin/mpicc
  -D CMAKE_CXX_COMPILER=/projects/sierra/linux_rh7/SDK/mpi/openmpi/4.0.5-nvidia-11.2.1-RHEL7/bin/mpic++
  -D CMAKE_Fortran_COMPILER=/projects/sierra/linux_rh7/SDK/mpi/openmpi/4.0.5-nvidia-11.2.1-RHEL7/bin/mpif90
#  -D CMAKE_C_COMPILER=/sierra/sntools/SDK/mpi/openmpi/4.0.5-clang-14.0-RHEL7/bin/mpicc
#  -D CMAKE_CXX_COMPILER=/sierra/sntools/SDK/mpi/openmpi/4.0.5-clang-14.0-RHEL7/bin/mpic++
#  -D CMAKE_Fortran_COMPILER=/sierra/sntools/SDK/mpi/openmpi/4.0.5-clang-14.0-RHEL7/bin/mpif90
)

set -o pipefail
cmake "${ARGS[@]}" . | tee config.log
ninja
#cmake --build ./build --target install -j8