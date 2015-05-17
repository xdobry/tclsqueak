IDE::ClassView instproc refreshView {} {
    my instvar vclass vtype cobj vcomponent
    set introProxy [$cobj getIntroProxy]
    set codeController [my info parent]::@codecontroller
    if {[Object isobject $codeController]} {
        if {[my isProcView]} {
            $codeController setBodyText $vclass ProcsGroup $vcomponent
        } else {
            $codeController setBodyText $vclass [$introProxy getMethodTypePrefix]Def $vcomponent
        }
        return
    }
    set v [my info parent]::methodedit
    set editVType [[my info parent]::stateButton state]
    if {$editVType eq "Source" || $editVType eq "Splited"} {
        if {[my isProcView]} {
            set text [$vclass getDefBody]
        } else {
            set text [$introProxy getObjDef $vclass]
        }
        set hasComment [$introProxy hasCommentForObject $vclass]
        $v setTextControler $text [self]
        set sb [my info parent]::stateButton
        if {$editVType eq "Splited"} {
            [my info parent] @comment setTextTypeControler [$introProxy getCommentForObject $vclass] Comment [self]
            $sb  setActivity 0
        } else {
            if {[Object isobject $sb]} {
                $sb  setActivity $hasComment
            }
        }
    } elseif {$editVType eq "Comment"} {
        $v setTextControler [$introProxy getCommentForObject $vclass] [self]
        [my info parent]::stateButton setActivity 0
    } else {
        error {Unknown view type}
    }
}
