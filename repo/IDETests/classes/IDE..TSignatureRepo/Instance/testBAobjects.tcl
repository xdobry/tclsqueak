IDE::TSignatureRepo instproc testBAobjects {} {
    my instvar repo

    $repo registerObject MyClass Class {} {}
    $repo registerMethod MyClass instproc foo {1 1}
    $repo registerObject DClass Class {MyClass} {}

    my assert {[$repo isXotclObject MyClass]}
    my assert {[$repo isXotclClass MyClass]}
    my assert {![$repo isXotclObject NoClass]}
    my assert {![$repo isXotclClass NoClass]}
    my assert {[$repo getMethodDescriptionForClasses MyClass foo] ne ""}
    my assert {[$repo getMethodDescriptionForClasses DClass foo] ne ""}

    my assert {[$repo getMethodDescriptionForClasses NoClass foo] eq ""}
    my assert {[$repo getMethodDescriptionForClasses MyClass unfoo] eq ""}

}
