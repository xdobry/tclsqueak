IDE::AbstractMethodGroup instproc loadAllMethods {} {
    foreach id [my getSubobjectIndexes] {
        my loadMethod $id
    }
}
