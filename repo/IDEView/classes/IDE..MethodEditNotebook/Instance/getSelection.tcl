IDE::MethodEditNotebook instproc getSelection {} {
    set currentEdit [my getCurrentMethodEdit]
    if {$currentEdit ne ""} {
        $currentEdit getSelection
    } else {
        return
    }
}
