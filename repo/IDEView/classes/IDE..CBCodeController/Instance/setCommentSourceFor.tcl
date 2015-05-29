IDE::CBCodeController instproc setCommentSourceFor {comment source class type method} {
    [my getMethodedit] setCommentSourceItemControler $comment $source $class $type $method [self]
}
