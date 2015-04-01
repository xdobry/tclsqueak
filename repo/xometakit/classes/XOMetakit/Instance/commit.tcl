XOMetakit instproc commit {{force 0}} {
    my instvar handle unitOfWork
    if {$force || $unitOfWork<=0} {
        mk::file commit $handle
    }
}
