IDE::SyntaxErrorView instproc forceSaving {} {
    [my editor] saveForce
    my destroy
}
