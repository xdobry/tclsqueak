IDE::ScriptEditor instproc specificInit args {
    my instvar win

    frame $win.butFrame
    button $win.butSyntaxCheck -command [list [self]::editor syntaxCheck] -text "Syntax Check"
    button $win.runscript -command [list [self]::editor runScript] -text "Run Script"
    button $win.runinslave -command [list [self]::editor runInSlave] -text "Run in Slave Interpreter"
    IDE::TclScripEditor [self]::editor $win.editor
    [self]::editor editMode xotcl
    pack $win.butSyntaxCheck $win.runscript $win.runinslave -side left -in $win.butFrame
    if {[Object isobject IDE::ExtendedDebugger]} {
        button $win.debugscript -command [list [self] debugScript] -text "Debug Script"
        pack $win.debugscript -side left -in $win.butFrame -after $win.runscript
    }
    pack $win.butFrame -fill x
    pack $win.editor -expand yes -fill both

    next
}
