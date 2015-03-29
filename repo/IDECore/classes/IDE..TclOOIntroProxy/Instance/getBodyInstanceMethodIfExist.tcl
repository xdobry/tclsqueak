IDE::TclOOIntroProxy instproc getBodyInstanceMethodIfExist {obj p} {
    if {$p ni {_constructor _destructor}} {
        if {![info object isa class $obj] || $p ni [info class methods $obj -all]} return
    } else {
        if {$p eq "_constructor" && [info class constructor $obj] eq ""} {
            return
        } elseif {$p eq "_destructor" && [info class destructor $obj] eq ""} {
            return
        }
    }
    my getBodyInstanceMethod $obj $p
}
