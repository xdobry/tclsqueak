IDE::ConfigurationMap instproc getCMapString {} {
    set script {}
    append srcipt "# Genarated from Coniguration Browser\n"
    append script "set preStartScript [list [my prescript]]\n"
    append script "set componentsToLoad [list [ide::lcollect each [my getComponents] {list [$each name] [$each set componentid]}]]\n"
    append script "set startScript [list [my prescript]]\n"
    return $script   
}
