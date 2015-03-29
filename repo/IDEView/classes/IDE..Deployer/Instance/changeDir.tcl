IDE::Deployer instproc changeDir {} {
    my set targetDir [IDE::Dialog getDir [my set targetDir]]
}
