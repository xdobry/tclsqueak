IDE::Dialog proc getDir {{initial {}} {mustExists 0}} {
    set fwin [focus]
    set parent .
    if {$fwin ne ""} { set parent [winfo toplevel $fwin] }
    return [tk_chooseDirectory -initialdir $initial -parent $parent -mustexist $mustExists]
}
