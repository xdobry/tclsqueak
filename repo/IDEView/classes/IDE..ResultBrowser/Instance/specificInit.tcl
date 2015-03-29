IDE::ResultBrowser instproc specificInit {} {
    my instvar win result
    IDE::Editor create [self]::resulttext $win.resulttext

    grid $win.resulttext -row 0 -column 0 -sticky news

    grid columnconfigure $win 0 -weight 1
    grid rowconfigure $win 0 -weight 1

    my setResult [my result]
    next
}
