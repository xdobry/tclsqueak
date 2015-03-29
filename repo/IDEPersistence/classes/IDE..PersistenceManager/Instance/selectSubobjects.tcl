IDE::PersistenceManager instproc selectSubobjects {obj relcols subcols} {
    set desc [$obj getDescriptor]
    set id [$obj getIdValue]
    my selectSubobjectsBase $desc $id $relcols $subcols
}
