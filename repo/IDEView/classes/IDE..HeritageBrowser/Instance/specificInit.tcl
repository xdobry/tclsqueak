IDE::HeritageBrowser instproc specificInit {} {
    my instvar win vtype

    # The simplest factory pattern case in the free world
    if {[IDE::System isDatabase]} {
        set postFix DB
    } else {
        set postFix ""
    }
    panedwindow $win.panedwindow -orient vertical
    panedwindow $win.upperarea -orient horizontal
    IDE::HeritageClassView create [self]::hclassview $win.upperarea.hclassview -vtype $vtype -focusKey {Alt-KeyPress-1} -height 1
    IDE::MethodCategoryView create [self]::methodcatview $win.upperarea.methodcatview  -focusKey {Alt-KeyPress-2}  -height 1
    IDE::MethodView${postFix} create [self]::methodview $win.upperarea.methodview  -focusKey {Alt-KeyPress-3}  -height 1
    IDE::TclModeEdit create [self]::methodedit $win.methodedit

    $win.upperarea add $win.upperarea.hclassview $win.upperarea.methodcatview $win.upperarea.methodview -width 200
    $win.panedwindow add $win.upperarea  $win.methodedit -sticky news -height  220
    pack $win.panedwindow -expand yes -fill both

    my initStatusBar 2 3
}
