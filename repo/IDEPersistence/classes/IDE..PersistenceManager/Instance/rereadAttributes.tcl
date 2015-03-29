IDE::PersistenceManager instproc rereadAttributes {obj attrs} {
    set descriptor [$obj getDescriptor]
    set row [my getValueForColumns $obj $attrs]
    if {[llength $row]==0} {
        error "can not fetch the row for this id [$obj getIdValue]"
    }
    foreach attr $attrs column $row {
        $descriptor setValueForObject $obj $attr $column
    }
}
