IDE::Deployer proc createDeployerFor desc {
    if {[dict exists $desc type] && [dict get $desc type] in {kit win linux}} {
        IDE::SystemConfigMap loadComponentFromAny IDEKitDeployer
        IDE::TclKitDeployer new  
    } else {
        IDE::Deployer new
    }
}
