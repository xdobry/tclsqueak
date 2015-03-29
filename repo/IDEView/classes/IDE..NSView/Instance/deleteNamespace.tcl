IDE::NSView instproc deleteNamespace ns {
    if {$ns eq "::"} {
        IDE::Dialog message "you can not delete root namespace"
        return
    }
    if {[IDE::Dialog yesNo  "delete namespace $ns"]} {
        set iproxy [my getIntroProxy]
        my deleteItem $ns
        $iproxy inspectEval [list namespace delete $ns]
        my selectItem ""
    }
}
