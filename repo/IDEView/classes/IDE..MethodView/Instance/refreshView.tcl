IDE::MethodView instproc refreshView {} {
    my instvar actItem cobj introProxy
    if {$actItem eq ""} return
    set codeController [my getCodeControllerIfExists]
    if {$codeController ne ""} {
        $codeController setBodyText {*}$actItem
        return
    }
    lassign $actItem vtclass vtype method
    set editVType [[my info parent]::stateButton state]
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vtype]
    if {$editVType eq "Comment"} {
        set comment [$introProxy getMethodCommentForObject $vtclass $vtype $method]
        [my info parent]::methodedit setTextControler $comment [self]
        [my info parent]::stateButton setActivity 0
    } elseif {$editVType eq "Source"} {
        my selectHItem $actItem
        set sb [my info parent]::stateButton
        if {[Object isobject $sb]} {
            set hasComment [$introProxy hasMethodCommentForObject $vtclass [IDE::XOIntroProxy getAbstractMethodType $vtype] $method]
            $sb setActivity $hasComment
        }
    } elseif {$editVType eq "Splited"} {
        my selectHItem $actItem
        set comment [$introProxy getMethodCommentForObject $vtclass [IDE::XOIntroProxy getAbstractMethodType $vtype] $method]
        [my info parent]::@comment setTextTypeControler $comment Comment [self]
        [my info parent]::stateButton setActivity 0

    } else {
        error {Unknown view type}
    }
}
