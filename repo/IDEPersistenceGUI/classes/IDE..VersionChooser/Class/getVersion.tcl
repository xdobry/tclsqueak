IDE::VersionChooser proc getVersion {object name} {
    set instance [my new [Object autoname .vchooser] [list -volatile] [list -vobject $object] [list -type version] [list -name $name]]
    $instance suspendUntilSignal
    set ret [$instance getResult]
    return $ret
}
