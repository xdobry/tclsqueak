TclHtmlBuilder instproc openFile fileName {
    my instvar out
    if {[info exists out]} {
        error "html out file already opened"
    }
    set out [open $fileName w]
    fconfigure $out -encoding utf-8
}
