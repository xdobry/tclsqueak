IDE::ObjectBrowser instproc setViewObject {object pintroProxy} {
    my instvar vobject introProxy
    set vobject $object
    set introProxy $pintroProxy
    [self]::methodedit set context $object
    if {$object ne ""} {
        my setTitleAddition "$object ([$introProxy getClassForObject $object])"
    } else {
        my setTitleAddition ""
    }
    set locked [[self]::varsview selectFor $object $introProxy]
    [self]::subobjectsview selectFor $object $introProxy
    [self]::methodview selectFor $object $introProxy
    return $locked
}
