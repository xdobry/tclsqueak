IDE::VersionChooser proc getVersionForComponent name {
    set instance [my new [Object autoname .vchooser] -vobject IDE::ComponentPersistence -type version -name $name]
    $instance suspendUntilSignal
    set ret [$instance getResult]
    $instance destroy
    return $ret
}
