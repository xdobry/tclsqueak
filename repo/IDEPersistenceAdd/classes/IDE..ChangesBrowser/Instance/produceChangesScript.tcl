IDE::ChangesBrowser instproc produceChangesScript {} {
    if {[my mode] ne "components"} {
        IDE::Dialog infoMessage "Works only for components changes mode"
        return
    }
    my instvar comp1 comp2 
    IDE::System handleResult [my getChangesScript $comp1 $comp2]
}
