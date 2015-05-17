IDE::ComponentPersistence instproc setNamespace pnamespace {
    if {$pnamespace ne ""} {
        my instvar namespace
        set namespace $pnamespace
        if {![namespace exists $pnamespace]} {
            namespace eval $pnamespace {}
        }
    }
}
