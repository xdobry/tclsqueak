IDE::IDialogListFilter instproc filterList {} {
    my instvar win pattern candidates lpattern
    if {$pattern eq $lpattern} {
        return
    }
    set lpattern $pattern
    set lw $win.listbox
    set mpattern $pattern
    if {$mpattern eq ""} {
        $lw delete 0 end
        return
    }
    if {[string index $pattern end] ni {? *}} {
        append mpattern *
    }
    set l [list]
    foreach c $candidates {
        if {[string match -nocase $mpattern $c]} {
            lappend l $c
        }
    }
    #my halt
    $lw delete 0 end
    $lw insert 0 {*}$l
    $lw selection set 0
}
