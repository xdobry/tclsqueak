IDE::DocGeneratorComponent instproc contentClass class {
    set ind 0
    set text "<a name=\"class_$class\">\n<h3>Class $class</h3>\n"
    if {[$class info parameter] ne ""} {
        append text "parameters: [$class info parameter]<br>\n"
    }
    set scs [$class info superclass]
    if {$scs ne "::xotcl::Object"} {
        append text "<b>superclasses:</b>\n"
        foreach sc $scs {
            append text [my linkToObject $sc]
        }
        append text </br>
    }
    set scs [$class info subclass]
    if {$scs ne ""} {
        append text "<b>subclasses:</b>\n"
        foreach sc $scs {
            append text [my linkToObject $sc]
        }
        append text </br>
    }
    append text [my getCommentClass [$class getComment] objcomment]

    foreach m [lsort [$class info instprocs]] {
        set comment [$class getMethodComment Instance $m]
        if {$comment eq "" && [my ignoreNoCommented]} continue
        if {!$ind} {
            append text "<h3>Instprocs:</h3>\n"
            set ind 1
        }
        append text [my getMemberComment $m [my getInstMethodArguments $class $m] $comment]
    }
    append text [my contentObjectProcs $class]
    return $text
}
