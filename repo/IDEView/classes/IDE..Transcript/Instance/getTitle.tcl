IDE::Transcript instproc getTitle {} {
    if {[self] eq "::transcript"} {
        return Transcript
    } else {
        return Workspace
    }
}
