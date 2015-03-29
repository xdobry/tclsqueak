IDE::PackageLoader instproc fillMenuStruct aMenuStruct {
    $aMenuStruct enablementHandler [self]

    $aMenuStruct addCommand {Add Package Location} [list [self] addPackageLocation]
    $aMenuStruct addCommand {Refresh} [list [self] initPackages]
}
