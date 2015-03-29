IDE::MethodView instproc checkItem hitem {
    foreach {vclass vtype method} $hitem {}
    if {![Object isobject $vclass]} {return 1}
    switch $vtype {
        Class {
            if {[$vclass info procs $method] eq ""} {return 0}
        }
        Instance  {
            if {[$vclass info instprocs $method] eq ""} {return 0}
        }
        Procs {
            if {[info procs ::$method] eq ""} {return 0}
        }
    }
    return 1
}
