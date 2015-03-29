IDE::ChangesBrowser instproc setCompareLabels {lab1 lab2} {
    my instvar win
    $win.titleleft configure -text $lab1
    $win.titleright configure -text $lab2
   
}
