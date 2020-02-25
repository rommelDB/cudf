# Copyright (c) 2020, NVIDIA CORPORATION.

# cython: profile=False
# distutils: language = c++
# cython: embedsignature = True
# cython: language_level = 3

from cudf._libxx.lib import *
from cudf._libxx.lib cimport *
from cudf._libxx.column cimport *

cdef extern from "dlpack/dlpack.h" nogil:
    ctypedef struct DLManagedTensor:
        void(*deleter)(DLManagedTensor*) except +

cdef extern from "cudf/dlpack.hpp" namespace "cudf" \
        nogil:
    cdef unique_ptr[table] from_dlpack(const DLManagedTensor* tensor
                                       ) except +

    DLManagedTensor* to_dlpack(table_view input_table
                               ) except +
