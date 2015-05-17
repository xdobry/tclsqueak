IDE::VersionChooser proc getVersion {object name} {
    set instance [my new [Object autoname .vchooser] [list -vobject $object] [list -type version] [list -name $name]]
    $instance suspendUntilSignal
    set ret [$instance getResult]
    $instance destroy
    return $ret
}
