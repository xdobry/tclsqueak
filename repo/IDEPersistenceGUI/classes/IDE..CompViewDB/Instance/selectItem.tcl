IDE::CompViewDB instproc selectItem item {
    next
    set cobj [IDE::Component getCompObjectForName $item]
    if {[$cobj isPersistent]} {
        [my info parent] setStatusBarText [$cobj printString]
    } else {
        [my info parent] setStatusBarText "$item (component not in DB)"
    }
}
