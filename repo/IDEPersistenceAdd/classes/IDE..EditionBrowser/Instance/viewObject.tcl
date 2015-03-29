IDE::EditionBrowser instproc viewObject objectEdition {
    my instvar object methodInstanceArray methodClassArray
    set object $objectEdition
    catch {unset methodInstanceArray methodClassArray}
    $object setInstanceMethodsArray methodInstanceArray
    $object setClassMethodsArray methodClassArray
    [self]::cbutton setState Instance
    my changeViewType Instance
    my setTitleAddition " Object [$object getName] [$object set objectid]"
}
