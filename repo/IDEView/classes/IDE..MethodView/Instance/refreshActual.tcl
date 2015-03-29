IDE::MethodView instproc refreshActual {} {
    my instvar history historyIndex
    my selectHItem [lindex $history $historyIndex]
}
