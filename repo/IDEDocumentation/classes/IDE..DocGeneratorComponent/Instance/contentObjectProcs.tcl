IDE::DocGeneratorComponent instproc contentObjectProcs class {
    set ind 0
    set text {}
    foreach m [lsort [$class info procs]] {
        set comment [$class getMethodComment Class $m]
        if {$comment eq "" && [my ignoreNoCommented]} continue
        if {!$ind} {
            append text "<h3>Procs:</h3>\n"
            set ind 1
        }
        append text [my getMemberComment $m [my getClassMethodArguments $class $m] $comment]
    }
    return $text
}
