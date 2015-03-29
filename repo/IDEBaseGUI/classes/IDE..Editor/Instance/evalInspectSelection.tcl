IDE::Editor instproc evalInspectSelection {} {
    set error 1
    set ret [my evalErrorString error]
    if {!$error} {
        IDE::System inspectString $ret
    }
}
