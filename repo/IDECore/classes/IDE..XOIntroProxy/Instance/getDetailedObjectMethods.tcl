IDE::XOIntroProxy instproc getDetailedObjectMethods {object visibility hideMixinMethod hideProcsMethod hideNoCmds} {
    set options {}
    foreach {var option} {hideMixinMethod -nomixins hideProcsMethod -noprocs hideNoCmds -nocmds} {
        if {[set $var]} {
            append options " $option"
        }
    }
    set methods [lsort -unique [$object info methods {*}$options]]
    set class [$object info class]
    set smethods {}
    foreach m $methods {
        set dobj [lindex [$object procsearch $m] 0]
        # !!! if parameter has default the method below do not work
        # also yet no filtering. Maybe the user what to set parameter in this way
        # if {[ide::lcontain [$class info parameter] $m]} continue
        if {[$object info children $m] ne ""} continue
        if {$dobj eq ""} {
            lappend smethods [list $m [my searchMixinClass $vobject $m]]
        } else {
            if {$visibility eq "Class"} {
                if {$dobj eq $class} {
                    lappend smethods $m
                }
            } elseif {$visibility eq "MinusRoot"} {
                if {$dobj ne "::xotcl::Object"} {
                    lappend smethods [list $m [string trimleft $dobj :]]
                }
            } else {
                lappend smethods [list $m [string trimleft $dobj :]]
            }
        }
    }
    return $smethods
}
