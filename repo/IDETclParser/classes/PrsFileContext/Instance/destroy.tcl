PrsFileContext instproc destroy {} {
    my instvar repository
    catch {$repository destroy}
    next
}
