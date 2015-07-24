IDE::CompView instproc deployAs type {
    set comps [my selectedItem]
    if {$type in {kit executable}} {
        if {[catch {package require vfs::mk4}]} {
            IDE::Dialog error "can not load the vfs::mk4 package which is needed to generate tclkit packages. Please install it on your tcl system or use tclsqueak binary release."
            return
        }
    }
    if {$type eq "executalbe"} {
        if {[IDE::System isWindowsPlatform]} {
            set type win
        } else {
            set type linux
        }
    }
    IDE::DeployerUI newBrowser $type $comps
}
