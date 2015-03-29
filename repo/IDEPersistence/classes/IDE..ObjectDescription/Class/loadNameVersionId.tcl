IDE::ObjectDescription proc loadNameVersionId {name objectId compObj} {
    if {[Object isobject $name]} {
        set desc [$name getDescription]
    } else {
        set desc [$compObj getProcsGroupWithName $name]
    }
    if {[$desc isPersistent]} {
        if {[$desc getIdValue]!=$objectId} {
            $desc changeVersionTo $objectId
        }
    } else {
        set object [[my loadObject $objectId $compObj] getObject]
        if {[$object istype IDE::ProcsGroup]} {
            $compObj addProcsGroup $object
        } elseif {[Object isclass $object]} {
            $compObj addClass $object
        } else {
            $compObj addObject $object
        }
    }
}
