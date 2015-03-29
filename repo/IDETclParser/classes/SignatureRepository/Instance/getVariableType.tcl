SignatureRepository instproc getVariableType {class stype name {namespace {}}} {
    my instvar variableArr
    # XOTcl Object or Class or empty if tcl var
    # stype - instproc or proc (Class or Instance)
    # name - name of variable
    # type - tcl type
    if {$stype eq "global"} {
        set name [my getFullName $namespace $name]
    } else {
        set class [my getFullObjectName $class $namespace]
    }
    set fname [list $class $stype $name]
    if {![catch {set variableArr($fname)} type]} {
        return $type
    }
    if {$stype in {instproc subobject} && [my isXotclClass $class]} {
        foreach c [my getFullHeritage $class] {
            set fname [list $c $stype $name]
            if {![catch {set variableArr($fname)} type]} {
                return $type
            }
        }
    }
    return
}
