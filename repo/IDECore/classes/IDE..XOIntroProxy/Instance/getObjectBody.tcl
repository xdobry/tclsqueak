IDE::XOIntroProxy instproc getObjectBody {object {nometa 0}} {
    if {!$nometa} {
        append script [my getObjectCommentBody $object]
    }
    append script [my getObjDef $object]
    if {!$nometa} {
        append script [my metadataAsScriptForObject $object]
    }
    if {[my isObjectClass $object]} {
        set parameters [list]
        foreach par [my getParameterForClass $object] {
            lappend parameters [lindex $par 0]
        }
        foreach method [lsort [my getInstanceMethods $object _all_categories]] {
            if {$method in $parameters} continue
            if {!$nometa} {
                append script [my getObjectMethodCommentBody $object Instance $method]
            }
            append script [my getBodyInstanceMethod $object $method]
        }
    }
    foreach method [lsort [my getClassMethods $object _all_categories]] {
        if {!$nometa} {
            append script [my getObjectMethodCommentBody $object Class $method]
        }
        append script [my getBodyClassMethod $object $method]
    }
    return $script
}
