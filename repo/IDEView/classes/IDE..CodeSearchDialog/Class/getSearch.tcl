IDE::CodeSearchDialog proc getSearch {viewMaster text {context {}}} {
    set idialog [IDE::CodeSearchDialog new -context $context]
    if {$text ne ""} {
        $idialog set text $text
    }
    set search {}
    if {[$idialog prompt] eq "ok"} {
        set search [$idialog set search]
    }
    $idialog destroy
    return $search
}
