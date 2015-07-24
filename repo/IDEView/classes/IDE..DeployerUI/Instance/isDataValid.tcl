IDE::DeployerUI instproc isDataValid {} {
    my instvar type output components kitexe
    if {[llength $components]==0} {
        IDE::Dialog error "select components to deploy"
        return 0
    }
    if {$output eq ""} {
        IDE::Dialog error "set output for deployment"
        return 0
    }
    if {[my isOutputDirectory] && [file isfile $output]} {
        IDE::Dialog error "expect output as directory but the file $output already exists"
        return 0
    }
    if {![my isOutputDirectory] && [file isdirectory $output]} {
        IDE::Dialog error "expect output as file but the directory $output already exists"
        return 0
    }
    if {[file exists $output]} {
        if {![IDE::Dialog yesNo "deployment to: '$output' already exists should be overwritten?"]} {
            return 0
        }
    }
    if {$type eq "exe"} {
        if {$kitexe eq ""} {
            IDE::Dialog error "you need to specificy tclkit executable needed to create executable deployment"
            return 0
        }
        if {![file readable $kitexe]} {
            IDE::Dialog error "can not read tclkit executable needed to create executable deployment"
            return 0
        }
    }
    return 1
}
