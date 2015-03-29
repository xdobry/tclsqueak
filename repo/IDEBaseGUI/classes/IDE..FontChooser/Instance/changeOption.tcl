IDE::FontChooser instproc changeOption type {
    font configure fontchooser -$type [my set $type]
}
