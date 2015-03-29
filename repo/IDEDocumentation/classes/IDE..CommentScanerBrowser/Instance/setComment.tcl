IDE::CommentScanerBrowser instproc setComment {} {
    my instvar commentBody commandBody
    puts "c $commandBody # $commentBody"
    set commentBody [string trim $commentBody]
    if {$commentBody eq "" || $commandBody eq ""} return
    set first [lindex $commandBody 0]
    set second [lindex $commandBody 1]
    set third [lindex $commandBody 2]
    if {$first eq "proc"} {
        my setCommentProc
    } elseif {$first eq "Object" || $first eq "Class"} {
        my setCommentObjectClass
    } elseif {$second eq "proc"} {
        my setCommentProcObject
    } elseif {$second eq "instproc"} {
        my setCommentInstprocClass
    }
    set commentBody {}
}
