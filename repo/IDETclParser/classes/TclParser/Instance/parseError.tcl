TclParser instproc parseError text {
    my instvar stream parseErrors
    lappend parseErrors [list [$stream pos] [$stream pos] $text]
    if {[[self class] isDevelMode]} {
        error $text
    } else {
        # return code 20 as internal error
        return -code 1020
    }
}
