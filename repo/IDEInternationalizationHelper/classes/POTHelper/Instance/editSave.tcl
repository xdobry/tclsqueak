POTHelper instproc editSave text {
    my instvar catalog item
    if {$item<0 || $item>=[llength $catalog]} return
    ::msgcat::mcset [::msgcat::mclocale] [lindex $catalog $item] $text
}
