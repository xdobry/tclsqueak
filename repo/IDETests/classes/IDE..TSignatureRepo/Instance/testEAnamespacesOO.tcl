IDE::TSignatureRepo instproc testEAnamespacesOO {} {
    my instvar repo

    $repo registerObject MyClassNS Class {} {} ::oons
    $repo registerMethod MyClassNS instproc foo {1 1} ::oons

    my assert {[$repo isXotclObject MyClassNS ::oons]}
    my assert {[$repo isXotclClass MyClassNS ::oons]}
    my assert {[$repo getMethodDescriptionForClasses MyClassNS foo ::oons] ne ""}


    $repo registerObject ExpClassNS Class {} {} ::oons
    $repo registerMethod ExpClassNS instproc foo {1 1} ::oons

    $repo addNamespaceExport ::oons {ExpClassNS}

    $repo addNamespaceImport ::yoons oons::*

    my assert {[$repo isXotclObject ExpClassNS ::yoons]}
    my assert {[$repo getMethodDescriptionForClasses ExpClassNS foo ::yoons] ne ""}

}
