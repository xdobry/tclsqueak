IDE::ObjectMethodView instproc selectFor {object pintroProxy} {
    my instvar vclass visibility vobject hideMixinMethod hideProcsMethod hideNoCmds introProxy
    set introProxy $pintroProxy
    if {![my exists hideMixinMethod]} {
        my set hideMixinMethod 0
    }
    if {![my exists hideProcsMethod]} {
        my set hideProcsMethod 0
    }
    if {![my exists hideNoCmds]} {
        my set hideNoCmds 0
    }
    set vcategories _all_categories
    set vobject $object
    if {$object eq ""} {
        my setList {}
    } else {
        my setList [$introProxy getDetailedObjectMethods $object $visibility $hideMixinMethod $hideProcsMethod $hideNoCmds]
        set vclass [$introProxy getClassForObject $object]
    }
    my selectItem {}
}
