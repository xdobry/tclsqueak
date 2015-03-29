IDE::MethodCategoryView instproc selectItem cat {
    my instvar vclass viewtype
    if {[Object isobject [my info parent]::methodview]} {
        # remove trailing count of items if exists
        regexp {(.+) \([0-9]+\)} $cat _ cat
        [my info parent]::methodview selectFor $vclass [list $cat] $viewtype [my getIntroProxy]
    }
}
