IDE::CompLoader proc loadComponent {} {
    set instance [my new [Object autoname .vchooser] [list -vobject [self]] [list -type available]]
    $instance suspendUntilSignal
    set ret [$instance getResult]
    $instance destroy
    return $ret
}
