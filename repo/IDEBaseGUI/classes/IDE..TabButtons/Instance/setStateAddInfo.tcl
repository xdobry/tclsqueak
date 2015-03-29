IDE::TabButtons instproc setStateAddInfo {state addInfo} {
    set win [my winNameFromState $state]
    $win configure -text "$state $addInfo"
}
