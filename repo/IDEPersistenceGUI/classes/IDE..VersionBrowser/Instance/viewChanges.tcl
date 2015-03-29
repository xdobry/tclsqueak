IDE::VersionBrowser instproc viewChanges {} {
    my instvar vobject name
    set versionids [[self]::version getTwoSelectedVersion]
    if {$versionids ne ""} {
        if {$vobject eq "IDE::ComponentPersistence"} {
            IDE::ChangesBrowser compareComponents [IDE::ComponentEdition new [lindex $versionids 0]] [IDE::ComponentEdition new [lindex $versionids 1]]
        } elseif {$vobject eq "IDE::ObjectDescription"} {
            IDE::ChangesBrowser compareObjects [IDE::ObjectEdition new $name [lindex $versionids 0] -type Object] [IDE::ObjectEdition new $name [lindex $versionids 1] -type Object]
        } elseif {$vobject eq "IDE::ClassDescription"} {
            IDE::ChangesBrowser compareObjects [IDE::ObjectEdition new $name [lindex $versionids 0] -type Class] [IDE::ObjectEdition new $name [lindex $versionids 1] -type Class]
        } else {
            IDE::ChangesBrowser compareMethods [$vobject getAdditionalInfo [lindex $versionids 0]] [$vobject getAdditionalInfo [lindex $versionids 1]]
        }
    }
}
