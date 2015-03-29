IDE::PackageLoader instproc loadPackageDirect {} {
    my instvar selectedPackage
    set version [lindex [my @versions selectedItem] 0]
    package require $selectedPackage $version
}
