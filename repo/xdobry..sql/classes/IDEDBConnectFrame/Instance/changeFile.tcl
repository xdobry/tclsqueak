IDEDBConnectFrame instproc changeFile {name mode} {
    my instvar win
    set parent [winfo toplevel $win]
    if {$mode eq "r"} {
       $win.f$name configure -text [tk_getOpenFile -parent $parent]
    } else {
       $win.f$name configure -text [tk_getSaveFile -parent $parent]
    }
}
