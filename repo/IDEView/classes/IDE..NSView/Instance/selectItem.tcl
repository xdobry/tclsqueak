IDE::NSView instproc selectItem ns {
    my instvar vnamespace
    set vnamespace $ns
    [my info parent]::@elements selectFor $ns
}
