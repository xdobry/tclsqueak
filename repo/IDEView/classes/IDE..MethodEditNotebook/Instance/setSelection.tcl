IDE::MethodEditNotebook instproc setSelection args {
    set currentEdit [my getCurrentMethodEdit]
    if {$currentEdit ne ""} {
        $currentEdit setSelection {*}$args
    } else {
        return
    }
}
