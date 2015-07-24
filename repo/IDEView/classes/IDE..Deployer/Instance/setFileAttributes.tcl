IDE::Deployer instproc setFileAttributes {} {
    my instvar targetDir configName
    if {![IDE::System isWindowsPlatform]} {
        file attributes [file join $targetDir $configName] -permission rwxr--r--
    }
}
