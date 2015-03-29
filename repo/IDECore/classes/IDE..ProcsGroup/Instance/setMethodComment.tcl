IDE::ProcsGroup instproc setMethodComment {type method comment} {
    [my getProcObjForNameIfExist $method] setComment $comment
}
