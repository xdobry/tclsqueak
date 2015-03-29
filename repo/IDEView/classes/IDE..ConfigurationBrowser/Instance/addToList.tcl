IDE::ConfigurationBrowser instproc addToList {} {
    set item [[self]::applist selectedItem]
    if {$item eq ""} return
    my addElemToList $item
}
