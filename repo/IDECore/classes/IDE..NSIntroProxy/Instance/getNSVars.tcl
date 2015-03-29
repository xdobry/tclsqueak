IDE::NSIntroProxy instproc getNSVars {} {
    my instvar currentNS
    set l [my evalString [list ::info vars]]
    if {$currentNS ne "::"} {
        ide::lremoveAll l [my evalString [list ::info globals]]
    }
    return $l
}
