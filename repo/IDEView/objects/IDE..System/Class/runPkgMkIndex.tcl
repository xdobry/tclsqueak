IDE::System proc runPkgMkIndex {} {
    pkg_mkIndex -direct [pwd] *.xotcl
    IDE::Dialog message "command \"pkg_mkIndow -direct [pwd] *.xotcl\" succesful finished"
}
