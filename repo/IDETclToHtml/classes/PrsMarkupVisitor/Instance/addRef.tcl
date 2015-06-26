PrsMarkupVisitor instproc addRef elem {
    my instvar currentRefs
    set ref [$elem set ref]
    set refDesc [list $ref [$elem set begin] [$elem set end]]
    if {[$elem exists desc]} {
        lappend refDesc [$elem set desc]
    }
    lappend currentRefs $refDesc
    my addGlobalRefs $elem $ref
}
