SignatureRepository instproc registerVariable {class stype name namespace type {override 0}} {
    my instvar variableArr
    # XOTcl Object or Class or empty if tcl var
    # stype - instproc or proc (Class or Instance)
    # name - name of variable
    # type - tcl type

    if {!$override} {
        set desc [my getVariableType $class $stype $name $namespace]
        set desc0 [lindex $desc 0]
        if {$desc ne "" && $desc0 ni {def unknown}} {
            if {[lindex $type 0] in {array list} && [lindex $type 1 0] eq "unknown" && $desc0 eq [lindex $type 0]} {
                # "array unknown" can overwrite the defintion if it is already array
                # so "array int" can be alway switch to "array unknow"
            } else {
                return
            }
        }
    }

    if {$stype in {proc instproc}} {
        set class [my getFullObjectName $class $namespace]
    }
    if {$stype eq "global"} {
        set name [my getFullName $namespace $name]
    }
    set fname [list $class $stype $name]

    if {[set type0 [lindex $type 0]] in {class xotcl}} {
        set istype [my getVariableType $class $stype $name $namespace]
        set istype0 [lindex $istype 0]
        if {$istype ne "" && $type0 eq $istype0} {
            set type [lindex [my mergeOOTypes [list $istype istype] $type] 0]
        }
    }

    tlog::ltrace {register variable $fname -> $type}
    if {$stype eq "instproc" && [my isXotclClass $class]} {
        foreach c [my getFullHeritage $class] {
            set sfname [list $c $stype $name]
            if {![catch {set variableArr($sfname)} desc]} {
                set fname $sfname
                break
            }
        }
    }
    set variableArr($fname) $type
    tlog::info "registeredVariable $name t=$type o=$override"
    return
}
