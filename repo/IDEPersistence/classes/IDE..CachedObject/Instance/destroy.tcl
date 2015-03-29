IDE::CachedObject instproc destroy {} {
    IDE::ObjectCache removeInstance [self]
    next
}
