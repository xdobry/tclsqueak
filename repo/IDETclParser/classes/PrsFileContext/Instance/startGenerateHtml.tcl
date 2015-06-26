PrsFileContext instproc startGenerateHtml {} {
    if {![Object isclass Tcl2HTML]} {
        if {[Object isobject IDE::SystemConfigMap]} {
            IDE::SystemConfigMap loadComponentFromAny IDETclToHTml
        } else {
            package require IDETclToHtml
        }
    }
    my class Tcl2HTML
    my initMarkup; #ttc noerror
}
