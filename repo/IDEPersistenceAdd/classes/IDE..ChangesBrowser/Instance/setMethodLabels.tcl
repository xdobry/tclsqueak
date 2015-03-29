IDE::ChangesBrowser instproc setMethodLabels {lab1 lab2} {
    my instvar win
    $win.labelleft configure -text $lab1
    $win.labelright configure -text $lab2
   
}
