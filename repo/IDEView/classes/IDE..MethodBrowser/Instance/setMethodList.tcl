IDE::MethodBrowser instproc setMethodList list {
    [self]::methodlist setList $list
    if {[llength $list]>=1} {
        [self]::methodlist setSelectedIndex 0 1
    }
}
