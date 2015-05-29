IDE::MethodEditNotebook instproc focus {} {
    set currentEdit [my getCurrentMethodEdit]
    if {$currentEdit ne ""} {
        $currentEdit focus
    } else {
        return
    }
}
