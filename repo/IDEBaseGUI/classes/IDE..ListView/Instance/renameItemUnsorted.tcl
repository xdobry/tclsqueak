IDE::ListView instproc renameItemUnsorted {item newname} {
    my instvar listItems win
    set cur [lsearch -exact $listItems $item]
    if {$cur>=0} {
        $win.listbox delete $cur
        $win.listbox insert $cur $newname
        $win.listbox selection set $cur $cur
        set listItems [lreplace $listItems $cur $cur $newname]
    }
}
