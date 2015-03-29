IDE::EditionChooser proc getVersion {editions selected} {
    set instance [my new [Object autoname .vchooser] -versions $editions -selected $selected]
    $instance suspendUntilSignal
    set ret [$instance getResult]
    $instance destroy
    return $ret
}
