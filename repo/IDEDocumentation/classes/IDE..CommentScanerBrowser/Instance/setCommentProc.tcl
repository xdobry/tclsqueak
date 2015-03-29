IDE::CommentScanerBrowser instproc setCommentProc {} {
    my instvar commentBody commandBody
    set name [lindex $commandBody 1]
    set desc [IDE::TclProcsDescription getMethodFor $name]
    if {$desc eq ""} {
        my warningMessage "proc $name not registered"
    } else {
        $desc setComment $commentBody
        my incr importedComments
    }
}
