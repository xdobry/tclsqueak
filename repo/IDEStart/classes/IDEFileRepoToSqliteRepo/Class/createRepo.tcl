IDEFileRepoToSqliteRepo proc createRepo {} {
    set creator [IDEFileRepoToSqliteRepo new]
    set repo newrepo2.sqlite
    file delete $repo
    $creator createRepo repo $repo
    return $creator
}
