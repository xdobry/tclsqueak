IDE::BreakpointEdit instproc specificInit {} {
    my instvar win superclassList mode className parameter expression isActive

    my requireNamespace
    frame $win.buttons -relief raised -border 3
    label $win.lmethod -text "[[my breakpoint] displayMethodName] [[my breakpoint] counter]"
    #checkbutton $win.active -text "active" -command [list [self] changeActivity] -variable [self]::isActive

    #if {[[my breakpoint] isActive]} {
    #    $win.active select
    #}
    #label $win.lexpression -text "Conditional Expression"
    #entry $win.expression
    #set expression [[my breakpoint] expression]
    #$win.expression insert 0 $expression

    button $win.buttons.ok -text Ok -command [list [self] actionOk]
    button $win.buttons.cancel -text Cancel -command [list [self] cancelBrowser]
    button $win.buttons.remove -text {Remove Breakpoint} -command [list [self] removeBreakpoint]

    pack $win.buttons.ok $win.buttons.remove $win.buttons.cancel -side left
    pack $win.lmethod  -anchor w
    #pack $win.active  -anchor w
    #pack $win.lexpression -anchor w
    #pack $win.expression -fill x -expand yes
    pack $win.buttons -fill x -expand yes

    my setEventHandlers
    next
}
