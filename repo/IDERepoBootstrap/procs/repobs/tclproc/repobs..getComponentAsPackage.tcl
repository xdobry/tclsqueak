proc repobs::getComponentAsPackage {compName dir {withComments 0}} {
    set source ""
    set compDir [file join $dir [asFileName $compName]]
    foreach r [getRequirementsForComponent $compName $dir] {
        append source "package require $r\n"
    }
    set versionInfo [file join $compDir version.info]
    if {[file exists $versionInfo]} {
        set version [string trim [readFile $versionInfo]]
        append source "package provide $compName $version\n"
    } else {
        append source "package provide $compName\n"
    }
    append source [getComponent $compName $dir $withComments]
    return $source
}
