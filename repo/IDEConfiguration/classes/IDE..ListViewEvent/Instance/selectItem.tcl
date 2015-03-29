IDE::ListViewEvent instproc selectItem item {
    my instvar sobject
    set sobject [lindex [my set objectsList] [my set selectedIndex]]
    my signalEvent selectedObject $sobject
}
