PrsOOBaseContext instproc registerMethod {methodName body {mtype instproc}} {
    my instvar variablesList repository name namespace

    my resolveVarRefs

    set types [list unknown]
    foreach v [$variablesList getAsList] {
        # expanse default values
        $v extractList
        set list [$v getAsList]
        if {[llength $list]>0} {
            set parName [[lindex $list 0] prsString]
        } else {
            set parName [$v prsString]
        }
        set mult {}
        if {[llength $list]>1} {
            set mult ?
        }
        if {$parName eq "args"} {
            set mult *
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
    if {$body ne "" && [$body exists lastCommand]} {
        lset types 0 [list [[$body set lastCommand] getType]]
    }
    set desc [list $types]
    $repository registerMethod $name $mtype $methodName $desc $namespace
    return $desc

}
