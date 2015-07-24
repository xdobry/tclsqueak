IDE::TDeploying instproc testDeployToWinExecutable {} {
    my assert {[my hasMk4Tcl]} "can not test because no Mk4Tcl package avaiable to build tclkit"
    set tclkitext tclkit-8.6.3-win32-ix86.exe
    my assert {[file exists $tclkitext]} "no file $tclkitext found"

    set output test-deployment.exe
    file delete -force $output
    set desc [dict create]
    dict set desc output $output
    dict set desc startScript {IDE::Dialog message "Hallo World"; exit 0}
    dict set desc components [list IDECore IDEBaseGUI]
    dict set desc kitexe $tclkitext
    dict set desc type win
    set deployer [IDE::Deployer createDeployerFor $desc]
    $deployer deploy $desc
    $deployer destroy
    my assert {[file isfile $output]}
}
