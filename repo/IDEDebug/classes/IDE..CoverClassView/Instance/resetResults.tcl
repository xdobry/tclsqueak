IDE::CoverClassView instproc resetResults {} {
    catch {IDE::MethodTracker unset methodCoverArr}
    my refreshBaseView
}
