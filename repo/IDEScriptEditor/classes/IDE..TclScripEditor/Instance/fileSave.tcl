IDE::TclScripEditor instproc fileSave {} {
    my instvar fileName
    if {![info exists fileName]} {
        my fileOut
    } else {
        my saveFile $fileName
    }
}
