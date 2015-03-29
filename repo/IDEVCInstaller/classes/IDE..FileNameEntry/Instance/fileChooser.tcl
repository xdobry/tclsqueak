IDE::FileNameEntry instproc fileChooser {} {
   [self] setValue [IDE::Dialog getOpenFile]
}
