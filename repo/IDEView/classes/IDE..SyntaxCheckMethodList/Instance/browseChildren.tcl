IDE::SyntaxCheckMethodList instproc browseChildren actual {
    lassign [IDE::XOIntroProxy getDescFromDisplayItem $actual] class type method
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $class]
    if {$introProxy ne "" && [$introProxy isObjectClass $class]} {
        IDE::System showHierarchy $class $introProxy
    } else {
        my upsMessage "$class is not a class"
    }
}
