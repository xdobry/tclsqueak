IDE::Editor instproc getFile {} {
    my instvar win fileName
    if {[info exists fileName]} {
        return $fileName
    }
    return
}
