IDE::TclOOIntroProxy instproc deleteMethodForObject {object method type {forwardToDesc 1}} {
    set desc [my getDescriptionForObject $object]
    if {$type eq "Class"} {
        oo::objdefine $object deletemethod $method
        my uncategoryForBForObject $object $method
        if {$desc ne "" && $forwardToDesc} {
            $desc deleteClassMethod $method
        }
    } elseif {$type eq "Instance"} {
        oo::define $object deletemethod $method
        my uncategoryForBForObject $object $method {}
        if {$desc ne "" && $forwardToDesc} {
            $desc deleteInstanceMethod $method
        }
    } else {
        error "unknown type $type for method deletion"
    }
}
