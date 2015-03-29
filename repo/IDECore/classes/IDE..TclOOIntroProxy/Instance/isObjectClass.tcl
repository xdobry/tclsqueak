IDE::TclOOIntroProxy instproc isObjectClass object {
    expr {[info object isa object $object] && [info object isa class $object]}
}
