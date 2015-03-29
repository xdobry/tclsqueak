IDE::TCore instproc testZZDestroy {} {
    my instvar obj mcobj
    $obj unload
    $mcobj unload
    my testAAPreCreate
}
