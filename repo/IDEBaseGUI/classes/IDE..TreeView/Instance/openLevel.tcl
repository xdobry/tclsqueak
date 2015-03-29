IDE::TreeView instproc openLevel {level {parent {}}} {
    my instvar win
    if {$level==0} return
    set twin $win.listbox
    foreach c [$twin children $parent] {
        $twin item $c -open true
        my openLevel [expr {$level-1}] $c
    }
}
