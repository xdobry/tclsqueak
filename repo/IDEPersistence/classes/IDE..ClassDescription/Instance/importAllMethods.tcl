IDE::ClassDescription instproc importAllMethods {} {
    next
    set object [my getObjectName]
    set introProxy [my getCompIntroProxy]
    foreach m [$introProxy getInstanceMethods $object] {
        set comment [IDE::CommentsContainer objectMethodGetComment [my getObjectName] Instance $m]
        set mobj [my registerInstanceMethod $m]
        if {$comment ne ""} {
            $mobj setComment $comment
        }
    }
    my registerDefMethod
}
