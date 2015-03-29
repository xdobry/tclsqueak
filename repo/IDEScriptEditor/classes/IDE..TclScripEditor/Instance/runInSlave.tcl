IDE::TclScripEditor instproc runInSlave {} {
    set script [my getText]
    if {$script ne ""} {
        if {[lsearch [interp slaves] scriptslave]==-1} {
            interp create scriptslave
        }
        scriptslave eval $script
    }
}
