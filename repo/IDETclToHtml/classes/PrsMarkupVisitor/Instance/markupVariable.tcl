PrsMarkupVisitor instproc markupVariable {elem type} {
    my instvar markups varLocalDefinitions varDefinitions varIndex
    set elemContext [my getElemContext $elem]
    set varName [$elem getVariableName]
    lassign [$elemContext getVariableDesc $varName] varType varScope
    if {[lindex $varScope 0] ne "local"} {
        set fullVarName [concat $varName $varScope]
        append type " [lindex $varScope 0]"
        set index [lsearch -index 0 $varDefinitions $fullVarName]
        if {$index<0} {
            set myIndex $varIndex
            incr varIndex
            lappend varDefinitions [list $fullVarName $myIndex]
        } else {
            set myIndex [lindex $varDefinitions $index 1]
        }
    } else {
        set index [lsearch -index 0 $varLocalDefinitions $varName]
        if {$index<0} {
            set myIndex $varIndex
            incr varIndex
            lappend varLocalDefinitions [list $varName $myIndex]
        } else {
            set myIndex [lindex $varLocalDefinitions $index 1]
        }
    }
    if {[lindex $varType 0] ni {unknown def {}}} {
       lappend markups [list [$elem set begin] [$elem set end] $type $varType $myIndex]
    } else {
       lappend markups [list [$elem set begin] [$elem set end] $type {} $myIndex]
    }
}
