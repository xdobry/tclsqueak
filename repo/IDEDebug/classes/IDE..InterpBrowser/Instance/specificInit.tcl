IDE::InterpBrowser instproc specificInit {} {
    my instvar win introProxy

    set introProxy [IDE::NSIntroProxyInterp create [self]::@introproxy]
    IDE::InterpView create [self]::@interpview $win.interp
    IDE::MethodEdit create [self]::@edit $win.edit -width 40 -introProxy $introProxy

    pack $win.interp -fill y -side left
    pack $win.edit -fill both -expand yes
    my @interpview refresh
    next
}
