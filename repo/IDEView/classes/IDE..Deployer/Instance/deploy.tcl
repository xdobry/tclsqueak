IDE::Deployer instproc deploy pdesc {
    my instvar desc targetDir
    set desc $pdesc
    if {![dict exists $desc components]} {
        error "components not found"
    }
    if {![dict exists $desc output]} {
        error "output not found"
    }
    set targetDir [dict get $desc output]
    my checkComponentRequirements
    my actionGenerate
}
