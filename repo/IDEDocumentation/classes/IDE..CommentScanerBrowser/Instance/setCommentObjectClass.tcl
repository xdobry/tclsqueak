IDE::CommentScanerBrowser instproc setCommentObjectClass {} {
    my instvar commentBody commandBody
    set object [lindex $commandBody 1]
    if {![Object isobject $object]} {
        my warningMessage "Object $object not found"
    } else {
        $object setComment $commentBody
        my incr importedComments
    }
}
