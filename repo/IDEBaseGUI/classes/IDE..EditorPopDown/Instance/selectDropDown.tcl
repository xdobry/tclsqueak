IDE::EditorPopDown instproc selectDropDown {} {
    my instvar dropWin compPattern
    set currsel [lindex [$dropWin.listbox curselection] 0]
    if {$currsel ne ""} {
        set item [$dropWin.listbox get $currsel]
        set sindex [expr {[string length $compPattern] + [string first [string range $compPattern 0 end-1] $item] -1}]
        my appendToCursor "[string range $item $sindex end]"
    }
    my hidePopdown
}
