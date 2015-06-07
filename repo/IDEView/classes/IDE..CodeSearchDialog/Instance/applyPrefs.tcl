IDE::CodeSearchDialog instproc applyPrefs {varref key prefsDict values} {
    if {[dict exists $prefsDict $key]} {
        set value [dict get $prefsDict $key]
        if {$value in $values} {
            upvar $varref var
            set var $value            
        }
    }
}
