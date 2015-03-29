IDE::DBPersistence instproc sqlexecute statement {
    [my getConnection] execute $statement
}
