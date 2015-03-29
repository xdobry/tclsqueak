IDE::WikiScriptsBrowser instproc specificInit {} {
    my instvar win reaper isSafeInterp useTk introProxy
    my requireNamespace

    set isSafeInterp 1
    set useTk 1

    set reaper [IDE::WikiReapMixin new -childof [self]]

    set introProxy [IDE::NSIntroProxyInterp create [self]::@introProxy -interp wiki]

    frame $win.lframe

    button $win.lframe.load -text "load list from wiki" -command [list [self] loadWikiList]
    IDE::NListView [self]::@wikis $win.lframe.slist -notify [self] -notifyProc selectWikiPage

    pack $win.lframe.load -anchor w
    pack $win.lframe.slist -fill both -expand yes

    frame $win.nav
    label $win.nav.lpage -text "page number"
    entry $win.nav.page
    button $win.nav.loadpage -text "load page" -command [list [self] loadPage]
    button $win.nav.run  -text "Run" -command [list [self] runCommand]
    button $win.nav.browse  -text "Browse Interp" -command [list [self] browseInterp]
    button $win.nav.delete  -text "Delete Interp" -command [list [self] deleteInterp]

    pack $win.nav.lpage $win.nav.page $win.nav.loadpage $win.nav.run $win.nav.browse $win.nav.delete -side left

    frame $win.nav2

    checkbutton $win.nav2.useTk -text "load Tk" -variable [self]::useTk
    checkbutton $win.nav2.safeInterp -text "use safe interp" -variable [self]::isSafeInterp

    pack $win.nav2.useTk $win.nav2.safeInterp -side left

    IDE::Editor [self]::@editor $win.editor -introProxy $introProxy

    pack $win.lframe -side left -fill y
    pack $win.nav -fill x -anchor e
    pack $win.nav2 -fill x -anchor e
    pack $win.editor -fill both -expand yes
    next
}
