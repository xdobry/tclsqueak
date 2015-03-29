IDE::TclModeEdit instproc addVariable {begin end name} {
    my instvar varTagArr varNameTagArr varArr maxVarNum varNum
    if {![info exists varArr($name)]} {
        return
    }
    if {![info exists maxVarNum]} {
        set maxVarNum 0
        set varNum 0
    }
    set twin [my getTextWindow]
    if {[info exists varNameTagArr($name)]} {
        set tag $varNameTagArr($name)
    } else {
        set tag v$varNum
        if {$varNum == $maxVarNum} {
            my configureTagForRefType $twin $tag var
            $twin tag raise $tag
            $twin tag bind $tag <Enter> "[self] enterVar $tag; break"
            $twin tag bind $tag <Leave> "[self] leaveVar $tag; break"
            incr maxVarNum
        } else {
            my configureTagForRefType $twin $tag var
        }
        set varNameTagArr($name) $tag
    }
    incr varNum
    set startIndex [$twin index "1.0 + $begin char"]
    incr end
    set endIndex [$twin index "1.0 + $end char"]
    $twin tag add $tag $startIndex $endIndex
    set varTagArr($tag) $name
}
