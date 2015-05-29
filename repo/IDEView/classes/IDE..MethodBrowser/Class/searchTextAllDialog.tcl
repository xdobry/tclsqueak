IDE::MethodBrowser proc searchTextAllDialog {{master IDE::MethodBrowser}} {
    set sel ""
    set w [focus]
    if {$w ne "" && [winfo class $w] eq "Text"} {
        set range [$w tag ranges sel]
        if {[llength $range]>0} {
            set sel [$w get [lindex $range 0] [lindex $range 1]]
        }
    }
    
    set text [IDE::IDialogEntry getValue {give search text (regular expresion)} $sel search]
    if {$text ne ""} {
        $master showSearchResult [IDE::CodeSearch searchTextAll $text]
    }
}
