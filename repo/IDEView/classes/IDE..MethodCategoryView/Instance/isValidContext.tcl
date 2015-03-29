IDE::MethodCategoryView instproc isValidContext {} {
    expr {[my exists vclass] && [my set vclass] ne ""}
}
