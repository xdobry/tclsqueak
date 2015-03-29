IDE::ComponentPersistence instproc rename newname {
    my instvar componentid
    # we can not use updateAttributes because of object move
    [my getConnection] execute "UPDATE Component SET name='$newname' WHERE componentid=$componentid"
    next
}
