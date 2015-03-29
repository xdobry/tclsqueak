IDE::FileBrowser instproc destroy {} {
    my instvar mountsTo
    if {[info exists mountsTo]} {
        foreach f $mountsTo {
            vfs::unmount $f
        }
    }
    next
}
