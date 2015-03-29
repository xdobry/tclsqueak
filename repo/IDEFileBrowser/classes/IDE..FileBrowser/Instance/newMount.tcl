IDE::FileBrowser instproc newMount {type from to} {
    my instvar mountsFrom mountsTo
    if {[my exists mountFrom] && [lsearch  $mountsFrom $from]>=0} {
        IDE::Dialog error "$from already mounted"
        return
    }
    if {[my exists mountsTo] && [lsearch $mountsTo $to]>=0} {
        set to [Object autoname $to]
    }
    package require vfs::$type
    vfs::${type}::Mount $from $to
    lappend mountsFrom $from
    lappend mountsTo $to
    my set currentDic $from
    my refreshFiles
}
