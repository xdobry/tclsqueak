IDE::VersionChooser proc getVersionForComponent name {
    set instance [my new [Object autoname .vchooser] -volatile -vobject IDE::ComponentPersistence -type version -name $name]
    $instance suspendUntilSignal
    set ret [$instance getResult]
    return $ret
}
