IDE::Transcript instproc getTitle {} {
    if {[my isTranscript]} {
        return Transcript
    } else {
        return "Script Editor"
    }
}
