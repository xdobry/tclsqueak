IDE::Deployer instproc setFileAttributes {} {
    my instvar configName
    if {![IDE::System isWindowsPlatform]} {
        file attributes $configName -permission rwxr--r--
    }
}
