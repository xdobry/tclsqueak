IDE::DBPersistence proc queryAsList statement {
    [my getConnection] queryList $statement
}
