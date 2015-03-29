IDE::MetakitPersistenceManager proc getTestInstance {} {
    if {[Object isobject ::mpmanager]} {
        return ::mpmanager
    }
    set obj [IDE::MetakitPersistenceManager create ::mpmanager]
    set con [XOMetakit new -childof $obj]
    $con connect {metakit_file {C:\\Dokumente und Einstellungen\\atrzewik\\Eigene Dateien\\xotcl\\xotclIDE75.vfs\\xotcllib.mk}}
    $obj connection $con
    return $obj
}
