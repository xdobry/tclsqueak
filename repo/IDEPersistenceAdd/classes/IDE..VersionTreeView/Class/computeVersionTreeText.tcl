IDE::VersionTreeView proc computeVersionTreeText comps {
    foreach comp $comps {
        set id [lindex $comp 1]
        set basedon [lindex $comp 0]
        if {$basedon ne "" && $basedon!=0 && [info exists deep($basedon)]} {
            set deep($id) [expr $deep($basedon)+1]
        } else {
            set deep($id) 0
        }
    }
    set result {}
    foreach comp $comps {
        set id [lindex $comp 1]
        append result "[string repeat { } $deep($id)][join [lrange $comp 1 end] -]\n"
    }
    return $result
}
