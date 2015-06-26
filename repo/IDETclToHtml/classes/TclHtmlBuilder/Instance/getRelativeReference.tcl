TclHtmlBuilder instproc getRelativeReference linkName {
    my instvar rootBackReference fileName
    set deep [expr {[llength [file split $fileName]]-1}]
    set fileSplit [file split $fileName]
    set linkSplit [file split $linkName]
    set common 0
    foreach linkDir $linkSplit fileDir $fileSplit {
        if {$linkDir ne $fileDir} {
            break
        }
        incr common
    }

    # linkName = fileName
    if {$deep<$common} {
        return [lindex $linkSplit end]
    }

    if {$common!=$deep} {
        if {$common>0} {
            file join {*}[lrepeat [expr {$deep-$common}] ..] {*}[lrange $linkSplit $common end]
        } else {
            file join {*}[lrepeat $deep ..] $linkName
        }
    } else {
        file join {*}[lrange $linkSplit $common end]
    }
}
