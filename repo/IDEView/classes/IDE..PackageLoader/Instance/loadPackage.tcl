IDE::PackageLoader instproc loadPackage {} {
    my instvar selectedPackage
    set version [lindex [my @versions selectedItem] 0]
    IDE::Component loadPackage $selectedPackage $version
}
