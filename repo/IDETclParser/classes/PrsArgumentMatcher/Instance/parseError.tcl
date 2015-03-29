PrsArgumentMatcher instproc parseError {elem message} {
    my instvar parseErrors
    lappend parseErrors [list $elem $message]
    error "$message"
}
