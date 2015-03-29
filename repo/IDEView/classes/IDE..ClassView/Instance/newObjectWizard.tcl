IDE::ClassView instproc newObjectWizard {} {
    set object [IDE::IDialogEntry getValue {Specify Object name}]
    if {$object eq ""} return
    if {![info complete $object] || [llength $object]>1} {
        IDE::Dialog error "Object name should be simple word (one list element) but got '$object'"
        return
    }
    my setViewType Objects
    my editSave [[my getIntroProxy] getObjectDefinition $object]
}
