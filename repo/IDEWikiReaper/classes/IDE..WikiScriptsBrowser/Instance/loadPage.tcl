IDE::WikiScriptsBrowser instproc loadPage {} {
    my instvar win reaper
    my configureProxy
    set page [$win.nav.page get]
    my setStatus "loading page $page"
    set c [$reaper reap $page]
    my @editor setText $c
    my setStatus "page loaded"
}
