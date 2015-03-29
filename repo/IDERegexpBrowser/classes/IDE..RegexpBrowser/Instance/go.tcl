IDE::RegexpBrowser instproc go {} {
    my instvar winRegexp

    set exp [$winRegexp get 1.0 end-1char]
    # check if regexp is OK
    if {[catch { regexp -- $exp dummy } errMsg]} {
        tk_messageBox -type ok -icon error -message "Malformed regexp: $errMsg"
        return
    }
    my regexp:colorize
    my sample:colorize
    my history:add
}
