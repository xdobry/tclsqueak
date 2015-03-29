IDE::ObjectDescription instproc importAllMethods {} {
    set introProxy [[my getComponent] getIntroProxy]
    set objName [my getObjectName]
    foreach m [$introProxy getClassMethods $objName] {
        set comment [IDE::CommentsContainer objectMethodGetComment $objName Class $m]
        set mobj [my registerClassMethod $m]
        if {$comment ne ""} {
            $mobj setComment $comment
        }
    }
}
