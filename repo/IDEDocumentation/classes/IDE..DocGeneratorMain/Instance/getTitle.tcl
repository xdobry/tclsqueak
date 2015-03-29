IDE::DocGeneratorMain instproc getTitle {} {
    my instvar docname
    if {![info exists docname]} {
        return {XotclIDE produced documenation}
    } else {
        return $docname
    }
}
