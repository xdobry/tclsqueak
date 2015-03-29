IDE::ObjectDescription instproc loadNameVersionId {name methodId compObj} {
    if {[self calledclass] eq ""} { next } else {
        my loadVersionId $methodId
    }
}
