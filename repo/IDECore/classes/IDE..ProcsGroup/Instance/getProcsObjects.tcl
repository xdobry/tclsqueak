IDE::ProcsGroup instproc getProcsObjects {} {
    ide::lselect each [my info children] {[$each istype IDE::TclProcsDescription]}
}
