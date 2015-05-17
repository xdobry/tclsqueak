IDE::ObjectBrowser instproc specificInit {} {
    my instvar win type

    my set vobject ""

    panedwindow $win.panedwindow -orient vertical
    panedwindow $win.upperarea -orient horizontal

    IDE::Toolbar create [self]::@toolbar $win.toolbar
    my @toolbar addCommand "Refresh" [list [self] reload] refresh 1.0

    IDE::TclModeEdit create [self]::methodedit $win.methodedit -height 16 -width 65
    if {$type ne "single"} {
        IDE::ObjectsView create [self]::objectsview $win.upperarea.objectsview
        IDE::VarsView create [self]::varsview $win.upperarea.varsview -hasLock 1
        set col 1
    } else {
        IDE::VarsView create [self]::varsview $win.upperarea.varsview
        set col 0
    }
    IDE::SubObjectsView create [self]::subobjectsview $win.upperarea.subobjectsview
    IDE::ObjectMethodView create [self]::methodview $win.upperarea.methodview

    if { $col } {
        $win.upperarea add $win.upperarea.objectsview -width 200
    }
    $win.upperarea add $win.upperarea.varsview $win.upperarea.subobjectsview $win.upperarea.methodview -width 200

    $win.panedwindow add $win.upperarea -sticky news -height  120
    $win.panedwindow add $win.methodedit -sticky news -height 300

    pack $win.toolbar -fill x
    pack $win.panedwindow -expand yes -fill both

    if {$::xotcl::version>=1.3} {
        [self]::methodedit mixin add IDE::ContextEval
    } else {
        [self]::methodedit mixinappend IDE::ContextEval
    }
    [self]::methodedit set context Object

    my initStatusBar 2 [expr {3+$col}]
}
