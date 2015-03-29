IDE::ProcsGroupPer proc makePersistentAble obj {
    if {$::xotcl::version>=1.3} {
        $obj mixin add [self]
    } else {
        $obj mixinappend [self]
    }
}
