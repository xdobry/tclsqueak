IDE::CompView instproc importFromSource {} {
    set source [IDE::Dialog getOpenFile {{{Tcl Files} *.tcl} {{XOTcl Files} *.xotcl} {{All files} *}}]
    if {$source ne ""} {
        IDE::Component importCompsFromFile $source
        IDE::System signalComponentsChanged
    }
}
