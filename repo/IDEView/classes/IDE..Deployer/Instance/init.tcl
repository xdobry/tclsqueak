IDE::Deployer instproc init {} {
    my instvar mode targetDir configName nometa onefile nopackages isXOTclcode

    set targetDir [pwd]
    set nometa 1
    set onefile 0
    set nopackages 0
    set isXOTclcode 0
    set configName Start.tcl
}
