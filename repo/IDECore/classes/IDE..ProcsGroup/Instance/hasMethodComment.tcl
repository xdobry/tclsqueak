IDE::ProcsGroup instproc hasMethodComment {type method} {
    [my getProcObjForNameIfExist $method] hasComment
}
