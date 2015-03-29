IDE::ConfigmapBrowser instproc specificInit {} {
    my instvar win
    IDE::ListViewEvent [self]::names $win.names -label Configuration
    IDE::ListViewEvent [self]::versions $win.versions -label {Conf. Version}
    IDE::ListViewEvent [self]::components $win.components -label Components
    IDE::ListViewEvent [self]::cmaps $win.cmaps -label {Dependent Confs.}
    IDE::MethodEdit [self]::text $win.text -height 14 -width 50
    IDE::StateButton [self]::cbutton $win.cbutton  -states {Comment preStartScript startScript} -command [list [self] changeViewType]
        
    grid $win.names -row 0 -column 0 -rowspan 4 -sticky ns
    grid $win.versions -row 0 -column 1 -sticky ew
    grid $win.components -row 0 -column 2 -rowspan 2 -sticky news
    grid $win.cmaps -row 1 -column 1 -sticky news
    grid $win.text -row 2 -column 1 -columnspan 2 -sticky news
    grid $win.cbutton -row 3 -column 1 -sticky w
    grid columnconfigure $win 1 -weight 1
    grid columnconfigure $win 2 -weight 2
    grid rowconfigure $win 1 -weight 1
    grid rowconfigure $win 2 -weight 1
}
