IDE::CommentsContainer proc getObjectContainer object {
    if {[my exists objectHash($object)]} {
        return [my set objectHash($object)]
    }
    return
}
