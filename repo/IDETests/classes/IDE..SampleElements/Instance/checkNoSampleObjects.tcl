IDE::SampleElements instproc checkNoSampleObjects {} {
    my assert {![Object isobject TestA]}
    my assert {![Object isobject TestB]}
    my assert {![Object isobject TestC]}
}
