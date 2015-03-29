IDE::ObjectDescription instproc loadVersionId methodId {
    if {[self calledclass] eq ""} { next } else {
        if {![my questForChange]} return
        my loadMethod $methodId  
    }
}
