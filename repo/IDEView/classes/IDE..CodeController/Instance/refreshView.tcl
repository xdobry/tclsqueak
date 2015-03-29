IDE::CodeController instproc refreshView {} {
    my instvar actItem
    lassign $actItem class type method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
    set v [my info parent]::methodedit
    if {[$v set vtype] eq "Comment"} {
        set comment [$introProxy getMethodCommentForObject $class $type $method]
        my setTextControler $comment [self]
    } elseif {[$v set vtype] eq "Source"} {
        my setBodyTextControler $class $type $method [self]
        set sb [my info parent]::stateButton
        # procs not controlled by IDE has no ProcsGroups
        if {[Object isobject $sb] && $class ne ""} {
            set hasComment [$introProxy hasMethodCommentForObject $class $type $method]
            $sb  setActivity $hasComment
        }
    }
}
