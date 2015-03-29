IDE::DirectFind instproc hide {} {
    my instvar win parentWin textWin curMarkSelection
    if {$win in [pack slaves $parentWin]} {
        pack forget $win
        focus $textWin
        if {$curMarkSelection ne "1.0"} {
            $textWin mark set insert $curMarkSelection
            set nextRange [$textWin tag nextrange silbingSelect 1.0]
            if {$nextRange ne ""} {
                $textWin tag add sel {*}$nextRange
            }
        }
    }
}
