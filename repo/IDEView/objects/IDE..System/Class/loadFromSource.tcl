IDE::System proc loadFromSource {} {
    set source [IDE::Dialog getOpenFile {{{Tcl Files} *.tcl} {{XOTcl Files} *.xotcl} {{All files} *}}]
    if {$source ne ""} {
        IDE::Component loadCompFromFile $source
    }
}
