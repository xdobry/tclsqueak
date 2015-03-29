PrsContext instproc joinNamespace childNamespace {
    my instvar namespace
    if {[string range $childNamespace 0 1] eq "::"} {
        return $childNamespace
    }
    return "${namespace}::[string trimright $childNamespace :]"
}
