IDE::MethodBrowser proc searchClassUsage class {
    if { [string range $class 0 1] == "::" } {
        # remove global namespace prefix which is not always used
        set class [string range $class 2 end]
    }
    my searchTextAll "$class\[\[:>:\]\]"
}
