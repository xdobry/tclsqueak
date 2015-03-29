IDE::DocGeneratorComponent instproc contentProc group {
    set ind 0
    set text "<a name=\"pgroup_[$group name]\">\n<h3>Procsgroup [$group name]</h3>\n"
    append text [my getCommentClass [$group getComment] objcomment]
    foreach m [lsort [$group getProcsNames]] {
        set pobj [$group getProcObjForName $m]
        set comment [$pobj getComment]
        if {$comment eq "" && [my ignoreNoCommented]} continue
        if {!$ind} {
            append text "<h3>Methods:</h3>\n"
            set ind 1
        }
        append text [my getMemberComment $m [my getProcArguments $m] $comment]
    }
}
