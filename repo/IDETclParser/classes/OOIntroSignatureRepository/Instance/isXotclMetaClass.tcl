OOIntroSignatureRepository instproc isXotclMetaClass {name {namespace {}}} {
     expr {[info object isa object $name] && [info object isa metaclass $name]}
}
