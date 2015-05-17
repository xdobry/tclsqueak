IDE::XOIntroProxy instproc moveToComponent {object compName} {
    set oldapp [my getCompObjectFor $object]
    set newapp [IDE::Component getCompObjectForName $compName]
    if {[$oldapp getName] ne "default" && [$oldapp getOOType] ne [$newapp getOOType]} {
        error "can not move object to comp of different object oriented type from [$oldapp getOOType] to [$newapp getOOType]"
    }
    set ns [my getObjectNamespace $object]
    if {![$newapp setNamespaceIfPossible $ns]} {
        error "incompatible namesapce component ns is '[$newapp getNamespace]' needed '$ns'"
    }

    set isclass [my isObjectClass $object]
    if {$isclass} {
        $oldapp removeObject $object
    } else {
        $oldapp removeClass $object
    }
    my setMetadataForObject $object component $compName
    if {$isclass} {
        $newapp addClass $object
    } else {
        $newapp addObject $object
    }
}
