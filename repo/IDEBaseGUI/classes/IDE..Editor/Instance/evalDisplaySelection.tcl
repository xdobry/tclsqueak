IDE::Editor instproc evalDisplaySelection {} {
    set error 1
    set ret [my evalErrorString error]
    if {!$error} {
        my appendToCursorAndSelect $ret
    }
}
