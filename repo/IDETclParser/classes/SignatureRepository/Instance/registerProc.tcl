SignatureRepository instproc registerProc {cmdName desc {namespace {}}} {
    my instvar commandsArr
    set fullName [my getFullName $namespace $cmdName]
    if {[catch {set commandsArr($fullName)} idesc]} {
        set commandsArr($fullName) $desc
    } else {
        # update definition
        if {[llength $desc]==1 && [llength $idesc]==1} {
            set mergedDesc [my mergeDescTypes [lindex $idesc 0] [lindex $desc 0]]
            if {[llength $mergedDesc]>0} {
                tlog::info "update by register commands $fullName new='$desc' old='$idesc' m='$mergedDesc'"
                set commandsArr($fullName) [list $mergedDesc]
            }
        }
    }
    return $fullName
}
