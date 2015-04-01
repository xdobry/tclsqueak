XOMetakit instproc closeUnitOfWork {} {
    my instvar unitOfWork
    incr unitOfWork -1
    if {$unitOfWork<=0} {
        my commit
    }
}
