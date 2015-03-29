IDEFileRepoToSqliteRepo instproc destroy {} {
    my instvar connection
    if {[info exists connection]} {
        catch {$connection destroy}
    }
    next
}
