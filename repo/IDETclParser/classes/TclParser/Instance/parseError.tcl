TclParser instproc parseError {text {startpos {}}} {
    my instvar stream parseErrors
    if {$startpos ne ""} {
        lappend parseErrors [list $startpos $startpos $text]
    } else {
        lappend parseErrors [list [$stream pos] [$stream pos] $text]
    }
    if {[[self class] isDevelMode]} {
        error $text
    } else {
        # return code 20 as internal error
        return -code 1020
    }
}
