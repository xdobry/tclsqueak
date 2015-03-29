IDE::StandardInstallation proc installComponents {} {
    my instvar connection
    set compToInstall [concat [IDE::System getCoreComponents] [IDE::System getExtraComponents]]
    IDE::DBPersistence initSchema
    IDE::User initDefault
    foreach p $compToInstall {
        package require $p
    }
    IDE::Component initFromInterpreter
    IDE::CommentsContainer parseAndCleanMeta
    IDE::CommentsContainer makeTclGroupsFromMeta
    $connection openUnitOfWork
    foreach p $compToInstall {
        update idletasks
        IDE::ComponentPersistence importComponent $p
        set cobj [IDE::Component getCompObjectForName $p]
        foreach obj [concat [$cobj getObjects] [$cobj getClasses] [$cobj getProcsGroupsObjects]] {
            set desc [$obj getDescription]
            $desc versionEdition
        }
        $cobj versionEdition
    }
    $connection closeUnitOfWork
    return 1
}
