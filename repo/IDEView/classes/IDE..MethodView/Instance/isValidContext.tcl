IDE::MethodView instproc isValidContext {} {
    expr {[my exists vclass] && [my set vclass] ne ""}
}
