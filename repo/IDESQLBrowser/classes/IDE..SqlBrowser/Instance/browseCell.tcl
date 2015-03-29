IDE::SqlBrowser instproc browseCell {y x} {
    if {[Object isobject [self]::@cellWindow]} {
        my instvar win cellArr
        if {[info exists cellArr($y,$x)]} {
            set value $cellArr($y,$x)
        } else {
            set value [$win.result.table get $y,$x]
        }
        [self]::@cellWindow setTitleAddition "$y,$x"
        [self]::@cellWindow setResult $value
    }
}
