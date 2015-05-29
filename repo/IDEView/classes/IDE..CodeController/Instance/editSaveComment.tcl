IDE::CodeController instproc editSaveComment {comment {contentDesc {}}} {
    lassign $contentDesc vclass vtype method
    if {$vtype eq "Procs"} {
        if {[Object isobject $vclass]} {
            set pobj [$vclass getProcObjForNameIfExist $method]
            if {$pobj ne ""} {
                $pobj setComment [IDE::CommentsContainer unwrapCommentFromSource $comment]
            }
        }
    } elseif {$vtype eq "Component"} {
        set cobj [IDE::Component getCompObjectForNameIfExist $vclass]
        if {$cobj ne ""} {
            $cobj setComment $comment
        }
    } else {
        set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $vtype]
        set rtype [IDE::XOIntroProxy getAbstractMethodType $vtype]
        set comment [IDE::CommentsContainer unwrapCommentFromSource $comment]
        if {$rtype eq "Def"} {
            $introProxy setCommentForObject $vclass $comment
        } elseif {$rtype eq "ProcsGroup" && [Object isobject $vclass]} {
            $vclass setComment $comment
        } else {
            $introProxy setMethodCommentForObject $vclass $rtype $method $comment
        }
    }
}
