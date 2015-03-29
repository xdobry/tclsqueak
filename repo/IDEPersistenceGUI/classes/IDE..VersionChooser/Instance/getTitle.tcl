IDE::VersionChooser instproc getTitle {} {
    my instvar name vobject
    return "Choose version for [$vobject typeName] $name"
}
