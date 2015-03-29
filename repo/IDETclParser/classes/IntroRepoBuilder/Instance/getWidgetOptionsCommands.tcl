IntroRepoBuilder instproc getWidgetOptionsCommands widget {
    my instvar coreRepo
    set tkwidget .twidget
    #ttc vartype tkwidget tk
    $widget $tkwidget; #ttc noerror
    set options [list]
    foreach l [$tkwidget configure] {
        lappend options [lindex $l 0]
    }
    set methods [my getMethodsForObject $tkwidget]
    destroy $tkwidget
    return [list $options $methods]
}
