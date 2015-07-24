IDE::VarsView instproc refresh {} {
    my instvar vobject introProxy
    my setList [$introProxy getVarsForObject $vobject]
    my selectItem {}
}
