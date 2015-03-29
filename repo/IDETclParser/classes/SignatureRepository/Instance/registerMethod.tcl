SignatureRepository instproc registerMethod {class type name desc {namespace {}}} {
    my instvar commandsArr methodsArr
    tlog::ltrace {registering method $class $type $name <= $desc}

    if {$class eq ""} {
        error "no class"
    }

    if {$type eq "proc" && $class eq ""} {
        set commandsArr($name) $desc
    } else {
        set fullName [list [my getFullObjectNameBase $class $namespace] $type $name]
        if {[catch {set methodsArr($fullName)} idesc]} {
            set methodsArr($fullName) $desc
        } else {
            # update definition
            if {[llength $desc]==1 && [llength $idesc]==1} {
                set mergedDesc [my mergeDescTypes [lindex $idesc 0] [lindex $desc 0]]
                if {[llength $mergedDesc]>0} {
                    tlog::ldebug {update by register method $fullName new='$desc' old='$idesc' m='$mergedDesc'}
                    set methodsArr($fullName) [list $mergedDesc]
                }
            }
        }
        return $fullName
    }
    return
}
