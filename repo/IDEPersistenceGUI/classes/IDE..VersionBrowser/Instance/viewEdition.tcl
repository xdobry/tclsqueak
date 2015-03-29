IDE::VersionBrowser instproc viewEdition {} {
    my instvar vobject name
    set versionid [[self]::version getSelectedVersion]
    if {$versionid ne ""} {
        if {$vobject eq "IDE::ComponentPersistence"} {
            IDE::EditionBrowser browseComponentEdition [IDE::ComponentEdition new $versionid]
        } else {
            IDE::EditionBrowser browseObjectEdition [IDE::ObjectEdition new $name $versionid]
        }
    }
}
