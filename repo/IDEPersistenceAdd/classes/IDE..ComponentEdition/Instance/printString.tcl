IDE::ComponentEdition instproc printString {} {
    my instvar name componentid
    return "[self class] $name $componentid"
}
