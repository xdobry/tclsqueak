IDE::VarsView instproc selectFor {object pintroProxy} {
    my instvar vobject lockedValue listItems introProxy
    set introProxy $pintroProxy
    set vobject $object
    if {$object eq ""} {
        my resetList
        return 0
    }
    my setList [$introProxy getVarsForObject $object]
    if {[my isLockOn]} {
        my setSelectedItem $lockedValue
        return 1
    } else {
        my selectItem {}
        return 0
    }
}
