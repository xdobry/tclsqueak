IDE::ChangesBrowser instproc selectMethod method {
    my instvar comp1 comp2 compArr1 compArr2 vtype methArr1 methArr2 vclass compare obj1 obj2 mode
    set lleft {}; set lright {}
    set s 0
    if {$mode eq "components" && ![info exists compArr1($vclass)]} {
        my setTextLeft "no class $vclass"
    } else {
        if {![info exists methArr1($method)]} {
            my setTextLeft "no $vtype method $method"
        } else {
            incr s
            if {$mode eq "components"} {
                set obj [$comp1 getObject $vclass]
            } else {
                set obj $obj1
            }
            my setTextLeft [$obj get${vtype}MethodBody $method]
            set lleft "$method $methArr1($method)"
        }   
    }
    if {$mode eq "components" && ![info exists compArr2($vclass)]} {
        my setTextRight "no class $vclass"
    } else {
        if {![info exists methArr2($method)]} {
            my setTextRight "no $vtype method $method"
        } else {
            incr s
            if {$mode eq "components"} {
                set obj [$comp2 getObject $vclass]
            } else {
                set obj $obj2
            }
            my setTextRight [$obj get${vtype}MethodBody $method]
            set lright "$method $methArr2($method)"
        }
    }
    my setMethodLabels $lleft $lright
    if {$s==2} {
        [self]::comparer scane
        set compare 1
        my nextDifference
    } else {
        set compare 0
    }
}
