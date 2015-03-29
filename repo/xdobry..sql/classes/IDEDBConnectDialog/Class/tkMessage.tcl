IDEDBConnectDialog proc tkMessage text {
    set fwin [focus]
    set parent .
    if {$fwin!={}} { set parent [winfo toplevel $fwin] }
    return [tk_messageBox -title {Message} -message $text -icon warning -type ok -parent $parent]
}
