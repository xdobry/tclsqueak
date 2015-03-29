proc repobs::initPackageLoader repo {
    variable repodir
    set repodir $repo
    package unknown [list repobs::packageUnknownHandler [package unknown]]
}
