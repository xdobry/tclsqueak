IDE::CodeSearchDialog instproc checkOk {} {
    my instvar text searchType win
    if {$text eq ""} {
        IDE::Dialog error "enter search text"
        focus $win.text
        return 0
    }
    if {$searchType eq "regexp" && [catch {regexp -- $text {muster}}]} {
        IDE::Dialog error "regular expresion is not valid"
        focus $win.text
        return 0
    }
    return 1
}
