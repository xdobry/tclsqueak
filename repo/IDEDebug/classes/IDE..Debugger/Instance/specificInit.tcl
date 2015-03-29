IDE::Debugger instproc specificInit {} {
    my instvar win

    panedwindow $win.panedwindow -orient vertical
    panedwindow $win.vararea -orient horizontal
    frame $win.butedit
    frame $win.buttons

    IDE::DebugMethodListView create [self]::methodlist $win.methodlist -height 2
    IDE::DebuggerMethodEdit create [self]::methodedit $win.methodedit -height 2 -mixin IDE::CodeController
    IDE::VarsView create [self]::varsview $win.varsview  -height 2
    IDE::NListView create [self]::local $win.localvars  -height 2 -label {Local Vars} -notify [self] -notifyProc selectLocalVars
    button $win.resume -command [list [self] set action break] -text Resume
    button $win.arguments -command [list [self] showArguments] -text {Level Arguments}
    pack $win.buttons -in $win.butedit -fill x -side top
    pack $win.methodedit -in $win.butedit -fill both -expand yes -side top
    pack $win.resume $win.arguments -in $win.buttons -side left

    $win.vararea add $win.varsview $win.localvars  -width 200

    $win.panedwindow add $win.methodlist -sticky news -height  80
    $win.panedwindow add $win.vararea -sticky news -height 100
    $win.panedwindow add $win.butedit -sticky news -height 200

    pack $win.panedwindow -expand yes -fill both

    next
}
