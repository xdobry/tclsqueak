OOIntroSignatureRepository instproc isXotclClass {name {namespace {}}} {
    expr {[info object isa object $name] && [info object isa class $name]}
}
