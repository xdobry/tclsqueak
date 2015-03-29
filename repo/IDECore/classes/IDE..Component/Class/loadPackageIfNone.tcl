IDE::Component proc loadPackageIfNone package {
    set cobj [my getCompObjectForNameIfExist $package]
    if {$cobj eq ""} {
        my loadPackage $package
    } else {
        IDE::Transcript warning "package $package is already loaded"
    }
}
