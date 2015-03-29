IDE::ClassView instproc setEditText text {
    [my info parent]::methodedit setTextControler $text [self]
    [my info parent]::methodedit ignoreNoChanges
}
