IDE::CodeSearch proc searchImplementorsAll {implementor {nocomplain 0}} {
    set list [list]
    foreach comp [[IDE::XOIntroProxy getIntroProxy] getUserRelevantComponents] {
        lappend list {*}[my searchImplementorsComponent $implementor $comp]
    }
    return $list
}
