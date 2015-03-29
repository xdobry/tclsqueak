SignatureRepository instproc initNewCreateMethodsForClass class {
    my instvar methodsArr xotclObjectsArr linkTypes
    set initDesc [my getMethodDescriptionForClasses [list $class] init]

    set call [list]
    # return value
    lappend call [list [list xotcl $class] "create instance of $class"]
    # options from parameters
    set options [list option]
    lappend options -volatile {}
    lappend options -childof xotcl
    foreach c [my getFullHeritage $class] {
        foreach p [my getClassParameters $c] {
            set type [my getVariableType $class instproc $p]
            set type0 [lindex $type 0]
            if {$type0 eq "" || $type0 eq "def"} {
                set type [list unknown]
            }
            lappend options -$p $type
        }
    }
    lappend call [list ? $options]

    set fullNameInit [lindex $initDesc 0]
    set fullNameNew [list $class proc new]
    set fullNameCreate [list $class proc create]

    # arguments from init methods
    if {$initDesc ne ""} {
        set i 1
        foreach p [lrange [lindex $initDesc 1] 1 end] {
            lappend call $p
            lappend linkTypes [list [list $fullNameInit $i] [list $fullNameNew [expr {$i+1}]]]
            lappend linkTypes [list [list $fullNameInit $i] [list $fullNameCreate [expr {$i+2}]]]
        }
    }
    set newDesc [list $call]
    set createDesc [list [linsert $call 1 [list string "instance name"]]]

    set methodsArr($fullNameNew) $newDesc
    set methodsArr($fullNameCreate) $createDesc

    # create methods from parameter
    foreach p [my getClassParameters $class] {
        set type [my getVariableType $class instproc $p]
        set type0 [lindex $type 0]
        if {$type0 eq "" || $type0 eq "def"} {
           set type [list unknown]
        }
        set methodsArr([list $class instproc $p]) [list [list [list $type] [list ? $type $p]]]
    }
}
