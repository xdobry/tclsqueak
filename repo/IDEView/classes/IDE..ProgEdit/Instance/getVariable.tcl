IDE::ProgEdit instproc getVariable pattern {
    # class shoul be the first word in the window
    set twin [my getTextWindow]
    set bpattern $pattern
    append pattern *
    set fline [$twin get 1.0 {1.0 lineend}]
    set text [$twin get 1.0 end]
    set start 0
    set varlist {}
    if {[regexp {proc [\w:]+ ([\w]+)} $fline _ vlist]} {
        set varlist [concat $vlist]
    } elseif {[regexp {proc [\w:]+ \{([\w ]+)\}} $fline _ vlist]} {
        set varlist [concat $vlist]
    }
    while {[regexp -line -indices -start $start {instvar ([\w ]+)$} $text mall vlist]} {
        set start [lindex $mall 1]
        set varlist [concat $varlist [string range $text [lindex $vlist 0] [lindex $vlist 1]]]
   }
    set start 0
    while {[regexp -line -indices -start $start {global ([\w ]+)$} $text mall vlist]} {
        set start [lindex $mall 1]
        set varlist [concat $varlist [string range $text [lindex $vlist 0] [lindex $vlist 1]]]
    }
    set rcommands {
        {set ([\w]+) .*$}
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
            set varlist [concat $varlist [string range $text [lindex $vlist 0] [lindex $vlist 1]]]
        }
    }
    set varlist [ide::lselect each $varlist {[string match $pattern $each] && $each!=$bpattern}]
    set varlist [lsort -unique $varlist]
    my invokePopDown $varlist $pattern
}
