PrsFileContext instproc logMessage {message {line {}}} {
    my instvar fileName logStream parseMode
    if {$parseMode eq "report"} {
        if {$fileName eq ""} {
            puts $logStream $message
        } elseif {$line ne ""} {
            puts $logStream "${fileName}:${line}: $message"
        } else {
            puts $logStream "${fileName}: $message"
        }
    }
}
