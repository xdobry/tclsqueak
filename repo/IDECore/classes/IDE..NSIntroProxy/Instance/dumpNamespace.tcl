IDE::NSIntroProxy instproc dumpNamespace {} {
    my instvar currentNS
    set ret ""
    if {$currentNS ne ""} {
        append ret "namespace eval [list $currentNS] \{\n"
    }
    set ident "    "

    foreach v [lsort [my getNSVars]] {
        if {[my evalString [list array exists $v]]} {
            append ret $ident "variable [list $v]\n"
            append ret $ident "array set [list $v] [list [my evalString [list array get $v]]]" \n
        } else {
            append ret $ident "variable [list $v] [list [my evalString [list set $v]]]" \n
        }
    }

    foreach p [lsort [my evalString {info procs}]] {
        append ret $ident [my getProcBody $p]
    }

    set imports [my evalString {namespace import}]
    if {[llength $imports]>0} {
        append ret $ident "namespace import [concat $imports]" \n
    }
    set exports [my evalString {namespace export}]
    if {[llength $imports]>0} {
        append ret $ident "namespace export [concat $exports]" \n
    }

    if {$currentNS ne ""} {
        append ret "\}\n"
    }
    return $ret
}
