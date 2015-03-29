IDE::Component proc loadCompFromFile file {
    namespace eval :: source [list $file]
}
