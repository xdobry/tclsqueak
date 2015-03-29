IDE::ErrorStack proc newBrowser errorInfo {
    set oldGrab [::grab current]
    if {$oldGrab ne ""} {
        foreach w $oldGrab {
           ::grab release $w
        }
    }
    set inst [my new [Object autoname .errorstack]]
    $inst parseErrorInfo $errorInfo
    $inst showErrorInfo
    return $inst
}
