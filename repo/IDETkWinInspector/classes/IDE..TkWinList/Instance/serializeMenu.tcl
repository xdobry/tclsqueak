IDE::TkWinList instproc serializeMenu {c root} {
    set end [$c index end]
    set text ""
    for {set x 0} {$x <= $end} {incr x} {
        set state "$c add [$c type $x] [my getconfig $c [list entryconfigure $x]]\n"
        regsub -all -- $root $state \$win state
        append text $state
    }
    return $text
}
