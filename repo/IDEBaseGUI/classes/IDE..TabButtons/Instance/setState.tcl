IDE::TabButtons instproc setState newState {
    my instvar state
    if {$state ne ""} {
        [my winNameFromState $state] state !selected
    }
    set state $newState
    if {$newState ne ""} {
        [my winNameFromState $state] state selected
    }
}
