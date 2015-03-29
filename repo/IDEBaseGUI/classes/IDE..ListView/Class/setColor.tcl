IDE::ListView proc setColor color {
    foreach c [[IDE::XOIntroProxy getIntroProxy] getSubclassesDeep [self]] {
        foreach i [$c info instances] {
            $i setColor $color
        }
    }
}
