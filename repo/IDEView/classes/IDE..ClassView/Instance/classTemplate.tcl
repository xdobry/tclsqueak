IDE::ClassView instproc classTemplate {} {
    my unselect
    [my info parent]::methodedit setTextControler {Class YourClass -superclass YourSuperClass} [self]
}
