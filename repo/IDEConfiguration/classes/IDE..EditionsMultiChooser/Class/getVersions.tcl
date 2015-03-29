IDE::EditionsMultiChooser proc getVersions {names versions} {
    set instance [my new [Object autoname .vchooser] -names $names -versions $versions]
    $instance suspendUntilSignal
    set ret [$instance getResult]
    $instance destroy
    return $ret
}
