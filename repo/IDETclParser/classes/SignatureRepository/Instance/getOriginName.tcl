SignatureRepository instproc getOriginName {name namespace} {
    my instvar namespaceImport
    if {![catch {set namespaceImport($namespace)} importList]} {
        foreach n $importList {
            if {[namespace tail $n] eq $name} {
                return $n
            }
        }
    }
    if {![catch {set namespaceImport()} importList]} {
        foreach n $importList {
            if {[namespace tail $n] eq $name} {
                return $n
            }
        }
    }
    return
}
