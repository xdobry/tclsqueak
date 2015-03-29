IDE::TSignatureRepo instproc testDAnamespaces {} {
    my instvar repo

    $repo registerProc nfoo {1 2} ::myns
    $repo registerProc nbar {1 2} ::myns
    $repo registerProc nfoo3 {1 2} ::myns

    $repo addNamespaceExport ::myns {nfoo nbar nfoo3}

    my assert {[$repo getCommandDescription nfoo] eq ""}
    my assert {[$repo getCommandDescription nfoo ::myns] ne ""}

    $repo addNamespaceImport {} myns::nf*

    my assert {[$repo getCommandDescription nfoo] ne ""}
    my assert {[$repo getCommandDescription nfoo3] ne ""}
    my assert {[$repo getCommandDescription nbar] eq ""}

    $repo addNamespaceImport ::myns2 myns::nbar
    my assert {[$repo getCommandDescription nbar ::myns2] ne ""}

}
