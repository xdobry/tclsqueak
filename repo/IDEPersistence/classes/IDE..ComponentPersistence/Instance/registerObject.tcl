IDE::ComponentPersistence instproc registerObject obj {
    IDE::ObjectDescription importObject $obj
    my installObject $obj
}
