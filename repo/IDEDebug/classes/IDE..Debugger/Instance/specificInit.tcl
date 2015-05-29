IDE::Debugger instproc specificInit {} {
    my instvar win

    ttk::panedwindow $win.panedwindow -orient vertical
    ttk::panedwindow $win.vararea -orient horizontal
    ttk::frame $win.butedit
    ttk::frame $win.buttons

    IDE::DebugMethodListView create [self]::methodlist $win.methodlist -height 5 -label {Stack/Frames}
    IDE::DebuggerMethodEdit create [self]::methodedit $win.methodedit -height 5 -mixin IDE::CodeController
    IDE::VarsView create [self]::varsview $win.varsview  -height 5
    IDE::NListView create [self]::local $win.localvars  -height 5 -label {Local Vars} -notify [self] -notifyProc selectLocalVars
    ttk::button $win.resume -command [list [self] set action break] -text Resume
    ttk::button $win.arguments -command [list [self] showArguments] -text {Level Arguments}
    pack $win.buttons -in $win.butedit -fill x -side top
    pack $win.methodedit -in $win.butedit -fill both -expand yes -side top
    pack $win.resume $win.arguments -in $win.buttons -side left

    $win.vararea add $win.varsview 
    $win.vararea add $win.localvars

    $win.panedwindow add $win.methodlist
    $win.panedwindow add $win.vararea
    $win.panedwindow add $win.butedit

    pack $win.panedwindow -expand yes -fill both
    
    my initStatusBar -1

    next
}
