IDE::RegexpBrowser instproc history:add {} {
    my instvar data winRegexp w_history last counter inReplay

    if {$inReplay} {
        set inReplay 0
        return
    }

    set exp [$winRegexp get 1.0 end-1char]
    if {$exp != "" && $exp != $last} {
        # memorize position
        set start [$w_history index insert]
        # add text
        $w_history insert end "$exp\n"
        set end [$w_history index insert]
        $w_history insert end "\n" {spacing}
        set last $exp
        $w_history yview moveto 1.0
        # do the binding
        set tag "t$counter"
        incr counter
        $w_history tag bind $tag <Any-Enter> "$w_history tag configure $tag -background lightblue"
        $w_history tag bind $tag <Any-Leave> "$w_history tag configure $tag -background {}"
        $w_history tag bind $tag <1> [list [self] history:replay [list $exp]]
        $w_history tag add $tag $start $end

        # colorize the expression in history
        scan $start "%d.%d" sl sc
        incr sl -1
        foreach tag {e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 lookahead noreport} {
            foreach {start end} [$data(w:regexp) tag ranges $tag] {
                set start [$w_history index "$start + $sc chars + $sl lines"]
                set end [$w_history index "$end + $sc chars + $sl lines"]
                $w_history tag add $tag $start $end
            }
        }
    }
}
