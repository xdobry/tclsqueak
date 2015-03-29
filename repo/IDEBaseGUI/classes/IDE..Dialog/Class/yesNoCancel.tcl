IDE::Dialog proc yesNoCancel message {
    set fwin [focus]
    set parent .
    if {$fwin ne ""} { set parent [winfo toplevel $fwin] }
    tk_messageBox -title [::msgcat::mc "Choose"] -message $message -icon question -type yesnocancel -parent $parent
}
