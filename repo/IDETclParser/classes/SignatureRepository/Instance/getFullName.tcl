SignatureRepository instproc getFullName {namespace name} {
    if {[string range $name 0 1] eq "::"} {
        return $name
    }
    return "${namespace}::$name"
}
