XOMetakit instproc connect par_list {
    my instvar handle connected unitOfWork
    set unitOfWork 0
    set handle [Object autoname odbchandle]
    array set par_array $par_list
    foreach k [array names par_array] {
         my set $k $par_array($k)
    }
    set metakit_file $par_array(metakit_file)
    package require Mk4tcl
    set handle [Object autoname metakit]
    mk::file open $handle $metakit_file
    my set dbank $metakit_file
    set connected 1
    return 1
}
