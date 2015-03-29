SignatureRepository instproc isXotclMetaClass {name {namespace {}}} {
    expr {$name in {::Class Class ::xotcl::Class} || "::xotcl::Class" in [my getFullHeritage $name $namespace]}
}
