OOIntroSignatureRepository instproc objectHasClass {object namespace class} {
    set fn [my getFullObjectName $object $namespace]
    expr {[info object isa object $fn] && ([info object isa typeof $fn $class])}
}
