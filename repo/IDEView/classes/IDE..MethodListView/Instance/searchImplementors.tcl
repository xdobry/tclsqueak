IDE::MethodListView instproc searchImplementors actual {
    set method [lindex [split $actual >] 1]
    IDE::MethodBrowser searchImplementorsAll $method
}
