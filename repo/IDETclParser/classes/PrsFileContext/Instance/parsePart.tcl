PrsFileContext instproc parsePart script {
    my instvar lineStart repository
    # comment or empty
    set trimmed [string trim $script]
    if {$trimmed eq "" || [string index $trimmed 0] eq "#"} {
        my handleGlobalComment $script
        return
    }
    my parsePartGlobal $script
}
