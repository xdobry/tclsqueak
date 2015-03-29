IDE::BreakpointEdit instproc actionOk {} {
    my instvar win expression breakpoint
    set newexpr [$win.expression get]
    if {$newexpr!=$expression} {
        $breakpoint expression $newexpr
    }
    my cancelBrowser
}
