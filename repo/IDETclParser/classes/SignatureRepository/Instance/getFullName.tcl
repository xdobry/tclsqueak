SignatureRepository instproc getFullName {namespace name} {
    if {[string range $name 0 1] eq "::"} {
        return $name
    }
    if {$namespace eq "::"} {
        return ::$name
    }
    return "${namespace}::$name"
}
