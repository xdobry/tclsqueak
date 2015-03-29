IDE::TSignatureRepo instproc testCAvariables {} {
    my instvar repo

    $repo registerVariable {} global myvar {} int
    my assert {[$repo getVariableType {} global myvar] eq "int"}
    my assert {[$repo getVariableType {} global myvar ::myns] eq "int"}

    $repo registerVariable {} global mynsvar ::myns int
    my assert {[$repo getVariableType {} global mynsvar ::myns] eq "int"}

}
