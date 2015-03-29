CoreSignatureRepository instproc registerTTkProcs {} {
    my instvar commandsArr xotclObjectsArr methodsArr


array set commandsArr {
::ttk::style {{{unknown docu} {unknown element} {unknown create} {unknown name} {unknown vsapi} {unknown className} {unknown partId} {unknown ?stateMap?} {unknown ?options?}}}

::ttk::button {{{{tk ::ttk::Button}} {{new tk ::ttk::Button} ttk::button} {? {option -takefocus boolean -command script -default unknown -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::checkbutton {{{{tk ::ttk::Checkbutton}} {{new tk ::ttk::Checkbutton} ttk::checkbutton} {? {option -takefocus boolean -variable unknown -onvalue unknown -offvalue unknown -command script -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::combobox {{{{tk ::ttk::Combobox}} {{new tk ::ttk::Combobox} ttk::combobox} {? {option -height unknown -postcommand unknown -values unknown -takefocus boolean -exportselection boolean -font string -invalidcommand unknown -justify {enum left center right} -show unknown -state unknown -textvariable {setgref string} -validate unknown -validatecommand unknown -width unknown -xscrollcommand script -foreground color -background color -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::entry {{{{tk ::ttk::Entry}} {{new tk ::ttk::Entry} ttk::entry} {? {option -takefocus boolean -exportselection boolean -font string -invalidcommand unknown -justify {enum left center right} -show unknown -state unknown -textvariable {setgref string} -validate unknown -validatecommand unknown -width unknown -xscrollcommand script -foreground color -background color -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::frame {{{{tk ::ttk::Frame}} {{new tk ::ttk::Frame} ttk::frame} {? {option -borderwidth pixel -padding unknown -relief {enum raised sunken flat ridge solid groove} -width unknown -height unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::label {{{{tk ::ttk::Label}} {{new tk ::ttk::Label} ttk::label} {? {option -background color -foreground color -font string -borderwidth pixel -relief {enum raised sunken flat ridge solid groove} -anchor {enum n ne e se s sw w nw center} -justify {enum left center right} -wraplength int -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::labelframe {{{{tk ::ttk::Labelframe}} {{new tk ::ttk::Labelframe} ttk::labelframe} {? {option -labelanchor unknown -text string -underline int -labelwidget unknown -borderwidth pixel -padding unknown -relief {enum raised sunken flat ridge solid groove} -width unknown -height unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::menubutton {{{{tk ::ttk::Menubutton}} {{new tk ::ttk::Menubutton} ttk::menubutton} {? {option -takefocus boolean -menu unknown -direction unknown -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::notebook {{{{tk ::ttk::Notebook}} {{new tk ::ttk::Notebook} ttk::notebook} {? {option -takefocus boolean -width unknown -height unknown -padding unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::panedwindow {{{{tk ::ttk::Panedwindow}} {{new tk ::ttk::Panedwindow} ttk::panedwindow} {? {option -orient {enum horizontal vertical} -width unknown -height unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::progressbar {{{{tk ::ttk::Progressbar}} {{new tk ::ttk::Progressbar} ttk::progressbar} {? {option -orient {enum horizontal vertical} -length unknown -mode unknown -maximum unknown -variable unknown -value unknown -phase unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::radiobutton {{{{tk ::ttk::Radiobutton}} {{new tk ::ttk::Radiobutton} ttk::radiobutton} {? {option -takefocus boolean -variable unknown -value unknown -command script -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::scale {{{{tk ::ttk::Scale}} {{new tk ::ttk::Scale} ttk::scale} {? {option -takefocus boolean -command script -variable unknown -orient {enum horizontal vertical} -from unknown -to unknown -value unknown -length unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::scrollbar {{{{tk ::ttk::Scrollbar}} {{new tk ::ttk::Scrollbar} ttk::scrollbar} {? {option -command script -orient {enum horizontal vertical} -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::separator {{{{tk ::ttk::Separator}} {{new tk ::ttk::Separator} ttk::separator} {? {option -orient {enum horizontal vertical} -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::sizegrip {{{{tk ::ttk::Sizegrip}} {{new tk ::ttk::Sizegrip} ttk::sizegrip} {? {option -takefocus boolean -cursor unknown -style unknown -class unknown}}}}
::ttk::treeview {{{{tk ::ttk::Treeview}} {{new tk ::ttk::Treeview} ttk::treeview} {? {option -takefocus boolean -columns unknown -displaycolumns unknown -show unknown -selectmode unknown -height unknown -padding unknown -xscrollcommand script -yscrollcommand script -takefocus boolean -cursor unknown -style unknown -class unknown}}}}

}
array set methodsArr {
{::ttk::Button instproc cget} {{unknown {{enum -takefocus -command -default -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Button instproc configure} {list {void {{option -takefocus boolean -command script -default unknown -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -takefocus -command -default -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Button instproc identify} {0 -1}
{::ttk::Button instproc instate} {0 -1}
{::ttk::Button instproc invoke} {0 -1}
{::ttk::Button instproc state} {0 -1}
{::ttk::Checkbutton instproc cget} {{unknown {{enum -takefocus -variable -onvalue -offvalue -command -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Checkbutton instproc configure} {list {void {{option -takefocus boolean -variable unknown -onvalue unknown -offvalue unknown -command script -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -takefocus -variable -onvalue -offvalue -command -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Checkbutton instproc identify} {0 -1}
{::ttk::Checkbutton instproc instate} {0 -1}
{::ttk::Checkbutton instproc invoke} {0 -1}
{::ttk::Checkbutton instproc state} {0 -1}
{::ttk::Combobox instproc bbox} {0 -1}
{::ttk::Combobox instproc cget} {{unknown {{enum -height -postcommand -values -takefocus -exportselection -font -invalidcommand -justify -show -state -textvariable -validate -validatecommand -width -xscrollcommand -foreground -background -takefocus -cursor -style -class}}}}
{::ttk::Combobox instproc configure} {list {void {{option -height unknown -postcommand unknown -values unknown -takefocus boolean -exportselection boolean -font string -invalidcommand unknown -justify {enum left center right} -show unknown -state unknown -textvariable {setgref string} -validate unknown -validatecommand unknown -width unknown -xscrollcommand script -foreground color -background color -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -height -postcommand -values -takefocus -exportselection -font -invalidcommand -justify -show -state -textvariable -validate -validatecommand -width -xscrollcommand -foreground -background -takefocus -cursor -style -class}}}}
{::ttk::Combobox instproc current} {0 -1}
{::ttk::Combobox instproc delete} {0 -1}
{::ttk::Combobox instproc get} {0 -1}
{::ttk::Combobox instproc icursor} {0 -1}
{::ttk::Combobox instproc identify} {0 -1}
{::ttk::Combobox instproc index} {0 -1}
{::ttk::Combobox instproc insert} {0 -1}
{::ttk::Combobox instproc instate} {0 -1}
{::ttk::Combobox instproc selection} {0 -1}
{::ttk::Combobox instproc set} {0 -1}
{::ttk::Combobox instproc state} {0 -1}
{::ttk::Combobox instproc xview} {0 -1}
{::ttk::Entry instproc bbox} {0 -1}
{::ttk::Entry instproc cget} {{unknown {{enum -takefocus -exportselection -font -invalidcommand -justify -show -state -textvariable -validate -validatecommand -width -xscrollcommand -foreground -background -takefocus -cursor -style -class}}}}
{::ttk::Entry instproc configure} {list {void {{option -takefocus boolean -exportselection boolean -font string -invalidcommand unknown -justify {enum left center right} -show unknown -state unknown -textvariable {setgref string} -validate unknown -validatecommand unknown -width unknown -xscrollcommand script -foreground color -background color -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -takefocus -exportselection -font -invalidcommand -justify -show -state -textvariable -validate -validatecommand -width -xscrollcommand -foreground -background -takefocus -cursor -style -class}}}}
{::ttk::Entry instproc delete} {0 -1}
{::ttk::Entry instproc get} {0 -1}
{::ttk::Entry instproc icursor} {0 -1}
{::ttk::Entry instproc identify} {0 -1}
{::ttk::Entry instproc index} {0 -1}
{::ttk::Entry instproc insert} {0 -1}
{::ttk::Entry instproc instate} {0 -1}
{::ttk::Entry instproc selection} {0 -1}
{::ttk::Entry instproc state} {0 -1}
{::ttk::Entry instproc validate} {0 -1}
{::ttk::Entry instproc xview} {0 -1}
{::ttk::Frame instproc cget} {{unknown {{enum -borderwidth -padding -relief -width -height -takefocus -cursor -style -class}}}}
{::ttk::Frame instproc configure} {list {void {{option -borderwidth pixel -padding unknown -relief {enum raised sunken flat ridge solid groove} -width unknown -height unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -borderwidth -padding -relief -width -height -takefocus -cursor -style -class}}}}
{::ttk::Frame instproc identify} {0 -1}
{::ttk::Frame instproc instate} {0 -1}
{::ttk::Frame instproc state} {0 -1}
{::ttk::Label instproc cget} {{unknown {{enum -background -foreground -font -borderwidth -relief -anchor -justify -wraplength -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Label instproc configure} {list {void {{option -background color -foreground color -font string -borderwidth pixel -relief {enum raised sunken flat ridge solid groove} -anchor {enum n ne e se s sw w nw center} -justify {enum left center right} -wraplength int -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -background -foreground -font -borderwidth -relief -anchor -justify -wraplength -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Label instproc identify} {0 -1}
{::ttk::Label instproc instate} {0 -1}
{::ttk::Label instproc state} {0 -1}
{::ttk::Labelframe instproc cget} {{unknown {{enum -labelanchor -text -underline -labelwidget -borderwidth -padding -relief -width -height -takefocus -cursor -style -class}}}}
{::ttk::Labelframe instproc configure} {list {void {{option -labelanchor unknown -text string -underline int -labelwidget unknown -borderwidth pixel -padding unknown -relief {enum raised sunken flat ridge solid groove} -width unknown -height unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -labelanchor -text -underline -labelwidget -borderwidth -padding -relief -width -height -takefocus -cursor -style -class}}}}
{::ttk::Labelframe instproc identify} {0 -1}
{::ttk::Labelframe instproc instate} {0 -1}
{::ttk::Labelframe instproc state} {0 -1}
{::ttk::Menubutton instproc cget} {{unknown {{enum -takefocus -menu -direction -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Menubutton instproc configure} {list {void {{option -takefocus boolean -menu unknown -direction unknown -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -takefocus -menu -direction -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Menubutton instproc identify} {0 -1}
{::ttk::Menubutton instproc instate} {0 -1}
{::ttk::Menubutton instproc state} {0 -1}
{::ttk::Notebook instproc add} {0 -1}
{::ttk::Notebook instproc cget} {{unknown {{enum -takefocus -width -height -padding -takefocus -cursor -style -class}}}}
{::ttk::Notebook instproc configure} {list {void {{option -takefocus boolean -width unknown -height unknown -padding unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -takefocus -width -height -padding -takefocus -cursor -style -class}}}}
{::ttk::Notebook instproc forget} {0 -1}
{::ttk::Notebook instproc hide} {0 -1}
{::ttk::Notebook instproc identify} {0 -1}
{::ttk::Notebook instproc index} {0 -1}
{::ttk::Notebook instproc insert} {0 -1}
{::ttk::Notebook instproc instate} {0 -1}
{::ttk::Notebook instproc select} {0 -1}
{::ttk::Notebook instproc state} {0 -1}
{::ttk::Notebook instproc tab} {0 -1}
{::ttk::Notebook instproc tabs} {0 -1}
{::ttk::Panedwindow instproc add} {0 -1}
{::ttk::Panedwindow instproc cget} {{unknown {{enum -orient -width -height -takefocus -cursor -style -class}}}}
{::ttk::Panedwindow instproc configure} {list {void {{option -orient {enum horizontal vertical} -width unknown -height unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -orient -width -height -takefocus -cursor -style -class}}}}
{::ttk::Panedwindow instproc forget} {0 -1}
{::ttk::Panedwindow instproc identify} {0 -1}
{::ttk::Panedwindow instproc insert} {0 -1}
{::ttk::Panedwindow instproc instate} {0 -1}
{::ttk::Panedwindow instproc pane} {0 -1}
{::ttk::Panedwindow instproc panes} {0 -1}
{::ttk::Panedwindow instproc sashpos} {0 -1}
{::ttk::Panedwindow instproc state} {0 -1}
{::ttk::Progressbar instproc cget} {{unknown {{enum -orient -length -mode -maximum -variable -value -phase -takefocus -cursor -style -class}}}}
{::ttk::Progressbar instproc configure} {list {void {{option -orient {enum horizontal vertical} -length unknown -mode unknown -maximum unknown -variable unknown -value unknown -phase unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -orient -length -mode -maximum -variable -value -phase -takefocus -cursor -style -class}}}}
{::ttk::Progressbar instproc identify} {0 -1}
{::ttk::Progressbar instproc instate} {0 -1}
{::ttk::Progressbar instproc start} {0 -1}
{::ttk::Progressbar instproc state} {0 -1}
{::ttk::Progressbar instproc step} {0 -1}
{::ttk::Progressbar instproc stop} {0 -1}
{::ttk::Radiobutton instproc cget} {{unknown {{enum -takefocus -variable -value -command -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Radiobutton instproc configure} {list {void {{option -takefocus boolean -variable unknown -value unknown -command script -text string -textvariable {setgref string} -underline int -width unknown -image unknown -compound {enum none bottom top left right center} -padding unknown -state unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -takefocus -variable -value -command -text -textvariable -underline -width -image -compound -padding -state -takefocus -cursor -style -class}}}}
{::ttk::Radiobutton instproc identify} {0 -1}
{::ttk::Radiobutton instproc instate} {0 -1}
{::ttk::Radiobutton instproc invoke} {0 -1}
{::ttk::Radiobutton instproc state} {0 -1}
{::ttk::Scale instproc cget} {{unknown {{enum -takefocus -command -variable -orient -from -to -value -length -takefocus -cursor -style -class}}}}
{::ttk::Scale instproc configure} {list {void {{option -takefocus boolean -command script -variable unknown -orient {enum horizontal vertical} -from unknown -to unknown -value unknown -length unknown -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -takefocus -command -variable -orient -from -to -value -length -takefocus -cursor -style -class}}}}
{::ttk::Scale instproc coords} {0 -1}
{::ttk::Scale instproc get} {0 -1}
{::ttk::Scale instproc identify} {0 -1}
{::ttk::Scale instproc instate} {0 -1}
{::ttk::Scale instproc set} {0 -1}
{::ttk::Scale instproc state} {0 -1}
{::ttk::Scrollbar instproc cget} {{unknown {{enum -command -orient -takefocus -cursor -style -class}}}}
{::ttk::Scrollbar instproc configure} {list {void {{option -command script -orient {enum horizontal vertical} -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -command -orient -takefocus -cursor -style -class}}}}
{::ttk::Scrollbar instproc delta} {0 -1}
{::ttk::Scrollbar instproc fraction} {0 -1}
{::ttk::Scrollbar instproc get} {0 -1}
{::ttk::Scrollbar instproc identify} {0 -1}
{::ttk::Scrollbar instproc instate} {0 -1}
{::ttk::Scrollbar instproc set} {0 -1}
{::ttk::Scrollbar instproc state} {0 -1}
{::ttk::Separator instproc cget} {{unknown {{enum -orient -takefocus -cursor -style -class}}}}
{::ttk::Separator instproc configure} {list {void {{option -orient {enum horizontal vertical} -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -orient -takefocus -cursor -style -class}}}}
{::ttk::Separator instproc identify} {0 -1}
{::ttk::Separator instproc instate} {0 -1}
{::ttk::Separator instproc state} {0 -1}
{::ttk::Sizegrip instproc cget} {{unknown {{enum -takefocus -cursor -style -class}}}}
{::ttk::Sizegrip instproc configure} {list {void {{option -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -takefocus -cursor -style -class}}}}
{::ttk::Sizegrip instproc identify} {0 -1}
{::ttk::Sizegrip instproc instate} {0 -1}
{::ttk::Sizegrip instproc state} {0 -1}
{::ttk::Treeview instproc bbox} {0 -1}
{::ttk::Treeview instproc cget} {{unknown {{enum -takefocus -columns -displaycolumns -show -selectmode -height -padding -xscrollcommand -yscrollcommand -takefocus -cursor -style -class}}}}
{::ttk::Treeview instproc children} {0 -1}
{::ttk::Treeview instproc column} {0 -1}
{::ttk::Treeview instproc configure} {list {void {{option -takefocus boolean -columns unknown -displaycolumns unknown -show unknown -selectmode unknown -height unknown -padding unknown -xscrollcommand script -yscrollcommand script -takefocus boolean -cursor unknown -style unknown -class unknown}}} {list {{enum -takefocus -columns -displaycolumns -show -selectmode -height -padding -xscrollcommand -yscrollcommand -takefocus -cursor -style -class}}}}
{::ttk::Treeview instproc delete} {0 -1}
{::ttk::Treeview instproc detach} {0 -1}
{::ttk::Treeview instproc drag} {0 -1}
{::ttk::Treeview instproc exists} {0 -1}
{::ttk::Treeview instproc focus} {0 -1}
{::ttk::Treeview instproc heading} {0 -1}
{::ttk::Treeview instproc identify} {0 -1}
{::ttk::Treeview instproc index} {0 -1}
{::ttk::Treeview instproc insert} {0 -1}
{::ttk::Treeview instproc instate} {0 -1}
{::ttk::Treeview instproc item} {0 -1}
{::ttk::Treeview instproc move} {0 -1}
{::ttk::Treeview instproc next} {0 -1}
{::ttk::Treeview instproc parent} {0 -1}
{::ttk::Treeview instproc prev} {0 -1}
{::ttk::Treeview instproc see} {0 -1}
{::ttk::Treeview instproc selection} {0 -1}
{::ttk::Treeview instproc set} {0 -1}
{::ttk::Treeview instproc state} {0 -1}
{::ttk::Treeview instproc tag} {0 -1}
{::ttk::Treeview instproc xview} {0 -1}
{::ttk::Treeview instproc yview} {0 -1}

}
array set xotclObjectsArr {
::ttk::Button {Class ::widget {}}
::ttk::Checkbutton {Class ::widget {}}
::ttk::Combobox {Class ::widget {}}
::ttk::Entry {Class ::widget {}}
::ttk::Frame {Class ::widget {}}
::ttk::Label {Class ::widget {}}
::ttk::Labelframe {Class ::widget {}}
::ttk::Menubutton {Class ::widget {}}
::ttk::Notebook {Class ::widget {}}
::ttk::Panedwindow {Class ::widget {}}
::ttk::Progressbar {Class ::widget {}}
::ttk::Radiobutton {Class ::widget {}}
::ttk::Scale {Class ::widget {}}
::ttk::Scrollbar {Class ::widget {}}
::ttk::Separator {Class ::widget {}}
::ttk::Sizegrip {Class ::widget {}}
::ttk::Treeview {Class ::widget {}}

}


}
