IDE::DBPersistence instproc makeTransient {} {
    set desc [my getDescriptor]
    set id [my set [$desc idColumn]]
    my sqlexecute  "Delete from [$desc table] where [$desc idColumn]=$id"
}
