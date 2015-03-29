PrsFileContext instproc loadPackagesFromFilesExtensions files {
    my instvar repository
    set extensions [list]
    foreach f $files {
        lappend extensions [file extension $f]
    }
    if {".xotcl" in $extensions} {
        $repository loadRepoForPackage XOTcl
    }
    if {".itcl" in $extensions || ".itk" in $extensions } {
        $repository loadRepoForPackage Itcl
    }
}
