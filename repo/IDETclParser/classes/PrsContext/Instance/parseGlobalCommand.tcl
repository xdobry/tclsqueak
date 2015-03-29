PrsContext instproc parseGlobalCommand command {
    my instvar parser stream isTclGlobalScript rootCommand
    set isTclGlobalScript 1
    set rootCommand $command
    $rootCommand evalContents
    $rootCommand visit [self]
}
