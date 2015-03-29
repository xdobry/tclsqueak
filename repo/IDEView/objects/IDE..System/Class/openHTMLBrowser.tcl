IDE::System proc openHTMLBrowser url {
    # Taken from WIKI Page 557
    global tcl_platform

    # It *is* generally a mistake to switch on $tcl_platform(os), particularly
    # in comparison to $tcl_platform(platform).  For now, let's just regard it
    # as a stylistic variation subject to debate.
    switch $tcl_platform(os) {
        Darwin {
            set command [list open $url]
        }
        HP-UX -
        Linux  -
        SunOS {
            foreach executable {firefox mozilla netscape iexplorer opera lynx
            w3m links galeon konquerer mosaic firefox amaya
            browsex elinks} {
                set executable [auto_execok $executable]
                if [string length $executable] {
                    # Do you want to mess with -remote?  How about other browsers?
                    set command [list $executable $url &]
                    break
                }
            }
        }
        {Windows 95} -
        {Windows NT} {
            set command "[auto_execok start] {} [list $url]"
        }
    }
    if [info exists command] {
        if [catch {eval exec $command} err] {
            tk_messageBox -icon error -message "error '$err' with '$command'"
        }
    } else {
        tk_messageBox -icon error -message  "Please ($tcl_platform(os), $tcl_platform(platform)) is not yet ready for browsing."
    }
}
