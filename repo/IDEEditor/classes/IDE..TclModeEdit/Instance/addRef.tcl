IDE::TclModeEdit instproc addRef {begin end ref} {
    my instvar refArr maxRefNum refNum
    if {![info exists maxRefNum]} {
        set maxRefNum 0
        set refNum 0
    }
    set twin [my getTextWindow]
    set tag d$refNum
    set reftype [my getRefType $ref]
    if {$reftype eq "cmd"} {
        lset ref 0 cmd
    }
    if {$refNum == $maxRefNum} {
        my configureTagForRefType $twin $tag $reftype
        $twin tag raise $tag
        $twin tag bind $tag <Enter> "[self] enterRef $tag; break"
        $twin tag bind $tag <Leave> "[self] leaveRef $tag; break"
        $twin tag bind $tag <Control-ButtonPress-1> "[self] showRefButton \[$twin tag names current\]; break"
        incr maxRefNum
    } else {
        my configureTagForRefType $twin $tag $reftype
    }
    incr refNum
    set startIndex [$twin index "1.0 + $begin char"]
    incr end
    set endIndex [$twin index "1.0 + $end char"]
    $twin tag add $tag $startIndex $endIndex
    set refArr($tag) $ref
}
