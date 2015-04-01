ORATcl instproc getTables {} {
    my queryList {select TABLE_NAME from USER_TABLES}
}
