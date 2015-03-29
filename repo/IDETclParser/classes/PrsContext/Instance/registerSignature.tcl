PrsContext instproc registerSignature {} {
    my instvar variablesList parser repository object isTclproc name isInstproc varArr isTclGlobalScript namespace hasNonPosArgs nonPosVariablesList rootCommand

    if {![info exists variablesList]} {
        return
    }
    my resolveVarRefs

    lappend types [list [my getReturnType]]
    if {$hasNonPosArgs} {
        set options [list]
        $nonPosVariablesList extractList
        foreach v [$nonPosVariablesList getAsList] {
            $v extractList
            set list [$v getAsList]
            set parName [[lindex $list 0] prsString]
            if {[regexp -- {(-[^:]+)(.*)} $parName _ var type]} {
                 if {$type eq "boolean"} {
                     set parType boolean
                 } else {
                     set parType unknown
                 }
                 lappend options $parName $parType
            }
        }
        if {[llength $options]>0} {
            lappend types [list ? [concat option $options]]
        }
    }

    set canHaveNonPosArgs [expr {!$isTclproc && !$hasNonPosArgs}]
    set options [list]
    foreach v [$variablesList getAsList] {
        # expanse default values
        $v extractList
        set list [$v getAsList]
        set parName [[lindex $list 0] prsString]
        set mult {}
        if {[llength $list]>1} {
            set mult ?
        }
        if {$parName eq "args"} {
            set mult *
        }
        if {$canHaveNonPosArgs} {
            if {[regexp -- {(-[^:]+)(.*)} $parName _ var type]} {
                 if {$type eq "boolean"} {
                     set parType boolean
                 } else {
                     set parType unknown
                 }
                 lappend options $parName $parType
                 continue
            } else {
                set canHaveNonPosArgs 0
                if {[llength $options]>0} {
                    lappend types [list  ? [concat option $options]]
                }
                set options [list]
            }
        }
        if {$mult ne ""} {
            if {$parName ne "args"} {
                lappend types [list $mult [my getVariableType $parName] $parName]
            } else {
                lappend types [list $mult unknown $parName]
            }
        } else {
            lappend types [list [my getVariableType $parName] $parName]
        }
    }
    if {[llength $options]>0} {
        lappend types [list ? [concat option $options]]
    }


    if {$isTclproc} {
        set class ""
        set mtype proc
    } else {
        set class $object
        if {$isInstproc} {
            set mtype instproc
        } else {
            set mtype proc
        }
    }
    foreach variable [array names varArr] {
        lassign $varArr($variable) type scope
        if {[lindex $scope 0] in {instproc proc global}} {
            $repository registerVariable [lindex $scope 1] [lindex $scope 0] $variable $namespace $type
        }
    }
    if {$isTclproc} {
        tlog::info "register signature proc $name $types"
        set fullName [$repository registerProc $name [list $types] $namespace]
        $rootCommand set def [list proc $fullName]
    } else {
        set fullName [$repository registerMethod $class $mtype $name [list $types] $namespace]
        $rootCommand set def [list method $fullName]
    }

}
