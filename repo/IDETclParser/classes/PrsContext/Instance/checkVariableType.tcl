PrsContext instproc checkVariableType {variable rtype {override 0}} {
    my instvar varArr repository namespace isTclGlobalScript repository
    # do not set ref type to variable
    # for example. It is already marked as error in another place
    # set $v 1
    if {[ttype::isRefType $rtype] && !$override} {
        return 1
    }
    if {[catch {set varArr($variable)} desc]} {
        # if not found is ok because it will be checked by check variable
        return 1
    } else {
        if {[lindex $rtype 0] in {unknown def}} {
            return 1
        }
        lassign $desc type scope
        set type0 [lindex $type 0]
        if {$type0 in {unknown def} || $override} {
            lset desc 0 $rtype
            set varArr($variable) $desc
            if {$isTclGlobalScript && [lindex $scope 0] in {instproc proc global}} {
                 $repository registerVariable [lindex $scope 1] [lindex $scope 0] $variable $namespace $rtype 1
            }
            tlog::ltrace {updating variable type $variable type=$rtype from unknown}
            return 1
        }
        # if list or array has mixed types then set the subtype to "unknown"

        if {[my updateComplexType $variable $type $rtype $scope]} {
            return 1
        }
        set ret [my canAssignType $rtype $type]
        set needUpdate 0
        set rtype0 [lindex $rtype 0]
        if {!$ret && $type0 eq "string"} {
            set needUpdate 1
        } elseif {$ret && $type0 eq "string" && $rtype0 eq [lindex $type 1]} {
            set needUpdate 1
        } elseif {$ret && $type0 in {index pixel} && $rtype0 in {numeric int}} {
            set needUpdate 1
        } elseif {$ret && $type0 eq "string" && $rtype0 in {list tk xotcl class} && [lindex $type 1] eq "empty"} {
            set needUpdate 1
        }
        if {$needUpdate} {
            tlog::info "updating variable type $variable type=$rtype from $type override=$override"
            set varArr($variable) [list $rtype $scope]
        }
        return $ret
    }
}
