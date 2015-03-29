IDE::CoverClassView instproc fillMenuStruct ms {
    $ms addCommand2 {Add Class} [list [self] addClass]
    $ms addCommand2 {Remove Class} [list [self] removeClassObject] isValidSelection
    $ms addCommand2 {Refresh View} [list [self] refreshBaseView]
    $ms addCommand2 {Reset Results} [list [self] resetResults]
    $ms addCheckButton {Checking Covering} IDE::MethodTracker::callingCover {}
    $ms addCheckButton {Protokol to stdout} IDE::MethodTracker::stoutProtokoll {}
}
