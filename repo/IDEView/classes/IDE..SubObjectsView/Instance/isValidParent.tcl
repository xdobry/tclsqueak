IDE::SubObjectsView instproc isValidParent {} {
    my instvar vobject introProxy
    expr {$vobject ne "" && [set parent [$introProxy getParentForObject $vobject]] ne "::" && [$introProxy isObject $parent]}
}
