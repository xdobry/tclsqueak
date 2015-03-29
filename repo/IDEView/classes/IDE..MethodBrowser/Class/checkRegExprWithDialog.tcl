IDE::MethodBrowser proc checkRegExprWithDialog text {
    if {[catch [list regexp -- $text sample] ret]} {
        global errorInfo
        IDE::Dialog message "The \"$text\" can not be compiled as regular expresion. Please mask all special characters \[\]\"\.\?().\n Original messege:\n\n$ret"
        return 0
    }
    return 1
}
