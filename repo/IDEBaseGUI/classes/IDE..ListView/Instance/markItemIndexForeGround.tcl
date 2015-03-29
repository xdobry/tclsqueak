IDE::ListView instproc markItemIndexForeGround {index {color default}} {
    my instvar win
    if {$color eq "default"} {
         set color {}
    }
    $win.listbox itemconfigure $index -foreground $color
}
