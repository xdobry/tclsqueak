Tcl2HTML proc startFromShell arguments {
    #TclParser setDevelMode 1
    set fileContext [Tcl2HTML new]
    $fileContext startWithArgs $arguments
}
