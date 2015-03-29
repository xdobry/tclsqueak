IDE::CommentScanerBrowser instproc scaneFile file {
    my instvar handler actualDir
    set handler [open [file join $actualDir $file] r]
    my skipComment
    while {![eof $handler]} {
        my getCommand
        my setComment
        my getComment
    }
    close $handler
}
