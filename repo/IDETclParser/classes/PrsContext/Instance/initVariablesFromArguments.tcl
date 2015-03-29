PrsContext instproc initVariablesFromArguments {} {
    my instvar object isTclproc isInstproc name hasNonPosArgs repository namespace rootCommand parser variablesList nonPosVariablesList
    if {$isTclproc} {
        set shift 2
    } else {
        set shift 3
    }
    set count [$rootCommand getListLength]

    # get parameter types from repository
    # TODO signature change update is different than secound static scan
    if {$isTclproc} {
        set desc [$repository getCommandDescription $name $namespace]
    } else {
        if {$isInstproc} {
            set desc [$repository getMethodDescriptionForClasses $object $name]
        } else {
            set desc [$repository getMethodDescriptionForObject $object $name]
        }
    }
    if {[llength $desc]!=2} {
        set desc [list]
    } else {
        set desc [lindex $desc 1]
    }
    set i 1

    set fullName [my getFullName]
    set argListElem [$rootCommand getElem $shift]
    $argListElem extractList

    # check for non positional arguments
    if {!$isTclproc} {
        if {$count>5} {
            set hasNonPosArgs 1
            set varsToAdd [list]
            foreach v [$argListElem getAsList] {
                $v extractList
                set argValueElem [lindex [$v getAsList] 0]
                if {$argValueElem ne ""} {
                    set va [$argValueElem prsString]
                    if {[regexp -- {-([^:]+).*} $va _ var]} {
                        set type [lindex $desc $i 0]
                        if {$type in {? * +}} {
                            set type [lindex $desc $i 1]
                        }
                        if {$type eq ""} {
                            set type [list unknown [list $fullName $i]]
                        }
                        lappend varsToAdd $var $v $type
                        incr i
                    } else {
                        set hasNonPosArgs 0
                        break
                    }
                }
            }
            if {$hasNonPosArgs} {
                set nonPosVariablesList $argListElem
                incr shift
                set argListElem [$rootCommand getElem $shift]
                $argListElem extractList
                foreach {var v type} $varsToAdd {
                     my addVariable $var $v {} $type
                }
            }
        }
    }

    set variablesList $argListElem

    # collect variables and ignore defaults
    foreach v [$argListElem getAsList] {
        $v extractList
        set argValueElem [lindex [$v getAsList] 0]
        if {$argValueElem ne ""} {
            set va [$argValueElem prsString]
            set type [lindex $desc $i 0]
            if {$type in {? * +}} {
                set type [lindex $desc $i 1]
            }
            if {$type eq ""} {
                set type [list unknown [list $fullName $i]]
                #set type [list unknown]
            }
            if {!$isTclproc && !$hasNonPosArgs}  {
                if {[regexp -- {-([^:]+).*} $va _ var]} {
                    my addVariable $var $v {} $type
                } else {
                    my addVariable $va $v {} $type
                }
            } else {
                my addVariableFrom $argValueElem {} $type
            }
            incr i
        }
    }

}
