ChainSignatureRepository instproc objectHasClass {object namespace class} {
    expr {$class in [my getClassesForObject $object $namespace]}
}
