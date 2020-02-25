from cudf._libxx.lib cimport *

cdef extern from "cudf/merge.hpp" namespace "cudf::experimental" nogil:
    cdef unique_ptr[table] merge (
        vector[table_view] tables_to_merge,
        vector[size_type] key_cols,
        vector[order] column_order,
        vector[null_order] null_precedence,
    ) except +
