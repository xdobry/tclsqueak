IDE::VarsView instproc editSave {value {contentDescr {}}} {
    my instvar vvariable vtype vobject
    if {$vtype eq "array"} {
        my varAction array set $vvariable $value
    } else {
        my varAction set $vvariable $value
    }
}
