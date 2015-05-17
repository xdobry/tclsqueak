IDE::CompLoader instproc loadVersion {} {
    my instvar name componentObject
    set versionid [[self]::version getSelectedVersion]
    if {$versionid ne ""} {
        IDE::ComponentPersistence loadNameVersionId $name $versionid $componentObject
        IDE::System signalComponentsChanged
    }
    my signalFree
}
