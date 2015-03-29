SignatureRepository instproc canAssignType {requiredType isType} {
    my instvar repository

    set isType0 [lindex $isType 0]
    set requiredType0 [lindex $requiredType 0]
    if {$isType0 in {unknown def}} {
        return 1
    }
    if {[lindex $requiredType 0] eq "new"} {
        set requiredType [lrange $requiredType 1 end]
    }
    if {$requiredType0 eq "unknown" && $isType0 ne "array"} {
        return 1
    }
    if {$requiredType eq $isType} {
        return 1
    }
    if {$requiredType eq "index" && $isType0 in {int numeric}} {
        return 1
    }
    if {$requiredType in {body script} && $isType0 in {string list}} {
        return 1
    }
    if {$requiredType eq "int" && $isType0 in {numeric index boolean}} {
        return 1
    }
    if {$requiredType eq "numeric" && $isType0 in {int double index pixel}} {
        return 1
    }
    if {$requiredType eq "pixel" && $isType0 in {numeric int index}} {
        return 1
    }
    if {$requiredType eq "double" && $isType0 in {int numberic}} {
        return 1
    }
    if {$requiredType eq "boolean" && $isType0 in {int numberic}} {
        return 1
    }
    if {$requiredType eq "texpr" && $isType0 in {int numeric boolean}} {
        return 1
    }
    # everything can be string beside of array
    if {$requiredType0 eq "string" && $isType0 ne "array"} {
        return 1
    }
    if {$requiredType eq "elem" && $isType0 ne "array"} {
        return 1
    }
    if {$requiredType0 eq "class" && $isType0 in {tk xotcl}} {
        return 1
    }
    # tk {string tk}
    if {$isType0 eq "string" && $requiredType0 eq [lindex $isType 1]} {
        return 1
    }
    # list {string empty}
    if {$isType0 eq "string" && $requiredType0 in {list tk xotcl class} && [lindex $isType 1] eq "empty"} {
        return 1
    }
    if {[lindex $requiredType 0] eq "xotcl" && $isType eq "string"} {
        # TODO Check if the string value can be XOTcl Class , Is probably Class String reference
        return 1
    }
    if {[lindex $requiredType 0] in {xotcl class tk} && $isType0 in {xotcl class tk}} {
        if {[llength $isType]==1} {
            return 1
        }
        if {[lindex $requiredType 1] in [my getFullHeritage [lindex $isType 1]]} {
            return 1
        }
    }
    if {[lindex $requiredType 0] eq "enum" && $isType0 eq "string"} {
        return 1
    }
    if {$requiredType eq "color" && $isType0 eq "string"} {
        return 1
    }
    # {list string} list
    # {tk ...} tk
    # {array ...} array
    if {$requiredType0 in {list array tk xotcl class} && $isType0 eq $requiredType0 && [llength $isType]==1} {
        return 1
    }
    # string {string empty}
    if {[llength $requiredType]==1 && [llength $isType]>1 && [lindex $requiredType 0] eq $isType0} {
        return 1
    }
    # "array unknown" is "array int"
    if {[lindex $requiredType 0] in {array list} && [lindex $requiredType 0] eq [lindex $isType 0] && [lindex $isType 1] eq "unknown"} {
        return 1
    }
    return 0
}
