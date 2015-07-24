IDE::DeployerUI instproc actionGenerate {} {
    my updateComponents
    if {![my isDataValid]} {
        return
    }

    set desc [my getDeploymentDescription]
    set deployer [IDE::Deployer createDeployerFor $desc]
    $deployer deploy $desc
    $deployer destroy

    my storeSetting
    IDE::Dialog message "deployment sucessfully created to [dict get $desc output]"
    # TODO ofer user the browser and lunch functionality here
    my destroy
}
