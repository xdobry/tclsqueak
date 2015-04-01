ORATcl instproc getSequence sequenzer {
    lindex [lindex [my queryList "select $sequenzer.nextval from dual"] 0] 0
}
