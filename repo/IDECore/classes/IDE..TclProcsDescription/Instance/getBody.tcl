IDE::TclProcsDescription instproc getBody {} {
    # ??? Vielleicht durch IntroProxy
    [my getCompIntroProxy] getProcBody [my set name]
}
