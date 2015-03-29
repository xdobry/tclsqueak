IDE::BreakpointsBrowser proc newBrowser {} {
    # BreakpointsBrowser is a singleton browser
    if {![winfo exists .bpbrowser]} {
        return [my new .bpbrowser]
    } else {
        return {}
    }
}
