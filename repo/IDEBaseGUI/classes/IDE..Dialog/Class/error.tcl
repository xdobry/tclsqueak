IDE::Dialog proc error text {
    set fwin [focus]
    set parent .
    if {$fwin ne ""} { set parent [winfo toplevel $fwin] }
    tk_messageBox -title {Message} -message $text -icon error -type ok -parent $parent
}
