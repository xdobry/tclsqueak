IDE::IntroProxy proc getObjectCommentBody object {
    set comment [$object getComment]
    if {$comment eq ""} return
    set cname [my stripNamespace [$object info class]]
    set script "@ $cname [string trimleft $object :] \{\n[my asDescriptionList $comment]\n\}\n"
    return $script
}
