IDE::Dialog proc infoMessage text {
    set fwin [focus]
    set parent .
    if {$fwin ne ""} { set parent [winfo toplevel $fwin] }
    return [tk_messageBox -title [::msgcat::mc "Info"] -message $text -icon info -type ok -parent $parent]
}
