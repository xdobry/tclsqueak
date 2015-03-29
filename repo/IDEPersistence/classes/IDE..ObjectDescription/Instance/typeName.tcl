IDE::ObjectDescription instproc typeName {} {
    if {[self calledclass] eq ""} { next } else {
        return Method
    }
}
