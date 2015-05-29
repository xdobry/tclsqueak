IDE::MethodView instproc refreshActual {} {
    my instvar history historyIndex actItem
    set codeController [my getCodeControllerIfExists]
    if {$codeController ne ""} {
        $codeController setBodyText {*}$actItem
        return
    }
    my selectHItem [lindex $history $historyIndex]
}
