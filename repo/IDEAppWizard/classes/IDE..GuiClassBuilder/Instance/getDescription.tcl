IDE::GuiClassBuilder instproc getDescription {} {
    set p {
        options {
            ooSystemType {{Object Oriented Extension} XOTcl XOTcl TclOO TclOO} options
            Component {Component name} string
            Class {Class name} string
            namespace {namespace (optional)} string
            createMain {create start up main method} bool
            windowTitle {window title} string
        }
    }
    return $p
}
