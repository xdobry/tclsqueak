IDE::ClassDefinition instproc getParameter {} {
    my instvar win
    set parameter [$win.fpar.parameter get 1.0 end]
    return [string range $parameter 0 [expr {[string length $parameter] - 2}]]
}
