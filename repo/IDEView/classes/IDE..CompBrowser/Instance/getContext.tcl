IDE::CompBrowser instproc getContext {} {
    set context [dict create]
    set comp [[self]::@compview selectedItem]
    if {$comp ne ""} {
        dict set context component $comp        
        set object [[self]::classview set vclass]
        if {$object ne ""} {
            dict set context object $object
        }
    }
    return $context
}
