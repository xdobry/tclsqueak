IDE::CodeCompletion instproc getVariable {pattern body contentDesc} {
    # class shoul be the first word in the window
    set bpattern $pattern
    append pattern *
    set text $body
    set varlist [list]
    set fline ""
    if {[string range $bpattern 0 1] eq "::"} {
        set elems [list]
        foreach e [info vars $pattern] {
            if {[string range $e 0 1] ne "::"} {
                set e ::$e
            }
            lappend elems $e
        }
        return [list $elems $pattern]
    }
    regexp {^([^\n]+)\n} $body _ fline
    # first line is the method signature with opened \{ bracket
    # assume thet end-1 element is the argument list
    if {![info complete $fline]} {
        append fline \}
    }
    if {[info complete $fline]} {
        foreach a [lindex $fline end-1] {
            # ignore default value
            lappend varlist [lindex $a 0]
        }
    } else {
        if {[regexp {proc [\w:]+ ([\w]+)} $fline _ vlist]} {
            set varlist [concat $vlist]
        } elseif {[regexp {proc [\w:]+ \{([\w ]+)\}} $fline _ vlist]} {
            set varlist [concat $vlist]
        }
    }
    set multvars {
        {instvar ([\w ]+)$}
        {global ([\w ]+)$}
    }
    foreach mvars $multvars {
        set start 0
        while {[regexp -line -indices -start $start $mvars $text mall vlist]} {
            set start [lindex $mall 1]
            lappend varlist {*}[string range $text [lindex $vlist 0] [lindex $vlist 1]]
       }
    }
    set rcommands {
        {set ([\w]+) .*$}
        {incr ([\w]+) .*$}
        {array set ([\w]+) .*$}
        {lset ([\w]+) .*$}
        {foreach ([\w]+) .*$}
        {append ([\w]+) .*$}
        {lappend ([\w]+) .*$}
        {upvar ([\w]+) .*$}
        {variable ([\w]+)}
        {\$([\w]+)}
    }
    foreach r $rcommands {
        set start 0
        while {[regexp -line -indices -start $start $r $text mall vlist]} {
            set start [lindex $mall 1]
            lappend varlist [string range $text [lindex $vlist 0] [lindex $vlist 1]]
        }
    }
    lassign $contentDesc class type method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
    set atype [IDE::XOIntroProxy getAbstractMethodType $type]
    if {[$introProxy getOOSystemName] eq "TclOO" && $atype eq "Instance"} {
        lappend varlist {*}[$introProxy getParameterForClass $class]
    }
    set varlist [ide::lselect each $varlist {[string match $pattern $each] && $each ne $bpattern}]
    set varlist [lsort -unique $varlist]
    list $varlist $pattern
}
