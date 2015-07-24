IDE::MethodEdit instproc setBodyTextControler {tvclass tvtype tmethod controler} {
    my instvar vclass vctype method
    set vclass $tvclass
    set vctype $tvtype
    set method $tmethod
    set comment ""
    set source ""
    set rtype [IDE::XOIntroProxy getAbstractMethodType $tvtype]
    if {$rtype eq "Procs"} {
        if {[Object isobject $tvclass]} {
            set pobj [$tvclass getProcObjForNameIfExist $tmethod]
            if {$pobj ne ""} {
                set source [$pobj getBody]
                set comment [IDE::CommentsContainer wrapCommentToSource [$pobj getComment]]
            }
        }
    } elseif {$tvtype eq "Component"} {
        set cobj [IDE::Component getCompObjectForNameIfExist $vclass]
        if {$cobj ne ""} {
            set source [$cobj getComment]
        }
    } else {
        set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $tvtype]
        if {$rtype eq "Def"} {
            set comment [IDE::CommentsContainer wrapCommentToSource [$introProxy getCommentForObject $tvclass]]
            set source [$introProxy getObjDef $tvclass]
        } elseif {$rtype eq "ProcsGroup"} {
            set source [$vclass getDefBody]
            set comment [IDE::CommentsContainer wrapCommentToSource [$vclass getComment]]
        } else {
            set comment [$introProxy getMethodCommentForObject $tvclass $rtype $tmethod]
            set comment [IDE::CommentsContainer wrapCommentToSource $comment]
            set source [$introProxy getBody${rtype}MethodIfExist $tvclass $tmethod]
        }
    }
    if {$source eq ""} {
        my setTextControler "# Method $tmethod in $tvclass was probably deleted from the System" $controler
    }
    my setCommentSourceControler $comment $source $controler
}
