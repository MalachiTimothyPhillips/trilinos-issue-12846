# Trilinos Issue #12846

Provide minimal reproducer to replicate linker error for Trilinos issue #12846

## How do I build this?

Set env-variable TRILINOS to be the path to your checkout of the Trilinos repo.
```
export TRILINOS=/path/to/Trilinos
```

Then, navigate to the directory for this repo.
```
cd /path/to/trilinos-issue-12846
```

Check the compiler paths in the configure script:
```
cat config_trilinos.sh
```

Pay special attention to the paths for the C, C++, and Fortran compilers (these should be accessible on any CEE resources, alter as needed):
```
  -D CMAKE_C_COMPILER=/projects/sierra/linux_rh7/SDK/mpi/openmpi/4.0.5-nvidia-11.2.1-RHEL7/bin/mpicc
  -D CMAKE_CXX_COMPILER=/projects/sierra/linux_rh7/SDK/mpi/openmpi/4.0.5-nvidia-11.2.1-RHEL7/bin/mpic++
  -D CMAKE_Fortran_COMPILER=/projects/sierra/linux_rh7/SDK/mpi/openmpi/4.0.5-nvidia-11.2.1-RHEL7/bin/mpif90
```

Once the compiler paths have been set, run the configure script for Trilinos:
```
./config_trilinos.sh
```

Run the Trilinos compilation script (this will take awhile):
```
./build_trilinos.sh
```

Once completed, build the example, noting that the C, C++, and Fortran compilers need to match those from `config_trilinos.sh`:
```
./build.sh
```
Note that you will need `ninja` to do the compilation _after_ the cmake phase in `build.sh`.
