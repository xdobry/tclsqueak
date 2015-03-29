IDE::TParser instproc testNVariableAssign {} {
    set context [PrsFileContext new]
    my assert {[$context canAssignType string unknown]}
    my assert {[$context canAssignType string string]}
    my assert {[$context canAssignType int numeric]}
    my assert {[$context canAssignType numeric index]}
    my assert {[$context canAssignType index numeric]}
    my assert {[$context canAssignType list {list int}]}

    $context set isTclGlobalScript 0


    $context addVariable test {} {} string
    my assert {"test" in [$context getVariableNames]}
    my assert {[$context getVariableType test] eq "string"}
    lassign [$context getVariableDesc test] t s
    my assert {$t eq "string" && $s eq "local"}
    my assert {[$context checkVariableType test string]}
    my assert {![$context checkVariableType test int]}

    $context addVariable test {} {} int local 1
    my assert {[$context checkVariableType test int]}


    $context addVariable testl {} {} list
    my assert {[$context checkVariableType testl {list int}]}
    my assert {[$context getVariableType testl] eq "list int"}
    my assert {[$context checkVariableType testl {list string}]}
    my assert {[$context getVariableType testl] eq "list unknown"}

    $context addVariable testa {} {} array
    my assert {[$context checkVariableType testa {array int}]}
    my assert {[$context getVariableType testa] eq "array int"}
    my assert {[$context checkVariableType testa {array string}]}
    my assert {[$context getVariableType testa] eq "array unknown"}

    $context destroy
}
