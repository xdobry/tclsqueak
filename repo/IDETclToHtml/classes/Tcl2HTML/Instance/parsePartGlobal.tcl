Tcl2HTML instproc parsePartGlobal script {
    next
    my instvar htmlOut parseMode fileName errors noerror
    if {[info exists noerror] && $noerror} {
        set errors [list]
    }
    if {$parseMode eq "report"} {
        my @markup collectMarkups [self] [my getPathTruncateFile $fileName]
        my @markup insertHtmlMarkups $script $htmlOut
    } else {
        my @markup collectMarkups [self] [my getPathTruncateFile $fileName]
    }
}
