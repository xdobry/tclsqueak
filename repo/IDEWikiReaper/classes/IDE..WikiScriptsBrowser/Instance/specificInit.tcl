IDE::WikiScriptsBrowser instproc specificInit {} {
    my instvar win reaper isSafeInterp useTk introProxy proxyHost proxyPort
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
    label $win.status -anchor w

    pack $win.nav.lpage $win.nav.page $win.nav.loadpage $win.nav.run $win.nav.browse $win.nav.delete -side left

    frame $win.nav1
    label $win.nav1.lproxyhost -text "proxy host"
    entry $win.nav1.proxyhost -textvariable [self]::proxyHost
    label $win.nav1.lproxyport -text "proxy port"
    entry $win.nav1.proxyport -textvariable [self]::proxyPort

    pack $win.nav1.lproxyhost $win.nav1.proxyhost $win.nav1.lproxyport $win.nav1.proxyport -side left

    frame $win.nav2

    checkbutton $win.nav2.useTk -text "load Tk" -variable [self]::useTk
    checkbutton $win.nav2.safeInterp -text "use safe interp" -variable [self]::isSafeInterp
    label $win.nav2.safeInterpInfo -text "Safe interp does not allo all commands as menu, toplevel"

    pack $win.nav2.useTk $win.nav2.safeInterp $win.nav2.safeInterpInfo -side left

    IDE::Editor [self]::@editor $win.editor -introProxy $introProxy

    pack $win.lframe -side left -fill y
    pack $win.nav1 -fill x -anchor e
    pack $win.nav -fill x -anchor e
    pack $win.nav2 -fill x -anchor e
    pack $win.editor -fill both -expand yes
    pack $win.status -fill x

    $win.nav.browse configure -state disabled
    $win.nav.delete configure -state disabled

    my initProxySetting
    next
}
