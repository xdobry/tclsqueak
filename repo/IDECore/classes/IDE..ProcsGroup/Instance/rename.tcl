IDE::ProcsGroup instproc rename name {
    if {[my withNamespace]} {
        error "Can not rename proc group with Namespace"
    }
    my name $name
}
