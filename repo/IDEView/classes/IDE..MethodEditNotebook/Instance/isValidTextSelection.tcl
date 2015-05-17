IDE::MethodEditNotebook instproc isValidTextSelection {} {
    set currentEdit [my getCurrentMethodEdit]
    if {$currentEdit ne ""} {
        $currentEdit isValidTextSelection
    } else {
        return 0
    }
}
