IDE::CompView instproc renameComponent component {
    set compObj [IDE::Component getCompObjectForName $component]
    set ret [IDE::IDialogEntry getValue {Enter new name for the component} [$compObj getName]]
    if {$ret ne "" && $ret ne [$compObj getName]} {
        if {![regexp {^[\w:]+$} $ret]} {
            IDE::Dialog error {Wrong name for the component}
            return
        }
        $compObj rename $ret
        IDE::System signalComponentsChanged
    }
}
