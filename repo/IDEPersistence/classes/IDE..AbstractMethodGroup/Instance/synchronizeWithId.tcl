IDE::AbstractMethodGroup instproc synchronizeWithId id {
    my instvar objectid
    set objectid $id
    my rereadAttributes {basedon versioninfo timest isclosed userid infoid}
    my synchronizeMethods
    my trackingOn
}
