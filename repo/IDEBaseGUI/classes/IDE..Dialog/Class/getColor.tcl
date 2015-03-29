IDE::Dialog proc getColor {{initialcolor {}}} {
    set fwin [focus]
    set parent .
    if {$fwin ne ""} { set parent [winfo toplevel $fwin] }
    if {$initialcolor eq ""} {
        tk_chooseColor -title "Choose color" -parent $parent
    } else {
        tk_chooseColor -initialcolor $initialcolor -title "Choose color" -parent $parent
    }
}
