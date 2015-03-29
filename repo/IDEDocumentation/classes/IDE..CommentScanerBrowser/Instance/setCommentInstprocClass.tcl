IDE::CommentScanerBrowser instproc setCommentInstprocClass {} {
    my instvar commentBody commandBody
    set class [lindex $commandBody 0]
    set name [lindex $commandBody 2]
    if {![Object isclass $class] || [$class info instprocs $name] eq ""} {
        my warningMessage "Class $class method $name not found"
    } else {
        $class setMethodComment Instance $name $commentBody
        my incr importedComments
    }
}
