#!/bin/bash

mkdir build/trilinos
mkdir install/trilinos
cd build/trilinos

rm -Rf CMakeCache.txt CMakeFiles build.ninja

ARGS=(
  -GNinja
  # -D Trilinos_CONFIGURE_OPTIONS_FILE:STRING=cmake/std/atdm/ATDMDevEnv.cmake
  # -D CMAKE_BUILD_TYPE=RELWITHDEBINFO
  -D CMAKE_BUILD_TYPE=DEBUG
  -D Trilinos_ENABLE_DEBUG=ON
  -D Trilinos_ENABLE_TESTS=OFF
  -D Trilinos_ENABLE_ShyLU_NodeFastILU=OFF
  -D CMAKE_EXPORT_COMPILE_COMMANDS=1 
  -D Ifpack2_ENABLE_EXPLICIT_INSTANTIATION=1
  -D Trilinos_ENABLE_Ifpack2=ON
  -D Trilinos_ENABLE_MueLu=ON
  -D MueLu_ENABLE_EXAMPLES=ON
  -D Ifpack2_ENABLE_TESTS=ON
  -D Trilinos_ENABLE_Teko=ON
  -D Trilinos_ENABLE_Intrepid2=OFF
  -D Trilinos_ENABLE_COMPLEX=ON
  -D Trilinos_ENABLE_FLOAT=ON
  -D Trilinos_ENABLE_EXPLICIT_INSTANTIATION:BOOL=ON
  -D TPL_ENABLE_CUDA:BOOL=ON
  -D Kokkos_ENABLE_CUDA_UVM:BOOL=ON
  -D Kokkos_ENABLE_CUDA_LAMBDA:BOOL=ON
  -D Kokkos_ENABLE_CUDA_CONSTEXPR:BOOL=ON
  -D Tpetra_ASSUME_CUDA_AWARE_MPI:BOOL=OFF
  -D KokkosKernels_INST_MEMSPACE_CUDAUVMSPACE=ON
  -D Tpetra_ALLOCATE_IN_SHARED_SPACE=ON
  -D Kokkos_ARCH_VOLTA70:BOOL=ON
  -D Kokkos_ENABLE_CUDA:BOOL=ON
  -D Kokkos_ENABLE_CUDA_RELOCATABLE_DEVICE_CODE:BOOL=ON
  -D TPL_ENABLE_CUSPARSE:BOOL=ON
  -D BUILD_SHARED_LIBS:BOOL=OFF
  -D CMAKE_BUILD_TYPE:STRING=release
  -D CMAKE_C_COMPILER=/projects/sierra/linux_rh7/SDK/mpi/openmpi/4.0.5-nvidia-11.2.1-RHEL7/bin/mpicc
  -D CMAKE_CXX_COMPILER=/projects/sierra/linux_rh7/SDK/mpi/openmpi/4.0.5-nvidia-11.2.1-RHEL7/bin/mpic++
  -D CMAKE_Fortran_COMPILER=/projects/sierra/linux_rh7/SDK/mpi/openmpi/4.0.5-nvidia-11.2.1-RHEL7/bin/mpif90
  -D CMAKE_CXX_STANDARD=17
  -D CMAKE_INSTALL_PREFIX=../../install/trilinos
  -DTrilinos_ENABLE_LINEAR_SOLVER_FACTORY_REGISTRATION:BOOL=ON
  -DTrilinos_ENABLE_ML:BOOL=ON

  -DTpetra_INST_INT_LONG:BOOL=ON
  -DTpetra_INST_INT_LONG_LONG:BOOL=OFF
)

set -o pipefail
cmake "${ARGS[@]}" $TRILINOS | tee config.log
