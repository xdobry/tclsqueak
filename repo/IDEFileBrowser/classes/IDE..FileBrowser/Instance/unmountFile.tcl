IDE::FileBrowser instproc unmountFile to {
    my instvar mountsFrom mountsTo currentDic
    set index [lsearch $mountsTo $to]
    if {$index>=0} {
        set mountsFrom [lreplace $mountsFrom $index $index]
        set mountsTo [lreplace $mountsTo $index $index]
        vfs::unmount $to
        if {[string match ${currentDic}* $to]} {
            my changeToHome
        } else {
            my refreshFiles        
        }
    }
}
