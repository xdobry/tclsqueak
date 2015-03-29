IDE::TclScripEditor instproc fileIn {} {
    next
    my instvar fileName
    if {[info exists fileName]} {
        [my info parent] setTitleAddition $fileName
    }
}
