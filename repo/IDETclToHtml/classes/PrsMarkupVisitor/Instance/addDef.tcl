PrsMarkupVisitor instproc addDef elem {
    my instvar definitions fileName definitionsKey currentDefs varLocalDefinitions
    set def [$elem set def]
    set varLocalDefinitions [list]
    lappend currentDefs $def
    if {$def ni $definitionsKey} {
        lappend definitions [list $def [$elem set begin] $fileName]
        lappend definitionsKey $def
    }
}
