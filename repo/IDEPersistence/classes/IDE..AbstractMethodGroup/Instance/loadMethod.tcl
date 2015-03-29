IDE::AbstractMethodGroup instproc loadMethod methodId {
    set ret [my createFromDB $methodId]
    if {$ret eq ""} {
        IDE::Dialog message "Method could not be loaded ID=$methodId"
    }
    return $ret
}
