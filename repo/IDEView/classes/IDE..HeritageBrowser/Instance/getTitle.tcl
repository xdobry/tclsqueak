IDE::HeritageBrowser instproc getTitle {} {
    my instvar vtype
    if {$vtype eq "heritage"} {
        return {Heritage Browser}
    } else {
        return {Children Browser}
    }
}
