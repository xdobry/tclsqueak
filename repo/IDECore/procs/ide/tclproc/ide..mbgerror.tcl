proc ide::mbgerror {err code} {
    variable origHandler
    global tcl_platform errorInfo
    set info $errorInfo
    if {$tcl_platform(platform) eq "macintosh"} {
	set ok Ok
    } else {
	set ok OK
    }
    if {[Object isobject IDE::ErrorStack] && [Object isobject ErrorReporter]} {
       set button [tk_dialog .bgerrorDialog "Error in Tcl Script"  "Error: $err" error 0 $ok "Skip Messages" "Default Handler" "Error Reporter" "Stack Trace Browser"]
    } elseif {[Object isobject ErrorReporter]} {
       set button [tk_dialog .bgerrorDialog "Error in Tcl Script. Please generate and send error report to program author"  "Error: $err" error 0 $ok "Skip Messages" "Default" "Error Reporter"]
    } else {
        tailcall $origHandler $err $code
    }
    if {$button == 0} {
	return
    } elseif {$button == 1} {
	return -code break
    } elseif {$button == 3} {
        ErrorReporter report $info
        return
    } elseif {$button == 4} {
        IDE::ErrorStack newBrowser $info
        return
    }
    tailcall $origHandler $err $code
}
