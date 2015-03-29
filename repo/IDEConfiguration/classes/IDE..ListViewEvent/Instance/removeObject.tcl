IDE::ListViewEvent instproc removeObject obj {
    my instvar objectsList
    set i [lsearch -exact $objectsList $obj]
    if {$i<0} return
    set objectsList [lreplace $objectsList $i $i]
    my removeItemAt $i
}
