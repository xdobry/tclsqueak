IDE::TclModeEdit instproc save {} {
    my instvar hasErrors
    if {![my exists oldtext]} return
    set newtext [my getText]
    if {[[my getTextWindow] edit modified] || $hasErrors} {
       my saveValue $newtext
    }
}
