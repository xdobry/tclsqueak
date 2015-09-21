IDE::GuiClassTemplate instproc destroy {} {
    my instvar root
    if {[info exists root]} {
       ::destroy $root
    }
    %%if {[dict get $desc ooSystemType] eq "XOTcl"} {next} {}%%
}
