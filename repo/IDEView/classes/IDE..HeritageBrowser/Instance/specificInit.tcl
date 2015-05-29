IDE::HeritageBrowser instproc specificInit {} {
    my instvar win vtype

    # The simplest factory pattern case in the free world
    if {[IDE::System isDatabase]} {
        set postFix DB
    } else {
        set postFix ""
    }
    ttk::panedwindow $win.panedwindow -orient vertical
    ttk::panedwindow $win.upperarea -orient horizontal
    IDE::HeritageClassView create [self]::hclassview $win.upperarea.hclassview -vtype $vtype -focusKey {Alt-KeyPress-1} -height 10
    IDE::MethodCategoryView create [self]::methodcatview $win.upperarea.methodcatview  -focusKey {Alt-KeyPress-2}  -height 1
    IDE::MethodView${postFix} create [self]::methodview $win.upperarea.methodview  -focusKey {Alt-KeyPress-3}  -height 1
    IDE::TclModeEdit create [self]::methodedit $win.methodedit

    $win.upperarea add $win.upperarea.hclassview 
    $win.upperarea add $win.upperarea.methodcatview
    $win.upperarea add $win.upperarea.methodview 
    $win.panedwindow add $win.upperarea  
    $win.panedwindow add $win.methodedit
    pack $win.panedwindow -expand yes -fill both
    
    IDE::CBCodeController create [self]::@codecontroller

    my initStatusBar 2 3
}
