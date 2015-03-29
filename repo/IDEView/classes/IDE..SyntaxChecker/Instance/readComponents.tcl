IDE::SyntaxChecker instproc readComponents {} {
    [self]::components setList [[IDE::XOIntroProxy getIntroProxy] getComponents]
}
