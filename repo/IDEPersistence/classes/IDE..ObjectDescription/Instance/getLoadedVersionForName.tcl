IDE::ObjectDescription instproc getLoadedVersionForName name {
    # ??? problem
    # there can be instproc and proc with same names
    # check instproc first than proc
    if {[self calledclass] eq ""} { next } else {
        return [my getMethodId $name]
    }
}
