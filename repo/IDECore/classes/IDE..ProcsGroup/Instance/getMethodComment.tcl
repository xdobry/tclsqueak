IDE::ProcsGroup instproc getMethodComment {type method} {
    [my getProcObjForNameIfExist $method] getComment
}
