IDE::VersionBrowser instproc loadVersion {} {
    my instvar vobject name componentObject
    set versionid [[self]::version getSelectedVersion]
    if {$versionid ne ""} {
        $vobject loadNameVersionId $name $versionid $componentObject
        if {$vobject eq "IDE::ComponentPersistence"} {
            IDE::System signalComponentsChanged
        }
        my destroy
    }
}
