IDE::ObjectEdition instproc printString {} {
    my instvar name objectid
    return "[self class] $name $objectid"
}
