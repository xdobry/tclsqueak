IDE::TclProcsDescriptionPer instproc synchronizeWithId id {
    my instvar methodid
    set methodid $id
    my rereadAttributes {basedon versioninfo timest userid infoid}
}
