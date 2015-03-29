IDE::TclOOIntroProxy instproc handleScript script {
    if {[lindex $script 0] in {oo::define oo::objdefine}} {
        lassign $script defmethod obj type method
        set desc [my getDescriptionForObject $obj]
        if {$desc ne ""} {
            if {![$desc questForChange]} {
                return
            }
        }
    }
    set ret [next]
    if {[lindex $script 0] in {oo::define oo::objdefine}} {
        lassign $script defmethod obj type method
        set desc [my getDescriptionForObject $obj]
        if {$desc ne ""} {
            if {$type eq "method"} {
                if {$defmethod eq "oo::define"} {
                    $desc registerInstanceMethod $method
                } else {
                    $desc registerClassMethod $method
                }
            } elseif {$type eq "constructor"} {
                $desc registerInstanceMethod _constructor
            } elseif {$type eq "destructor"} {
                $desc registerInstanceMethod _destructor
            }
        }
    }
    return $ret
}
