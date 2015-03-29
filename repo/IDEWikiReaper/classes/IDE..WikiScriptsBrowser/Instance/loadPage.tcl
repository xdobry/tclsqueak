IDE::WikiScriptsBrowser instproc loadPage {} {
    my instvar win reaper
    set c [$reaper reap [$win.nav.page get]]
    my @editor setText $c
}
