IDE::EditionBrowser instproc changeViewType state {
    my instvar vtype methodInstanceArray methodClassArray
    set vtype $state
    [self]::methods setList [array names method${vtype}Array]
}
