IDE::Dialog proc yesNo message {
    set fwin [focus]
    set parent .
    if {$fwin ne ""} { set parent [winfo toplevel $fwin] }
    tk_messageBox -title [::msgcat::mc "Choose"] -message $message -icon question -type yesno -parent $parent
}
