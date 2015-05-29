IDE::CBCodeController instproc setButtonState {varName isEnabled} {
    my instvar $varName
    if {[info exists $varName]} {
        set button [set $varName]
        if {$isEnabled} {
            $button state !disabled
        } else {
            $button state disabled
        }
    }
}
