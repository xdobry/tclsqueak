IDE::CompView instproc showComponents {} {
    my setList [[IDE::XOIntroProxy getIntroProxy] getUserRelevantComponents]
}
