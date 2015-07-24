IDE::ArrayBrowser instproc specificInit {} {
    my instvar win vobject varray introProxy
    my set actual {}

    panedwindow $win.panedwindow -orient horizontal

    IDE::NListView create [self]::keys $win.keys -notify [self] -notifyProc selectKey -height 25
    IDE::MethodEdit create [self]::edit $win.edit -width 40

    $win.panedwindow add $win.keys -sticky news
    $win.panedwindow add $win.edit -sticky news

    pack $win.panedwindow -fill both -expand yes

    if {![info exists introProxy] || ![Object isobject $introProxy]} {
        if {$vobject ne ""} {
            set introProxy [IDE::XOIntroProxy getIntroProxyForObject $vobject]
        }
        if {$introProxy eq ""} {
            set introProxy [IDE::XOIntroProxy getIntroProxy]
        }
    }

    my initContents
    my setTitleAddition "$vobject : $varray"


    next
}
