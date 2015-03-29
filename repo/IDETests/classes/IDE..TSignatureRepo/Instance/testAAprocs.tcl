IDE::TSignatureRepo instproc testAAprocs {} {
    my instvar repo
    $repo registerProc foo {1 2}
    my assert {[$repo getCommandDescription foo] ne ""}
    my assert {[$repo getCommandDescription ::foo] ne ""}

    $repo registerProc foo2 {1 2} ::myns
    my assert {[$repo getCommandDescription foo2 ::myns] ne ""}

    $repo registerProc ::foo3 {1 2} ::myns

    my assert {[$repo getCommandDescription foo3 ::myns] ne ""}
    my assert {[$repo getCommandDescription ::foo3 ::myns] ne ""}
    my assert {[$repo getCommandDescription foo3] ne ""}
    my assert {[$repo getCommandDescription ::foo3] ne ""}

}
