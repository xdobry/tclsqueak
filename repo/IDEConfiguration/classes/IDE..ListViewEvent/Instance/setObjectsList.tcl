IDE::ListViewEvent instproc setObjectsList objects {
    my set objectsList $objects
    my set sobject {}
    set elems {}
    foreach obj $objects {
        lappend elems [$obj [my nameMethod]]
    }
    my setListUnsorted $elems
    if {[my exists isMarkedMethod]} {
        my instvar win
        set x 0
        foreach obj $objects {
            if {[$obj [my isMarkedMethod]]} {
                $win.listbox itemconfigure $x -background red
            }
            incr x
        }
    }
}
