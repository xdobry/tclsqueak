IDE::TPersistence instproc testIAloadComponent {} {
    my instvar compObj compId
    IDE::ComponentPersistence loadVersionId $compId
    my assert {[Object isobject TestA]} 
    my assert {[Object isobject TestB]}
    my assert {[Object isobject TestC]}
    my assert {[Object isobject TestD]}
    my assert {![Object isobject TestE]}
    set compObj [IDE::Component getCompObjectForNameIfExist TestCase]
    my assert {$compObj ne ""}
    my assert {[$compObj set componentid]==$compId}
    my testGBquestVersion
    $compObj setObjectsArray objArr
    my assert {[llength [array names objArr]]==6}
}
