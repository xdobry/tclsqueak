IDE::MethodEdit instproc setBodyTextControler {tvclass tvtype tmethod controler} {
    my instvar vclass vctype method
    set vclass $tvclass
    set vctype $tvtype
    set method $tmethod
    set ret {}
    if {$tvtype eq "Procs"} {
        if {[Object isobject $tvclass]} {
            set pobj [$tvclass getProcObjForNameIfExist $tmethod]
            if {$pobj ne ""} {
                set ret [$pobj getBody]
            }
        }
    } elseif {$tvtype eq "Component"} {
        set cobj [IDE::Component getCompObjectForNameIfExist $vclass]
        if {$cobj ne ""} {
            set ret [$cobj getComment]
        }
    } else {
        set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $tvtype]
        set rtype [IDE::XOIntroProxy getAbstractMethodType $tvtype]
        if {$rtype eq "Def"} {
            set ret [IDE::CommentsContainer wrapCommentToSource [$introProxy getCommentForObject $tvclass]]
            append ret [$introProxy getObjDef $tvclass]
        } elseif {$rtype eq "ProcsGroup"} {
            set ret [$vclass getDefBody]
        } else {
            set comment [$introProxy getMethodCommentForObject $tvclass $rtype $tmethod]
            set ret [IDE::CommentsContainer wrapCommentToSource $comment]
            append ret [$introProxy getBody${rtype}MethodIfExist $tvclass $tmethod]
        }
    }
    if {$ret eq ""} {
        my setTextControler "# Method $tmethod in $tvclass was probably deleted from the System" $controler
    }
    my setTextControler $ret $controler xotcl
}
