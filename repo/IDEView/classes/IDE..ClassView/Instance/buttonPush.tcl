IDE::ClassView instproc buttonPush {} {
    my instvar win selectedIndex listItems
    set currsel [lindex [$win.listbox curselection] 0]
    if {$currsel ne "" && $currsel!=$selectedIndex} {
        if {![my askForItemChange]} {
            my setSelectedIndex $selectedIndex 0
        } else {
            set selectedIndex $currsel
            my selectItem [string trimleft [lindex $listItems $currsel]]
        }
    }
    focus [my getFocusWin]
}
