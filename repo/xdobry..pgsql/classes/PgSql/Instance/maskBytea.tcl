PgSql instproc maskBytea value {
    binary scan $value c* bytes
    set ret '
    foreach byte $bytes {
        append ret {\\}
        append ret [format %03o [expr {($byte + 0x100 ) % 0x100}]]
    }
    append ret '
    return $ret
}
