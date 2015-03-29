IDE::CompBrowser instproc changeViewType type {
    my instvar win
    if {$type eq "Splited"} {
        set etype Source
    } else {
        set etype $type
    }
    if {$type eq "Splited"} {
        $win.panedwindow add $win.comment -sticky news -height 100 -after $win.upperarea
    } else {
        if {[winfo ismapped $win.comment]} {
            $win.panedwindow forget $win.comment
        }
    }
    [self]::methodedit changeViewType $etype
}
