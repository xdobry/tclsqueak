IDE::TDeploying instproc testDeployToDir {} {
    set tmpdir test-deployment
    file delete -force $tmpdir
    set desc [dict create]
    dict set desc output $tmpdir
    dict set desc components [list IDECore IDEBaseGUI]
    dict set desc startScript {puts "Hallo World"}
    set deployer [IDE::Deployer createDeployerFor $desc]
    $deployer deploy $desc
    $deployer destroy
    my assert {[file isdirectory $tmpdir]}
    #file delete -force $tmpdir
}
