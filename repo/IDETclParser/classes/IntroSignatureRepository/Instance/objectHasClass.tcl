IntroSignatureRepository instproc objectHasClass {object namespace class} {
    set fn [my getFullObjectName $object $namespace]
    expr {[Object isobject $fn] && [$fn hasclass $class]}
}
