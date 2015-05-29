IDE::EditionBrowser instproc viewObject objectEdition {
    my instvar object methodInstanceArray methodClassArray
    set object $objectEdition
    catch {unset methodInstanceArray methodClassArray}
    $object setInstanceMethodsArray methodInstanceArray
    $object setClassMethodsArray methodClassArray
    [self]::cbutton setState Instance
    my setTitleAddition " Object [$object getName] [$object set objectid]"
    my cbutton setStateAddInfo Instance [format %2i [llength [array names methodInstanceArray]]]
    my cbutton setStateAddInfo Class [format %2i [llength [array names methodClassArray]]]
    if {[llength [array names methodInstanceArray]]>0 || [llength [array names methodClassArray]]==0} {
        my cbutton setState Instance
        my changeViewType Instance
    } else {
        my cbutton setState Class
        my changeViewType Class
    }
    [self]::methodedit setText [$object getDefBody]
}
