IDE::ProcsGroup instproc createProcForName name {
    #[self] halt
    IDE::TclProcsDescription new -childof [self] -name $name
}
