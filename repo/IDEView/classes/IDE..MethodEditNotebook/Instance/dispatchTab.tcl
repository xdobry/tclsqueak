IDE::MethodEditNotebook instproc dispatchTab args {
    set currentEdit [my getCurrentMethodEdit]
    if {$currentEdit ne ""} {
        $currentEdit {*}$args
    }
}
