IDE::ClassView instproc newTclProcsGroup {} {
    my instvar vcomponent
    if {$vcomponent eq ""} return
    IDE::TclGroupDefinition newGroup [self]
}
