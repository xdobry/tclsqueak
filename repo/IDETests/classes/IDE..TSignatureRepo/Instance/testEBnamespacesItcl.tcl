IDE::TSignatureRepo instproc testEBnamespacesItcl {} {
    my instvar repo

    $repo loadRepoForPackage Itcl
    $repo addNamespaceImport ::mitcl itcl::*


    my assert {[$repo getCommandDescription class ::mitcl] ne ""}


}
