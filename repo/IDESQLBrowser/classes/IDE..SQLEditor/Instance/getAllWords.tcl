IDE::SQLEditor instproc getAllWords {} {
    set words [list]
    if {[Object isobject [my info parent]::@tables]} {
        set words [[my info parent]::@tables getList]
    }
    if {[Object isobject [my info parent]::@columns]} {
        set words [concat $words [[my info parent]::@columns getList]]
    }
    return $words
}
