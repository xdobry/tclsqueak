TclHtmlBuilder instproc closeAndDestroy {} {
    my printHtmlFooter
    my closeFile
    my destroy
}
