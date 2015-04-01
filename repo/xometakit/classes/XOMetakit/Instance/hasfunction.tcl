XOMetakit instproc hasfunction func {
    if {[[my info class] info instprocs $func] ne ""} {
        return 1
    }
    return 0
}
