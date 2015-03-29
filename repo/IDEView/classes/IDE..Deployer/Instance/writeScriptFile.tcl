IDE::Deployer instproc writeScriptFile {name value} {
    set f [open $name w]
    puts -nonewline $f $value
    close $f
}
