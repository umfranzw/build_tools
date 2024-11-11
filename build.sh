#!/bin/bash -v

function build ()
{
    build_benchmarks=OFF
    build_benchmark_config_tuning=OFF
    build_tests=OFF
    cmake_cxx_flags=""

    if [[ $1 == *"b"* ]]
    then
       build_benchmarks=ON
    fi

    if [[ $1 == *"c"* ]]
    then
       build_benchmark_config_tuning=ON
    fi

    if [[ $1 == *"t"* ]]
    then
       build_tests=ON
    fi

    if [[ $1 == *"g"*  ]]
    then
        cmake_cxx_flags="-O0 -ggdb"
    fi

    if [[ $1 == *"r"* ]]
    then
       rm -R build/
    fi

    ROCM_PATH=/opt/rocm CXX=hipcc cmake -B build -DBUILD_BENCHMARK=$build_benchmarks -DBUILD_BENCHMARKS=$build_benchmarks -DBUILD_BENCHMARK_CONFIG_TUNING=$build_benchmark_config_tuning -DBUILD_TEST=$build_tests -DAMDGPU_TARGETS=$2 -DCMAKE_CXX_FLAGS="$cmake_cxx_flags"
    cd build/

    if [[ $1 == *"m"*  ]]
    then
        make -j
    fi

    if [[ $1 == *"i"* ]]
    then
       make install
    fi
}
