IDE::TkWinConfList instproc selectFor window {
    my instvar vwindow
    set vwindow $window
    if {$window eq ""} {
        my setList {}
    } else {
        my setListUnsorted [concat _all [lsort [ide::lcollect each [$window configure] {lindex $each 0}]]]
        [my info parent] setStatusBarText "$window - [winfo class $window]"
    }
    my selectItem {}
}
