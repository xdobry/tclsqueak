IDE::TCore instproc testBName {} {
    my instvar obj
    if {[$obj getName] ne "TestCase"} { error {wrong name}}
}
