IDE::XOIntroProxy instproc deleteMethodForObject {object method type {forwardToDesc 1}} {
    if {$type eq "Class"} {
        $object proc $method {} {}
        my uncategoryForBForObject $object $method
    } elseif {$type eq "Instance"} {
        $object instproc $method {} {}
        my uncategoryForBForObject $object $method {}
    } else {
        error "unknown type $type for method deletion"
    }
}
