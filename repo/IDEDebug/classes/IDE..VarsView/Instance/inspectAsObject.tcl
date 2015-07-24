IDE::VarsView instproc inspectAsObject actual {
    my instvar vobject vtype
    if {$vtype eq "array"} return
    set value [my varAction set $actual]
    if {![Object isobject $value]} {
        IDE::Dialog message "$value is not an Object"
        return
    }
    $value inspect
}
