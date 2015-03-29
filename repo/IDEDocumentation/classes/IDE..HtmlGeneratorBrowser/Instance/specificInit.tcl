IDE::HtmlGeneratorBrowser instproc specificInit {} {
    my instvar win ignorePrivateCategory ignoreNoCommented useWikit

    my set actualDir {}
    my requireNamespace

    message $win.message -text "This tool genarate html documentation from comments and sturcture of choosen components. The documentation will be a set of html files with main entry page index.html" -width 350

    frame $win.sel
    frame $win.dir
    frame $win.docname

    button $win.generate -text Generate -command [list [self] generate]
    button $win.sel.all -text "All Components" -command [list [self] selectAll]
    button $win.sel.allTcl -text "Exclude IDE Components" -command [list [self] excludeIDE]
    button $win.dir.changedir -text "Change Dir" -command [list [self] changeDir]
    label $win.dir.dirname -relief sunken -border 2 -width 50 -anchor w

    label $win.docname.lab -text "documentation name"
    entry $win.docname.name
    $win.docname.name insert 0 "XOTcl docu"
    pack $win.docname.lab -side left
    pack $win.docname.name -side left -fill x

    checkbutton $win.igncategory -text "ignore private category" -variable [self]::ignorePrivateCategory
    checkbutton $win.ignnocommented -text "ignore no commented methods" -variable [self]::ignoreNoCommented
    checkbutton $win.usewikit -text "use wikit html formater" -variable [self]::useWikit
    set ignorePrivateCategory 1
    set ignoreNoCommented 0
    set useWikit 1

    IDE::ListView create [self]::components $win.files -multiselect 1

    pack $win.dir.dirname -fill x -expand yes -side left
    pack $win.dir.changedir -side left
    pack $win.sel.all $win.sel.allTcl -side left
    pack $win.message  -fill x
    pack $win.dir -anchor w -fill x
    pack $win.files -fill both -expand yes
    pack $win.sel -anchor w
    pack $win.docname -fill x
    pack $win.igncategory -anchor w
    pack $win.ignnocommented -anchor w
    pack $win.usewikit -anchor w
    pack $win.generate -anchor w

    my readComponents
}
