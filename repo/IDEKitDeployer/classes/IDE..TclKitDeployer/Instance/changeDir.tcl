IDE::TclKitDeployer instproc changeDir {} {
    my instvar targetDir win
    set targetDir [IDE::Dialog getSaveFile $targetDir]
}
