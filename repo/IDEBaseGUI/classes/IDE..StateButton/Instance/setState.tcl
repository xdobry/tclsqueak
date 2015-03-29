IDE::StateButton instproc setState newState {
    my instvar state win
    set state $newState
    $win configure -text $state
}
