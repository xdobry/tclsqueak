IDE::CoverClassView instproc refreshBaseView {} {
    my instvar vtype
    set list {}
    foreach obj [IDE::MethodTracker array names trackedArr] {
        switch $vtype {
            Classes {
                if {[Object isclass $obj]} {lappend list [string trimleft $obj :]}
            }
            Objects {
                if {![Object isclass $obj]} {lappend list [string trimleft $obj :]}
            }
        }
    }
    my setList [lsort -unique $list]
    [my info parent]::methodcatview selectFor {} $vtype
}
