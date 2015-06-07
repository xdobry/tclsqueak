IDE::CodeSearchDialog instproc init {} {
    my instvar win caseSensitive text searchType scope context
    next
    my requireNamespace
    set caseSensitive 1
    set text ""
    set searchType regexp
    set scope all
    set searchPrefs [IDE::InputCache getValueCache codeSearchPrefs]
    my applyPrefs caseSensitive caseSensitive $searchPrefs {0 1}
    my applyPrefs searchType searchType $searchPrefs {regexp text word}
    
    ttk::label $win.label -text "Containing text:"
    ttk::combobox $win.text -textvariable [self]::text -width 50 -values [IDE::InputCache getValuesCache search]
    ttk::checkbutton $win.caseSensitive -variable [self]::caseSensitive -text "Case sensitive"
    ttk::frame $win.rb
    ttk::radiobutton $win.rb.text -text "Text" -variable [self]::searchType -value text
    ttk::radiobutton $win.rb.regexp -text "Regular Expression" -variable [self]::searchType -value regexp
    ttk::radiobutton $win.rb.word -text "Whole word" -variable [self]::searchType -value word
    ttk::labelframe $win.scope -text Scope
    ttk::radiobutton $win.scope.all -text "All" -variable [self]::scope -value all
    ttk::radiobutton $win.scope.component -text "Selected Component" -variable [self]::scope -value component
    ttk::radiobutton $win.scope.object -text "Selected Type" -variable [self]::scope -value object
    
    set availableScopes {all component object}
    if {![dict exists $context component]} {
        $win.scope.component  state disabled
        $win.scope.object state disabled
        set availableScopes {all}
    } elseif {![dict exists $context object]} {
        $win.scope.object state disabled
        set availableScopes {all component}
    }
    my applyPrefs scope scope $searchPrefs $availableScopes
    
    
    pack $win.label -anchor w
    pack $win.text -fill x
    pack $win.caseSensitive -anchor w
    pack $win.rb -fill x
    pack $win.rb.text $win.rb.regexp $win.rb.word -anchor w
    pack $win.scope -fill x
    pack $win.scope.all $win.scope.component $win.scope.object -anchor w
    focus $win.text
    
    wm deiconify $win
}
