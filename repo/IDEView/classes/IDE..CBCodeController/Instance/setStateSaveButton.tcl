IDE::CBCodeController instproc setStateSaveButton isEnabled {
    set methodedit [my getMethodedit]
    if {[$methodedit exists saveButton]} {
        set saveButton [$methodedit set saveButton]
        if {$isEnabled} {
            $saveButton state !disabled
        } else {
            $saveButton state disabled
        }
    }
}
