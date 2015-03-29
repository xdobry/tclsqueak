IDE::ProcsGroupPer instproc loadNameVersionId {name methodId compObj} {
    if {![my questForChange]} return
    set dmobj [my getProcObjForNameIfExist $name]
    if {$dmobj ne ""} {
        $dmobj makeTransistent
        # !! Ask number of effected rows
        $dmobj rereadForAnotherVersion $methodId
        $dmobj updateRelationship
    } else {
        set dmobj [my loadMethod $methodId]
        if {$dmobj ne ""} {
            $dmobj updateRelationship
        }
    }
}
