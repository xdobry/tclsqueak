IDE::ComponentSaveWizard instproc changeDir {} {
    my instvar targetDir win
    set dir [IDE::Dialog getDir $targetDir]
    if {$dir ne ""} {
        set targetDir $dir
    }
}
