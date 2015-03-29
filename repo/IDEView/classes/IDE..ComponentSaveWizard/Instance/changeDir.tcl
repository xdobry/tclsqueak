IDE::ComponentSaveWizard instproc changeDir {} {
    my instvar targetDir win
    set targetDir [IDE::Dialog getDir $targetDir]
    $win.tframe.target configure -text $targetDir
}
