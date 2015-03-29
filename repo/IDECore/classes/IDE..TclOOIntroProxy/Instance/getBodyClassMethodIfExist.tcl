IDE::TclOOIntroProxy instproc getBodyClassMethodIfExist {obj p} {
    if {![info object isa object $obj] || $p ni [info object methods $obj -all]} return
    my getBodyClassMethod $obj $p
}
