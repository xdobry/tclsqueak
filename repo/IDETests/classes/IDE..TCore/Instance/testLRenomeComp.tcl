IDE::TCore instproc testLRenomeComp {} {
    my instvar obj
    $obj rename TestCaseN
    my assert {[$obj getName] eq "TestCaseN"}
    my assert {[IDE::Component getCompObjectForNameIfExist TestCase] eq ""}
    my assert {[IDE::Component getCompObjectForNameIfExist TestCaseN] eq $obj}
}
