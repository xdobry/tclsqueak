IDE::TkWinList instproc serializeWidget {w root} {
    append state "# serialize $w\n"
    set new \$win[string range $w [string length $root] end]
    if {[catch {$w configure -class} widget]} {set widget "{} {} {} [winfo class $w]"}
    set widget [string tolower [lindex $widget 3]]
    append state "$widget $new [my widgetConfigurationString $w $root]" \n
    if {$widget eq "menu"} {
        append state [my serializeMenu $w $root] \n
    } 
    #append state "bindtags $new [list [bindtags $c]]\n"
    if {[set bindings [bind $w]] != ""} {
        foreach x $bindings {
            append state "bind $new $x [list [bind $w $x]]\n"
        }
    }
    foreach c [winfo children $w] {
        if {[string match *.#* $c]} {continue}
        append state [my serializeWidget $c $root]
    }
    # Search again after pannedwindow
    foreach c [winfo children $w] {
        if {[winfo class $c] ne "Panedwindow"} {continue}
        set newc \$win[string range $c [string length $root] end]
        foreach x [$c panes] {
            set news \$win[string range $x [string length $root] end]
            append state "$newc add $news [my getconfig $c [list paneconfigure $x]]\n"
        } 
    }
    if {$widget eq "panedwindow" && $w==$root} {
        foreach x [$w panes] {
            set news \$win[string range $x [string length $root] end]
            append state "$new add $news [my getconfig $w [list paneconfigure $x]]\n"
        } 
    }
    if {$widget eq "toplevel" && [$w cget -menu] ne ""} {
        regsub -all -- $root [$w cget -menu] \$win menu
        append state "$new configure -menu $menu"
    }
    set manager [set manager [winfo manager $w]]
    if {$manager == "grid" || $manager == "pack" || $manager == "place"} {
        append state "$manager $new [my packerConfigurationString $w $manager $root]\n"
    }
    set grid [grid size $w]
    if {[set cols [lindex $grid 0]] > 0} {
        for {incr cols -1} {$cols > -1} {incr cols -1} {
            append state "grid columnconfigure $new $cols [grid columnconfigure $w $cols]\n"
        }
    }
    if {[set rows [lindex $grid 1]] > 0} {
        for {incr rows -1} {$rows > -1} {incr rows -1} {
            append state "grid rowconfigure $new $rows [grid rowconfigure $w $rows]\n"
        }
    }
    return $state
}
