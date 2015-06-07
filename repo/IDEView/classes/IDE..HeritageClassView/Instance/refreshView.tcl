IDE::HeritageClassView instproc refreshView {} {
    my instvar actItem introProxy
    set codeController [my info parent]::@codecontroller
    if {[Object isobject $codeController]} {
        $codeController viewContent [list $actItem [$introProxy getSpecialMethodType Def] [$introProxy getComponentNameForObject $actItem]] hierarchy
        return
    }
    set v [my info parent]::methodedit
    if {[$v set vtype] eq "Comment"} {
        set comment [$introProxy getCommentForObject $actItem]
        [my info parent]::methodedit setTextControler $comment [self]
        [my info parent]::stateButton setActivity 0
    } elseif {[$v set vtype] eq "Source"} {
        [my info parent]::methodedit setTextControler [$introProxy getObjDef $actItem] [self]
        set hasComment [$introProxy hasCommentForObject $actItem]
        set sb [my info parent]::stateButton
        $sb setActivity $hasComment
    }
}
