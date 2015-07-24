IDE::VarsView instproc searchReferences selected {
    my instvar vobject vtype introProxy
    set sclass [$introProxy getClassForObject $vobject]
    if {$sclass in {::xotcl::Object ::oo::object}} {
       set sclass $vobject
    }
    IDE::MethodBrowser searchTextClass $selected $sclass $selected $introProxy
}
