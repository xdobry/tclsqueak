IDE::AbstractClassView instproc createInstance selected {
    set introProxy [my getIntroProxy]
    if {[$introProxy isObjectClass $selected]} {
        set def [$introProxy getConstructorParamsDesc $selected]
        set ret [IDE::IDialogEntry getValueWithCancel "Create instance of $selected\n$def"]
        if {$ret eq "_cancel"} return
        set obj [$introProxy createInstance $selected [Object autoname sample] $ret]
        if {$obj ne ""} {
            IDE::ObjectBrowser newBrowser $obj
        }
    }
}
