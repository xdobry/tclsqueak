IDE::DeployerUI instproc browseOutput {} {
    my instvar output
    if {[my isOutputDirectory]} {
        set newoutput [IDE::Dialog getDir $output]
    } else {
        set newoutput [IDE::Dialog getSaveFile $output]
    }
    if {$newoutput ne ""}  {
        set output $newoutput
    }
}
