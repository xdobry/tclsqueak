IDE::MethodCategoryView instproc changeViewType vtype {
    my instvar vclass vobjtype viewtype
    if {$vobjtype eq "Procs"} return
    set viewtype $vtype
    my selectFor $vclass $vobjtype [my getIntroProxy]
}
