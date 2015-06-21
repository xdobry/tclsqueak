IDE::MethodView instproc refreshActual {} {
    my instvar history historyIndex actItem vclass vtype
    set codeController [my getCodeControllerIfExists]
    if {$codeController ne ""} {
        if {[llength $actItem]==0} {
            set introProxy [my getIntroProxy]
            set method [my selectedItem]
            set actItem [list $vclass [$introProxy getSpecialMethodType $vtype] $method]
        }
        $codeController setBodyText {*}$actItem
        return
    } else {
        my selectHItem [lindex $history $historyIndex]
    }
}
