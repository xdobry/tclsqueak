IDE::ListView instproc removeItemAt pos {
    # remove Item at position 0 - end
    my instvar win listItems selectedIndex
    if {$pos==$selectedIndex} {
        set selectedIndex -1
    }
    if {$pos<$selectedIndex} {
        incr selectedIndex -1
    }
    set listItems [lreplace $listItems $pos $pos]
    $win.listbox delete $pos
}
