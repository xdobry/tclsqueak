IDE::TOOIntroProxy instproc testImportOOComponent {} {
    my instvar tclass tobject tcompname
    my createSampleClass
    my createSampleObject

    set comp [IDE::Component getCompObjectForName $tcompname TclOO]
    set ip [$comp getIntroProxy]
    $ip moveToComponent $tclass $tcompname
    $ip moveToComponent $tobject $tcompname

    $ip moveToCategoryBForObject $tclass foo mycat {}
    $ip setCommentForObject $tclass "class comment"
    $ip setCommentForObject $tobject "object comment"
    $ip setMethodCommentForObject $tclass Instance foo "method foo comment"
    $ip setMethodCommentForObject $tobject Class foo "method foo comment"

    my assert {$tclass in [$comp getClasses]}
    my assert {$tobject in [$comp getObjects]}

    my assert {[$ip metadataAsScriptForObject $tclass] ne ""}
    my assert {[$ip metadataAsScriptForObject $tobject] ne ""}

    $comp saveAsScript [my getFileName]
    $comp unload

    IDE::Component importCompsFromFile [my getFileName]
    set cobj [IDE::Component getCompObjectForNameIfExist $tcompname]
    my assert {$cobj ne ""}
    my assert {[info object isa object $tclass]}
    my assert {[info object isa object $tobject]}
    my assert {$tclass in [$cobj getClasses]}
    my assert {$tobject in [$cobj getObjects]}
    my assert {[$cobj getOOType] eq "TclOO"}
    $cobj unload
}
