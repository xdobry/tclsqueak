IDE::ListView instproc reorderSelected shift {
    my instvar listItems win
    set cur [$win.listbox curselection]
    if {[llength $cur]!=1} { return 0 }
    set len [llength $listItems]
    if {$cur+$shift<0 || $cur+$shift>=$len} {return 0}
    set sitem [lindex $listItems $cur]
    set insertIndex [expr $cur+$shift]
    set listItems [linsert [lreplace $listItems $cur $cur] $insertIndex $sitem]
    $win.listbox delete $cur
    $win.listbox insert $insertIndex $sitem
    $win.listbox selection set $insertIndex $insertIndex
    return 1
}
