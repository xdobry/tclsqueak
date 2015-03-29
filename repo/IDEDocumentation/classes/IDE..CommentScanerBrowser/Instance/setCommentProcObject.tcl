IDE::CommentScanerBrowser instproc setCommentProcObject {} {
    my instvar commentBody commandBody
    set object [lindex $commandBody 0]
    set name [lindex $commandBody 2]
    if {![Object isobject $object] || [$object info procs $name] eq ""} {
        my warningMessage "Object $object method $name not found"
    } else {
        $object setMethodComment Class $name $commentBody
        my incr importedComments
    }
}
