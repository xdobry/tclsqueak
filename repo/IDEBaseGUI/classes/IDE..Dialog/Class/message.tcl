IDE::Dialog proc message text {
    set fwin [focus]
    set parent .
    if {$fwin ne ""} {
        set parent [winfo toplevel $fwin]
    } else {
        # trick to ensure that the dialog is not covered by another windows
        # needed by linux gnome
        update idletasks
        raise $parent
    }
    return [tk_messageBox -title [::msgcat::mc "Message"] -message $text -icon warning -type ok -parent $parent]
}
