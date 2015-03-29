IDE::DestroyMixForward proc registerDestroyForwardObj {obj observer} {
    if {![$obj hasclass IDE::DestroyMixForward]} {
        $obj mixin add IDE::DestroyMixForward
    }
    $obj setDestroyForwardObj $observer
}
