IDE::TDeploying instproc testDeployToKit {} {
    my assert {[my hasMk4Tcl]} "can not test because no Mk4Tcl package avaiable to build tclkit"
    
    set output test-deployment.kit
    file delete -force $output
    set desc [dict create]
    dict set desc output $output
    dict set desc startScript {IDE::Dialog message "Hallo World"; exit 0}
    dict set desc components [list IDECore IDEBaseGUI]
    dict set desc type kit
    set deployer [IDE::Deployer createDeployerFor $desc]
    $deployer deploy $desc
    $deployer destroy
    my assert {[file isfile $output]}
}
