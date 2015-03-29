PrsOOBaseContext instproc parseArguments {argumentsElem methodName} {
    my instvar repository name namespace variablesList isInstproc
    set variablesList $argumentsElem
    $variablesList extractList
    if {$isInstproc} {
        set desc [$repository getMethodDescriptionForClasses $name $methodName]
    } else {
        set desc [$repository getMethodDescriptionForObject $name $methodName]
    }
    if {[llength $desc]!=2} {
        set desc [list]
    } else {
        set desc [lindex $desc 1]
    }
    set i 1
    foreach v [$variablesList getAsList] {
        # expanse default values
        $v extractList
        set list [$v getAsList]
        set parName [[lindex $list 0] prsString]
        set type [lindex $desc $i 0]
        if {$type in {? * +}} {
            set type [lindex $desc $i 1]
        }
        if {$type eq ""} {
            set type [list unknown]
        }
        if {[llength $list]>1} {
            set type [my getTypeFromElem [lindex $list 1]]
        }
        my addVariableFrom [lindex $list 0] {} $type
        incr i
    }
}
