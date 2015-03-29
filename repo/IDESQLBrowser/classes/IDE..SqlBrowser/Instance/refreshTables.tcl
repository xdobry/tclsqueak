IDE::SqlBrowser instproc refreshTables {} {
    my instvar dbConnection
    [self]::@tables setList [$dbConnection getTables]
}
