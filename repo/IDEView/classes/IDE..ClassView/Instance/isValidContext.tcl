IDE::ClassView instproc isValidContext {} {
    expr {[my exists vcomponent] && [my set vcomponent] ne ""}
}
