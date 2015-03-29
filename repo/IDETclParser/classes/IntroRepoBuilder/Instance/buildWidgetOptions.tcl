IntroRepoBuilder instproc buildWidgetOptions widget {
    my instvar coreRepo
    set tkwidget .twidget
    #ttc vartype tkwidget tk
    $widget $tkwidget;  #ttc noerror
    set options [list]
    foreach l [$tkwidget configure] {
        lappend options [lindex $l 0]
    }
    destroy $tkwidget
    return $options
}
