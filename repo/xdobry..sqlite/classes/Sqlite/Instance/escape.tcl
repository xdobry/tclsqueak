Sqlite instproc escape string {
    string map [list \0 \\0 ' '' ] $string
}
