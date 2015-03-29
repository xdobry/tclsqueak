IDE::ConfigurationBrowser instproc hasComponents {} {
    expr {[llength [[self]::confapp getList]]>0}
}
