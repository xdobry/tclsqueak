IDE::CachedObject instproc makePersistent {} {
    next
    IDE::ObjectCache setInstance [self]
}
