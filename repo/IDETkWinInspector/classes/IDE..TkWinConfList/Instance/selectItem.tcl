IDE::TkWinConfList instproc selectItem conf {
    my instvar vconf vwindow ignoreDefaults
    set vconf $conf
    if {$vconf eq ""} {
       set text ""   
    } elseif {$vconf eq "_all"} {
       append text "$vwindow configure"
       foreach conf [$vwindow configure] {
           # argvName, dbName, dbClass, defValue, and current value
           if {[llength $conf]<=2} continue
           if {$ignoreDefaults && [lindex $conf 3]==[lindex $conf 4]} continue
           append text "\\\n   [lindex $conf 0] [list [lindex $conf 4]]"
       }
    } else {
       set text [$vwindow cget $conf]
    }
    [my info parent]::valuetext setTextControler $text [self]
}
