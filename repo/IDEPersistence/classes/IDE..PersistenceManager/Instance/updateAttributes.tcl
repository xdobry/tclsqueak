IDE::PersistenceManager instproc updateAttributes {obj attrs} {
    set descriptor [$obj getDescriptor]
    set id [$obj set [$descriptor idColumn]]
    set updateset [list]
    foreach attr $attrs {
        set value [$descriptor getValueForObject $obj $attr]
        lappend updateset $attr $value
    }
    my updateAttributesBase [$descriptor table] [$descriptor idColumn] $id $updateset
}
