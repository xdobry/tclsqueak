IDE::FindReplace proc actionSetDefaults {} {
    my instvar caseSensitive backwards fromCursor selectedText regularExpresion prompt replaceAll
    set cur 1.0
    set caseSensitive 1
    set backwards 0
    set fromCursor 0
    set selectedText 0
    set regularExpresion 0
    set replaceAll 0
    set prompt 1
}
