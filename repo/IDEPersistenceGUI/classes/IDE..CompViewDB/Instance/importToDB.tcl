IDE::CompViewDB instproc importToDB actual {
    set cobj [IDE::Component getCompObjectForName $actual]
    if {![$cobj isPersistent]} {
        IDE::ComponentPersistence importComponent $actual
        IDE::System refreshComponentView $actual
    }
}
