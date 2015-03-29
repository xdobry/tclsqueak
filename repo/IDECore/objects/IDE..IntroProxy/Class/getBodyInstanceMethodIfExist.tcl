IDE::IntroProxy proc getBodyInstanceMethodIfExist {obj p} {
    if {![Object isclass $obj] ||
         [$obj info instprocs $p] eq ""} return
    my getBodyInstanceMethod $obj $p
}
