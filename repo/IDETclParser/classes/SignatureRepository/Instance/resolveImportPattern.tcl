SignatureRepository instproc resolveImportPattern imp {
    my instvar namespaceExport
    set realImport [list]
    if {[string range $imp 0 1] ne "::"} {
        set imp ::$imp
    }
    set impNamespace [namespace qualifiers $imp]
    set part [namespace tail $imp]
    if {$impNamespace eq ""} return
    if {![catch {set namespaceExport($impNamespace)} exportList]} {
        foreach exp $exportList {
            if {[string match $part $exp]} {
                lappend realImport [my getFullName $impNamespace $exp]
            }
        }
    }
    return $realImport
}
