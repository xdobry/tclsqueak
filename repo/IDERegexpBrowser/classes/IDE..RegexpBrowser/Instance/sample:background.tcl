IDE::RegexpBrowser instproc sample:background {} {
    my instvar data
    IDE::RegexpBrowser instvar colors bgcolors
    foreach level $data(v:levels) color $colors bgcolor $bgcolors {
        if {$data(v:background)} {
            $data(w:sample) tag configure $level -foreground $color -background $bgcolor
        } else {
            $data(w:sample) tag configure $level -foreground $color -background {}
        }
    }
}
