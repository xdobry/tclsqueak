IDE::EditionBrowser instproc viewComponent compEdition {
    my instvar component objectsArr
    set component $compEdition
    my setTitleAddition " Component [$component getName] [$component set componentid]"
    
    [self]::classes setList [$component getObjectNames]
}
