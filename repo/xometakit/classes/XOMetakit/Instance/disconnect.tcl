XOMetakit instproc disconnect {} {
    if {[my exists connected] && [my set connected]} {
        my instvar handle
        mk::file close $handle
        my set connected 0
   }
}
