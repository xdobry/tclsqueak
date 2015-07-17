CoreSignatureRepository instproc registerTkProcs {} {
    my instvar commandsArr xotclObjectsArr methodsArr


    array set commandsArr {
::bell {{{void {Ring a display's bell}} {? {option -displayof tk -nice {}}}}}
::bind {{{unknown docu} {unknown tag} {? string ?sequence?} {? script script}}}
::bindtags {{{unknown docu} {tk window} {? list ?tagList?}}}
::clipboard {
  {{void docu} {{const clear}} {? {option -displayof tk}}}
  {{void docu} {{const append}} {? {option -displayof tk -format string -type string -- {}}} {unknown string}}
  {{string docu} {{const get}} {? {option -displayof tk -format string -type string}}}
}
::console {
  {{unknown docu} {{const eval}} {unknown script}}
  {{void docu} {{const hide}}}
  {{void docu} {{const show}}}
  {{string docu} {{const title}} {? string ?string?}}
}
::destroy {{{void docu} {+ tk}}}
::event {
  {{void docu} {{const add}} {unknown <<virtual>>} {+ string sequence}}
  {{void docu} {{const delete}} {unknown <<virtual>>} {* string sequence}}
  {{void docu} {{const generate}} {tk window} {unknown event} {* unknown ?...?}}
  {{list docu} {{const info}} {? string <<virtual>>}}
}
::focus {
  {{tk docu} {? tk window}}
  {{tk docu} {{const -displayof}} {tk window}}
  {{void docu} {{const -force}} {tk window}}
  {{tk docu} {{const -lastfor}} {tk window}}
}
::font {
  {{unknown docu} {{const actual}} {string font} {? {option -displayof tk}} {unknown ?option?} {? {enum -family -size -weight -slant -underline -overstrike}} {? {const --}} {? string char}}
  {{string docu} {{const create}} {? string fontname} {? {option -family string -size pixel -weight {enum normal bold} -slant {enum roman italic}
-underline boolean -overstrike boolean}}}
  {{unknown docu} {{const configure}} {string fontname} {? {enum -family -size -weight -slant -underline -overstrike}}}
  {{void docu} {{const configure}} {string fontname} {? {option -family string -size pixel -weight {enum normal bold} -slant {enum roman italic}
-underline boolean -overstrike boolean}}}
  {{void docu} {{const delete}} {+ string fontname}}
  {{list docu} {{const families}} {? {option -displayof tk}}}
  {{int docu} {{const measure}} {string font} {? {option -displayof tk}} {string text}}
  {{unknown docu} {{const metrics}} {string font} {? {option -displayof tk}} {{enum -ascent -descent -linespace -fixed}}}
  {{list docu} {{const names}}}
}

::grab {
  {{void docu} {? {option -global {}}} {tk window}}
  {{tk docu} {{const current}} {? tk window}}
  {{void docu} {{const release}} {tk window}}
  {{void docu} {{const set}} {? {option -global {}}} {tk window}}
  {{string docu} {{const status}} {tk window}}
}
::grid {
  {{string docu} {{const anchor}} {tk master} {? string anchor}}
  {{unknown docu} {{const bbox}} {tk master} {unknown ?column} {unknown row?} {unknown ?column2} {unknown row2?}}
  {{void docu} {{const columnconfigure}} {tk master} {int index} {? {option -minsize int -weight double -uniform string -pad pixel}}}
  {{unknown docu} {{const columnconfigure}} {tk master} {string index} {enum -minsize -weight -uniform -pad}}
  {{unknown docu} {{const configure}} {+ tk slave} {? {option -column int -columnspan int -in tk -ipadx pixel -ipady pixel -padx pixel -pady pixel -row int -rowspan int -sticky {enum n s e w}}}}
  {{void docu} {{const forget}} {+ tk slave}}
  {{list docu} {{const info}} {tk slave}}
  {{list docu} {{const location}} {tk master} {int x} {int y}}
  {{boolean docu} {{const propagate}} {tk master} {? boolean}}
  {{void docu} {{const rowconfigure}} {tk master} {string index} {? {option -minsize int -weight double -uniform string -pad pixel}}}
  {{void docu} {{const remove}} {+ tk slave}}
  {{{list int} docu} {{const size}} {tk master}}
  {{list docu} {{const slaves}} {tk master} {? {option -row int -column int}}}
  {{void docu} {+ tk slave} {* {const -}} {* {const x}} {* {const ^}} {? {option -column int -columnspan int -in tk -ipadx pixel -ipady pixel -padx pixel -pady pixel -row int -rowspan int -sticky string}}}
}
::image {
    {string {{const create}} {string type} {? string name} {? {option -background color -data string -file string -foreground color -maskdata string -maskfile string -format string -gamma string -height int -palette string -width int}}}
    {void {{const delete}} {+ string name}}
    {int {{const height}} {string name}}
    {boolean {{const inuse}} {string name}}
    {list {{const names}} }
    {string {{const type}} {string name}}
    {list {{const types}} }
    {int {{const width}} {string name}}
}
::lower {{{unknown docu} {tk window} {? tk belowThis}}}
::option {
     {void {{const add}} {string pattern} {string value} {? {enum widgetDefault startupFile userDefault interactive} priority}}
     {string {{const get}} tk {string name} {string class}}
     {void {{const clear}}}
     {void {{const readfile}} {string fileName} {? {enum widgetDefault startupFile userDefault interactive} priority}}
}
::pack {
  {{void docu} {{const configure}} {+ tk slave} {? {option -after tk -anchor string -before tk -expand boolean -fill {enum none x y both} -in tk -ipadx pixel -ipady pixel -padx pixel -pady pixel -side {enum left right top bottom}}}}
  {{void docu} {{const forget}} {+ tk slave}}
  {{list docu} {{const info}} {tk slave}}
  {{boolean docu} {{const propagate}} {tk master} {? boolean}}
  {{{list tk} docu} {{const slaves}} {tk master}}
  {void {+ tk slave} {? {option -after tk -anchor string -before tk -expand boolean -fill {enum none x y both} -in tk -ipadx pixel -ipady pixel -padx pixel -pady pixel -side {enum left right top bottom}}}}
}
::pathname {{{unknown docu} {unknown insert} {unknown index} {tk window} {unknown ?options...?}}}
::place {
  {{void docu} {+ tk slave} {? {option -anchor string -bordermode string -height pixel -in tk -relheight pixel -relwidth pixel -relx pixel -rely pixel -width pixel -x pixel -y pixel}}}
  {{void docu} {{const configure}} {+ tk window} {? {option -anchor string -bordermode string -height pixel -in tk -relheight pixel -relwidth pixel -relx pixel -rely pixel -width pixel -x pixel -y pixel}}}
  {{void docu} {{const forget}} {+ tk window}}
  {{list docu} {{const info}} {tk window}}
  {{list docu} {{const slaves}} {tk window}}
}
::raise {{{unknown docu} {tk window} {? tk aboveThis}}}
::selection {
  {{unknown docu} {{const clear}} {? {option -displayof tk -selection string}}}
  {{unknown docu} {{const get}} {? {option -displayof tk -selection string -type string}}}
  {{unknown docu} {{const handle}} {? {option  -selection string -type string -format string}} {tk window} {script command}}
  {{unknown docu} {{const own}} {? {option -displayof tk -selection string}}}
  {{unknown docu} {{const own}} {? {option -command string -selection string}} {tk window}}
}
::send {{{unknown docu} {? {option -async {} -displayof string}} {string app} {string cmd} {* string args}}}
::tk {
  {{string docu} {{const appname}} {? string newName}}
  {{list docu} {{const caret}} {tk window} {? {option -x int -y int -height int}}}
  {{string docu} {{const scaling}} {? {option -displayof tk}}  {? pixel number}}
  {{unknown docu} {{const inactive}} {? {option -displayof tk}} {? {const reset}}}
  {{unknown docu} {{const useinputmethods}} {? {option -displayof tk}}  {?boolean boolean}}
  {{string docu} {{const windowingsystem}}}
}
::tk_bindForTraversal {{{unknown docu} {unknown arg} {unknown arg} {unknown ...}}}
::tk_bisque {{{unknown docu}}}
::tk_chooseColor {{color {? {option -initialcolor color -parent tk -title string}}}}
::tk_chooseDirectory {{string {? {option -initialdir string -mustexist boolean -parent tk -title string}}}}
::tk_dialog {{{string docu} {tk window} {unknown title} {string text} {unknown bitmap} {unknown default} {+ string string}}}
::tk_focusFollowsMouse {{{unknown docu}}}
::tk_focusNext {{{tk docu} {tk window}}}
::tk_focusPrev {{{tk docu} {tk window}}}
::tk_getOpenFile {{{string docu} {? {option -defaultextension string -filetypes {list string} -initialdir string -initialfile string -message string -multiple boolean -parent tk -title string -typevariable {ref string}}}}}
::tk_getSaveFile {{{string docu} {? {option -defaultextension string -filetypes {list string} -initialdir string -initialfile string -message string -multiple boolean -parent tk -title string -typevariable {ref string}}}}}
::tk_menuBar {{{unknown docu} {unknown frame} {unknown ?...?}}}
::tk_menuSetFocus {{{unknown docu} {tk pathName}}}
::tk_messageBox {{{string docu} {{option -default string -detail string -icon unknown -message string -parent tk -title string -type {enum abortretryignore ok okcancel retrycancel yesno yesnocancel}}}}}
::tk_optionMenu {{{unknown docu} {tk pathName} {{ref string} varName} {+ string value}}}
::tk_popup {{{unknown docu} {{tk ::Menu} menu} {int x} {int y} {? int entry}}}
::tk_setPalette {{{unknown docu} {unknown name} {unknown value} {? unknown}}}
::tk_textCopy {{{unknown docu} {tk pathName}}}
::tk_textCut {{{unknown docu} {tk pathName}}}
::tk_textPaste {{{unknown docu} {tk pathName}}}
::tkerror {{{unknown docu} {string message}}}
::tkwait {
    {{unknown docu} {{const variable}} {gref varname}}
    {{unknown docu} {{const visibility}} {tk name}}
    {{unknown docu} {{const window}} {tk name}}
}
::winfo {
  {{int docu} {{const atom}} {? {option -displayof tk}} {string name}}
  {{string docu} {{const atomname}} {? {option -displayof tk}} {string id}}
  {{int docu} {{const cells}} {tk window}}
  {{{list tk} docu} {{const children}} {tk window}}
  {{string docu} {{const class}} {tk window}}
  {{boolean docu} {{const colormapfull}} {tk window}}
  {{tk docu} {{const containing}} {? {option -displayof tk}} {int rootX} {int rootY}}
  {{int docu} {{const depth}} {tk window}}
  {{boolean docu} {{const exists}} {{new tk ::widget} window}}
  {{double docu} {{const fpixels}} {tk window} {pixel number}}
  {{string docu} {{const geometry}} {tk window}}
  {{int docu} {{const height}} {tk window}}
  {{string docu} {{const id}} {tk window}}
  {{list docu} {{const interps}} {? {option -displayof tk}} {string id}}
  {{boolean docu} {{const ismapped}} {tk window}}
  {{string docu} {{const manager}} {tk window}}
  {{string docu} {{const name}} {tk window}}
  {{tk docu} {{const parent}} {tk window}}
  {{tk docu} {{const pathname}} {? {option -displayof tk}} {unknown id}}
  {{int docu} {{const pixels}} {tk window} {pixel number}}
  {{int docu} {{const pointerx}} {tk window}}
  {{list docu} {{const pointerxy}} {tk window}}
  {{int docu} {{const pointery}} {tk window}}
  {{int docu} {{const reqheight}} {tk window}}
  {{int docu} {{const reqwidth}} {tk window}}
  {{{list int} docu} {{const rgb}} {tk window} {string color}}
  {{int docu} {{const rootx}} {tk window}}
  {{int docu} {{const rooty}} {tk window}}
  {{string docu} {{const screen}} {tk window}}
  {{int docu} {{const screencells}} {tk window}}
  {{int docu} {{const screendepth}} {tk window}}
  {{int docu} {{const screenheight}} {tk window}}
  {{int docu} {{const screenmmheight}} {tk window}}
  {{int docu} {{const screenmmwidth}} {tk window}}
  {{string docu} {{const screenvisual}} {tk window}}
  {{int docu} {{const screenwidth}} {tk window}}
  {{string docu} {{const server}} {tk window}}
  {{{tk ::Toplevel} docu} {{const toplevel}} {tk window}}
  {{boolean docu} {{const viewable}} {tk window}}
  {{string docu} {{const visual}} {tk window}}
  {{int docu} {{const visualid}} {tk window}}
  {{list docu} {{const visualsavailable}} {tk window} {? {const includeids}}}
  {{int docu} {{const vrootheight}} {tk window}}
  {{int docu} {{const vrootwidth}} {tk window}}
  {{int docu} {{const vrootx}} {tk window}}
  {{int docu} {{const vrooty}} {tk window}}
  {{int docu} {{const width}} {tk window}}
  {{int docu} {{const x}} {tk window}}
  {{int docu} {{const y}} {tk window}}
}
::wm {
  {{list docu} {{const aspect}}}
  {{void docu} {{const aspect}} {tk window} {int minNumer} {int minDenom} {int maxNumer} {int maxDenom}}
  {{list docu} {{const attributes}} {tk window}}
  {{unknown docu} {{const attributes}} {tk window} {{enum -fullscreen -topmost -alpha -disabled -toolwindow -transparentcolor -alpha -modified -notify -titlepath -transparent -zoomed -type}}}
  {{void docu} {{const attributes}} {tk window} {{option -fullscreen unknown -topmost unknown -alpha unknown -disabled unknown -toolwindow unknown -transparentcolor unknown -alpha unknown -modified unknown -notify unknown -titlepath unknown -transparent unknown -zoomed unknown -type unknown}}}
  {{string docu} {{const client}} {tk window} {? string name}}
  {{list docu} {{const colormapwindows}} {tk window} {? list windowList}}
  {{unknown docu} {{const command}} {tk window} {? unknown value}}
  {{void docu} {{const deiconify}} {tk window}}
  {{unknown docu} {{const focusmodel}} {tk window} {{enum active passive}}}
  {{void docu} {{const forget}} {tk window}}
  {{string docu} {{const frame}} {tk window}}
  {{unknown docu} {{const geometry}} {tk window} {? unknown newGeometry}}
  {{unknown docu} {{const grid}} {tk window}}
  {{unknown docu} {{const grid}} {tk window} {int baseWidth} {int baseHeight} {int widthInc} {int heightInc?}}
  {{unknown docu} {{const group}} {tk window} {? string pathName}}
  {{unknown docu} {{const iconbitmap}} {tk window} {? {const -default}} {? unknown bitmap}}
  {{unknown docu} {{const iconify}} {tk window}}
  {{unknown docu} {{const iconmask}} {tk window} {? unknown bitmap}}
  {{unknown docu} {{const iconname}} {tk window} {? string newName}}
  {{unknown docu} {{const iconphoto}} {tk window} {unknown ?-default?} {unknown image1} {unknown ?...?}}
  {{unknown docu} {{const iconposition}} {tk window} {unknown ?x} {unknown y?}}
  {{unknown docu} {{const iconwindow}} {tk window} {? unknown pathName}}
  {{void docu} {{const manage}} {tk widget}}
  {{list docu} {{const maxsize}} {tk window}}
  {{void docu} {{const maxsize}} {tk window} {int width} {int height}}
  {{list docu} {{const minsize}} {tk window}}
  {{void docu} {{const minsize}} {tk window} {int width} {int height}}
  {{boolean docu} {{const overrideredirect}} {tk window} {? boolean boolean}}
  {{string docu} {{const positionfrom}} {tk window} {? unknown who}}
  {{unknown docu} {{const protocol}} {tk window}}
  {{unknown docu} {{const protocol}} {tk window} {string name} {script command}}
  {{string docu} {{const resizable}} {tk window}}
  {{string docu} {{const resizable}} {tk window} {int width} {int height}}
  {{string docu} {{const sizefrom}} {tk window} {? unknown who}}
  {{list docu} {{const stackorder}} {tk window} }
  {{list docu} {{const stackorder}} {tk window} {{enum isabove isbelow}} {tk window}}
  {{string docu} {{const state}} {tk window} {? unknown newstate}}
  {{string docu} {{const title}} {tk window} {? string string}}
  {{tk docu} {{const transient}} {tk window} {? tk master}}
  {{void docu} {{const withdraw}} {tk window}}
}
   }

   my registerMethod ::widget instproc configure {0 -1}
   my registerMethod ::widget instproc cget {1 1}
   my registerObject ::widget Class {} {}

array set commandsArr {
::button {{{{tk ::Button}} {{new tk ::Button} button} {? {option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -command script -compound {enum none bottom top left right center} -cursor unknown -default unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -justify {enum left center right} -overrelief unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -repeatdelay int -repeatinterval int -state unknown -takefocus boolean -text string -textvariable {gref string} -underline int -width pixel -wraplength int}}}}
::canvas {{{{tk ::Canvas}} {{new tk ::Canvas} canvas} {? {option -background color -bd pixel -bg color -borderwidth pixel -closeenough unknown -confine unknown -cursor unknown -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -insertbackground color -insertborderwidth pixel -insertofftime int -insertontime int -insertwidth pixel -offset unknown -relief {enum raised sunken flat ridge solid groove} -scrollregion unknown -selectbackground color -selectborderwidth pixel -selectforeground color -state unknown -takefocus boolean -width unknown -xscrollcommand script -xscrollincrement unknown -yscrollcommand script -yscrollincrement unknown}}}}
::checkbutton {{{{tk ::Checkbutton}} {{new tk ::Checkbutton} checkbutton} {? {option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -command script -compound {enum none bottom top left right center} -cursor unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -indicatoron unknown -justify {enum left center right} -offrelief unknown -offvalue unknown -onvalue unknown -overrelief unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -selectcolor unknown -selectimage unknown -state unknown -takefocus boolean -text string -textvariable {gref string} -tristateimage unknown -tristatevalue unknown -underline int -variable unknown -width unknown -wraplength int}}}}
::entry {{{{tk ::Entry}} {{new tk ::Entry} entry} {? {option -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -disabledbackground unknown -disabledforeground color -exportselection boolean -fg color -font string -foreground color -highlightbackground color -highlightcolor color -highlightthickness pixel -insertbackground color -insertborderwidth pixel -insertofftime int -insertontime int -insertwidth pixel -invalidcommand unknown -invcmd unknown -justify {enum left center right} -readonlybackground unknown -relief {enum raised sunken flat ridge solid groove} -selectbackground color -selectborderwidth pixel -selectforeground color -show unknown -state unknown -takefocus boolean -textvariable {setgref string} -validate unknown -validatecommand unknown -vcmd unknown -width unknown -xscrollcommand script}}}}
::frame {{{{tk ::Frame}} {{new tk ::Frame} frame} {? {option -bd pixel -borderwidth pixel -class unknown -relief {enum raised sunken flat ridge solid groove} -background color -bg color -colormap unknown -container unknown -cursor unknown -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -padx pixel -pady pixel -takefocus boolean -visual unknown -width unknown}}}}
::label {{{{tk ::Label}} {{new tk ::Label} label} {? {option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -compound {enum none bottom top left right center} -cursor unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -justify {enum left center right} -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -state unknown -takefocus boolean -text string -textvariable {setgref string} -underline int -width unknown -wraplength pixel}}}}
::labelframe {{{{tk ::Labelframe}} {{new tk ::Labelframe} labelframe} {? {option -bd pixel -borderwidth pixel -class unknown -fg color -font string -foreground color -labelanchor unknown -labelwidget unknown -relief {enum raised sunken flat ridge solid groove} -text string -background color -bg color -colormap unknown -container unknown -cursor unknown -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -padx pixel -pady pixel -takefocus boolean -visual unknown -width unknown}}}}
::listbox {{{{tk ::Listbox}} {{new tk ::Listbox} listbox} {? {option -activestyle unknown -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -disabledforeground color -exportselection boolean -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -relief {enum raised sunken flat ridge solid groove} -selectbackground color -selectborderwidth pixel -selectforeground color -selectmode unknown -setgrid boolean -state unknown -takefocus boolean -width unknown -xscrollcommand script -yscrollcommand script -listvariable unknown}}}}
::menu {{{{tk ::Menu}} {{new tk ::Menu} menu} {? {option -activebackground color -activeborderwidth pixel -activeforeground unknown -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -disabledforeground color -fg color -font string -foreground color -postcommand unknown -relief {enum raised sunken flat ridge solid groove} -selectcolor unknown -takefocus boolean -tearoff unknown -tearoffcommand unknown -title unknown -type unknown}}}}
::menubutton {{{{tk ::Menubutton}} {{new tk ::Menubutton} menubutton} {? {option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -cursor unknown -direction unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -indicatoron unknown -justify {enum left center right} -menu unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -compound {enum none bottom top left right center} -state unknown -takefocus boolean -text string -textvariable {setgref string} -underline int -width unknown -wraplength int}}}}
::message {{{{tk ::Message}} {{new tk ::Message} message} {? {option -anchor {enum n ne e se s sw w nw center} -aspect unknown -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -fg color -font string -foreground color -highlightbackground color -highlightcolor color -highlightthickness pixel -justify {enum left center right} -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -takefocus boolean -text string -textvariable {setgref string} -width unknown}}}}
::panedwindow {{{{tk ::Panedwindow}} {{new tk ::Panedwindow} panedwindow} {? {option -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -handlepad unknown -handlesize unknown -height unknown -opaqueresize unknown -orient {enum horizontal vertical} -relief {enum raised sunken flat ridge solid groove} -sashcursor unknown -sashpad unknown -sashrelief unknown -sashwidth unknown -showhandle unknown -width unknown}}}}
::radiobutton {{{{tk ::Radiobutton}} {{new tk ::Radiobutton} radiobutton} {? {option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -command script -compound {enum none bottom top left right center} -cursor unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -indicatoron unknown -justify {enum left center right} -offrelief unknown -overrelief unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -selectcolor unknown -selectimage unknown -state unknown -takefocus boolean -text string -textvariable {setgref string} -tristateimage unknown -tristatevalue unknown -underline int -value unknown -variable unknown -width unknown -wraplength int}}}}
::scale {{{{tk ::Scale}} {{new tk ::Scale} scale} {? {option -activebackground color -background color -bigincrement unknown -bd pixel -bg color -borderwidth pixel -command script -cursor unknown -digits unknown -fg color -font string -foreground color -from unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -label unknown -length unknown -orient {enum horizontal vertical} -relief {enum raised sunken flat ridge solid groove} -repeatdelay int -repeatinterval int -resolution unknown -showvalue unknown -sliderlength unknown -sliderrelief unknown -state unknown -takefocus boolean -tickinterval unknown -to unknown -troughcolor color -variable unknown -width unknown}}}}
::scrollbar {{{{tk ::Scrollbar}} {{new tk ::Scrollbar} scrollbar} {? {option -activebackground color -activerelief unknown -background color -bd pixel -bg color -borderwidth pixel -command script -cursor unknown -elementborderwidth unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -jump boolean -orient {enum horizontal vertical} -relief {enum raised sunken flat ridge solid groove} -repeatdelay int -repeatinterval int -takefocus boolean -troughcolor color -width unknown}}}}
::spinbox {{{{tk ::Spinbox}} {{new tk ::Spinbox} spinbox} {? {option -activebackground color -background color -bd pixel -bg color -borderwidth pixel -buttonbackground unknown -buttoncursor unknown -buttondownrelief unknown -buttonuprelief unknown -command script -cursor unknown -disabledbackground unknown -disabledforeground color -exportselection boolean -fg color -font string -foreground color -format unknown -from unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -increment unknown -insertbackground color -insertborderwidth pixel -insertofftime int -insertontime int -insertwidth pixel -invalidcommand unknown -invcmd unknown -justify {enum left center right} -relief {enum raised sunken flat ridge solid groove} -readonlybackground unknown -repeatdelay int -repeatinterval int -selectbackground color -selectborderwidth pixel -selectforeground color -state unknown -takefocus boolean -textvariable {setgref string} -to unknown -validate unknown -validatecommand unknown -values unknown -vcmd unknown -width unknown -wrap unknown -xscrollcommand script}}}}
::text {{{{tk ::Text}} {{new tk ::Text} text} {? {option -autoseparators unknown -background color -bd pixel -bg color -blockcursor unknown -borderwidth pixel -cursor unknown -endline unknown -exportselection boolean -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -inactiveselectbackground unknown -insertbackground color -insertborderwidth pixel -insertofftime int -insertontime int -insertwidth pixel -maxundo unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -selectbackground color -selectborderwidth pixel -selectforeground color -setgrid boolean -spacing1 unknown -spacing2 unknown -spacing3 unknown -startline unknown -state unknown -tabs unknown -tabstyle unknown -takefocus boolean -undo unknown -width unknown -wrap unknown -xscrollcommand script -yscrollcommand script}}}}
::toplevel {{{{tk ::Toplevel}} {{new tk ::Toplevel} toplevel} {? {option -bd pixel -borderwidth pixel -class unknown -menu unknown -relief {enum raised sunken flat ridge solid groove} -screen unknown -use unknown -background color -bg color -colormap unknown -container unknown -cursor unknown -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -padx pixel -pady pixel -takefocus boolean -visual unknown -width unknown}}}}

}
array set methodsArr {
{::Button instproc cget} {{unknown {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -command -compound -cursor -default -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -justify -overrelief -padx -pady -relief -repeatdelay -repeatinterval -state -takefocus -text -textvariable -underline -width -wraplength}}}}
{::Button instproc configure} {list {void {{option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -command script -compound {enum none bottom top left right center} -cursor unknown -default unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -justify {enum left center right} -overrelief unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -repeatdelay int -repeatinterval int -state unknown -takefocus boolean -text string -textvariable {setgref string} -underline int -width unknown -wraplength int}}} {list {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -command -compound -cursor -default -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -justify -overrelief -padx -pady -relief -repeatdelay -repeatinterval -state -takefocus -text -textvariable -underline -width -wraplength}}}}
{::Button instproc flash} void
{::Button instproc invoke} void
{::Canvas instproc addtag} {
    {void string {{const above}} {string tagOrId}}
    {void string {{const below}} {string tagOrId}}
    {void string {{const closest}} int int {? int} {? unknown start}}
    {void string {{const enclosed}} int int int int}
    {void string {{const overlapping}} int int int int}
    {void string {{const withtag}} string}
}
{::Canvas instproc bbox} {{list {+ string tag}}}
{::Canvas instproc bind} {{void string {? string sequence} {? script}}}
{::Canvas instproc canvasx} {{int int {? int}}}
{::Canvas instproc canvasy} {{int int {? int}}}
{::Canvas instproc cget} {{unknown {{enum -background -bd -bg -borderwidth -closeenough -confine -cursor -height -highlightbackground -highlightcolor -highlightthickness -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -offset -relief -scrollregion -selectbackground -selectborderwidth -selectforeground -state -takefocus -width -xscrollcommand -xscrollincrement -yscrollcommand -yscrollincrement}}}}
{::Canvas instproc configure} {list {void {{option -background color -bd pixel -bg color -borderwidth pixel -closeenough unknown -confine unknown -cursor unknown -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -insertbackground color -insertborderwidth pixel -insertofftime int -insertontime int -insertwidth pixel -offset unknown -relief {enum raised sunken flat ridge solid groove} -scrollregion unknown -selectbackground color -selectborderwidth pixel -selectforeground color -state unknown -takefocus boolean -width unknown -xscrollcommand script -xscrollincrement unknown -yscrollcommand script -yscrollincrement unknown}}} {list {{enum -background -bd -bg -borderwidth -closeenough -confine -cursor -height -highlightbackground -highlightcolor -highlightthickness -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -offset -relief -scrollregion -selectbackground -selectborderwidth -selectforeground -state -takefocus -width -xscrollcommand -xscrollincrement -yscrollcommand -yscrollincrement}}}}
{::Canvas instproc coords} {0 -1}
{::Canvas instproc create} {0 -1}
{::Canvas instproc dchars} {0 -1}
{::Canvas instproc delete} {0 -1}
{::Canvas instproc dtag} {0 -1}
{::Canvas instproc find} {0 -1}
{::Canvas instproc focus} {0 -1}
{::Canvas instproc gettags} {0 -1}
{::Canvas instproc icursor} {0 -1}
{::Canvas instproc index} {0 -1}
{::Canvas instproc insert} {0 -1}
{::Canvas instproc itemcget} {0 -1}
{::Canvas instproc itemconfigure} {0 -1}
{::Canvas instproc lower} void
{::Canvas instproc move} {0 -1}
{::Canvas instproc postscript} {0 -1}
{::Canvas instproc raise} void
{::Canvas instproc scale} {0 -1}
{::Canvas instproc scan} {0 -1}
{::Canvas instproc select} {0 -1}
{::Canvas instproc type} {0 -1}
{::Canvas instproc xview} {0 -1}
{::Canvas instproc yview} {0 -1}
{::Checkbutton instproc cget} {{unknown {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -command -compound -cursor -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -indicatoron -justify -offrelief -offvalue -onvalue -overrelief -padx -pady -relief -selectcolor -selectimage -state -takefocus -text -textvariable -tristateimage -tristatevalue -underline -variable -width -wraplength}}}}
{::Checkbutton instproc configure} {list {void {{option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -command script -compound {enum none bottom top left right center} -cursor unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -indicatoron unknown -justify {enum left center right} -offrelief unknown -offvalue unknown -onvalue unknown -overrelief unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -selectcolor unknown -selectimage unknown -state unknown -takefocus boolean -text string -textvariable {setgref string} -tristateimage unknown -tristatevalue unknown -underline int -variable unknown -width unknown -wraplength int}}} {list {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -command -compound -cursor -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -indicatoron -justify -offrelief -offvalue -onvalue -overrelief -padx -pady -relief -selectcolor -selectimage -state -takefocus -text -textvariable -tristateimage -tristatevalue -underline -variable -width -wraplength}}}}
{::Checkbutton instproc deselect} void
{::Checkbutton instproc flash} void
{::Checkbutton instproc invoke} void
{::Checkbutton instproc select} void
{::Checkbutton instproc toggle} void
{::Entry instproc bbox} {0 -1}
{::Entry instproc cget} {{unknown {{enum -background -bd -bg -borderwidth -cursor -disabledbackground -disabledforeground -exportselection -fg -font -foreground -highlightbackground -highlightcolor -highlightthickness -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -invalidcommand -invcmd -justify -readonlybackground -relief -selectbackground -selectborderwidth -selectforeground -show -state -takefocus -textvariable -validate -validatecommand -vcmd -width -xscrollcommand}}}}
{::Entry instproc configure} {list {void {{option -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -disabledbackground unknown -disabledforeground color -exportselection boolean -fg color -font string -foreground color -highlightbackground color -highlightcolor color -highlightthickness pixel -insertbackground color -insertborderwidth pixel -insertofftime int -insertontime int -insertwidth pixel -invalidcommand unknown -invcmd unknown -justify {enum left center right} -readonlybackground unknown -relief {enum raised sunken flat ridge solid groove} -selectbackground color -selectborderwidth pixel -selectforeground color -show unknown -state unknown -takefocus boolean -textvariable {setgref string} -validate unknown -validatecommand unknown -vcmd unknown -width unknown -xscrollcommand script}}} {list {{enum -background -bd -bg -borderwidth -cursor -disabledbackground -disabledforeground -exportselection -fg -font -foreground -highlightbackground -highlightcolor -highlightthickness -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -invalidcommand -invcmd -justify -readonlybackground -relief -selectbackground -selectborderwidth -selectforeground -show -state -takefocus -textvariable -validate -validatecommand -vcmd -width -xscrollcommand}}}}
{::Entry instproc delete} {{void string {? string}}}
{::Entry instproc get} string
{::Entry instproc icursor} {0 -1}
{::Entry instproc index} {{int string}}
{::Entry instproc insert} {{void string string}}
{::Entry instproc scan} {0 -1}
{::Entry instproc selection} {0 -1}
{::Entry instproc validate} void
{::Entry instproc xview} {0 -1}
{::Frame instproc cget} {{unknown {{enum -bd -borderwidth -class -relief -background -bg -colormap -container -cursor -height -highlightbackground -highlightcolor -highlightthickness -padx -pady -takefocus -visual -width}}}}
{::Frame instproc configure} {list {void {{option -bd pixel -borderwidth pixel -class unknown -relief {enum raised sunken flat ridge solid groove} -background color -bg color -colormap unknown -container unknown -cursor unknown -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -padx pixel -pady pixel -takefocus boolean -visual unknown -width unknown}}} {list {{enum -bd -borderwidth -class -relief -background -bg -colormap -container -cursor -height -highlightbackground -highlightcolor -highlightthickness -padx -pady -takefocus -visual -width}}}}
{::Label instproc cget} {{unknown {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -compound -cursor -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -justify -padx -pady -relief -state -takefocus -text -textvariable -underline -width -wraplength}}}}
{::Label instproc configure} {list {void {{option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -compound {enum none bottom top left right center} -cursor unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -justify {enum left center right} -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -state unknown -takefocus boolean -text string -textvariable {setgref string} -underline int -width unknown -wraplength int}}} {list {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -compound -cursor -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -justify -padx -pady -relief -state -takefocus -text -textvariable -underline -width -wraplength}}}}
{::Labelframe instproc cget} {{unknown {{enum -bd -borderwidth -class -fg -font -foreground -labelanchor -labelwidget -relief -text -background -bg -colormap -container -cursor -height -highlightbackground -highlightcolor -highlightthickness -padx -pady -takefocus -visual -width}}}}
{::Labelframe instproc configure} {list {void {{option -bd pixel -borderwidth pixel -class unknown -fg color -font string -foreground color -labelanchor unknown -labelwidget unknown -relief {enum raised sunken flat ridge solid groove} -text string -background color -bg color -colormap unknown -container unknown -cursor unknown -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -padx pixel -pady pixel -takefocus boolean -visual unknown -width unknown}}} {list {{enum -bd -borderwidth -class -fg -font -foreground -labelanchor -labelwidget -relief -text -background -bg -colormap -container -cursor -height -highlightbackground -highlightcolor -highlightthickness -padx -pady -takefocus -visual -width}}}}
{::Listbox instproc activate} void
{::Listbox instproc bbox} {0 -1}
{::Listbox instproc cget} {{unknown {{enum -activestyle -background -bd -bg -borderwidth -cursor -disabledforeground -exportselection -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -relief -selectbackground -selectborderwidth -selectforeground -selectmode -setgrid -state -takefocus -width -xscrollcommand -yscrollcommand -listvariable}}}}
{::Listbox instproc configure} {list {void {{option -activestyle unknown -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -disabledforeground color -exportselection boolean -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -relief {enum raised sunken flat ridge solid groove} -selectbackground color -selectborderwidth pixel -selectforeground color -selectmode unknown -setgrid boolean -state unknown -takefocus boolean -width unknown -xscrollcommand script -yscrollcommand script -listvariable unknown}}} {list {{enum -activestyle -background -bd -bg -borderwidth -cursor -disabledforeground -exportselection -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -relief -selectbackground -selectborderwidth -selectforeground -selectmode -setgrid -state -takefocus -width -xscrollcommand -yscrollcommand -listvariable}}}}
{::Listbox instproc curselection} {0 -1}
{::Listbox instproc delete} {0 -1}
{::Listbox instproc get} {0 -1}
{::Listbox instproc index} {0 -1}
{::Listbox instproc insert} {0 -1}
{::Listbox instproc itemcget} {0 -1}
{::Listbox instproc itemconfigure} {0 -1}
{::Listbox instproc nearest} {0 -1}
{::Listbox instproc scan} {0 -1}
{::Listbox instproc see} {0 -1}
{::Listbox instproc selection} {0 -1}
{::Listbox instproc size} {0 -1}
{::Listbox instproc xview} {0 -1}
{::Listbox instproc yview} {0 -1}
{::Menu instproc activate} {0 -1}
{::Menu instproc add} {0 -1}
{::Menu instproc cget} {{unknown {{enum -activebackground -activeborderwidth -activeforeground -background -bd -bg -borderwidth -cursor -disabledforeground -fg -font -foreground -postcommand -relief -selectcolor -takefocus -tearoff -tearoffcommand -title -type}}}}
{::Menu instproc clone} {0 -1}
{::Menu instproc configure} {list {void {{option -activebackground color -activeborderwidth pixel -activeforeground unknown -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -disabledforeground color -fg color -font string -foreground color -postcommand unknown -relief {enum raised sunken flat ridge solid groove} -selectcolor unknown -takefocus boolean -tearoff unknown -tearoffcommand unknown -title unknown -type unknown}}} {list {{enum -activebackground -activeborderwidth -activeforeground -background -bd -bg -borderwidth -cursor -disabledforeground -fg -font -foreground -postcommand -relief -selectcolor -takefocus -tearoff -tearoffcommand -title -type}}}}
{::Menu instproc delete} {0 -1}
{::Menu instproc entrycget} {0 -1}
{::Menu instproc entryconfigure} {0 -1}
{::Menu instproc index} {0 -1}
{::Menu instproc insert} {0 -1}
{::Menu instproc invoke} {0 -1}
{::Menu instproc post} {0 -1}
{::Menu instproc postcascade} {0 -1}
{::Menu instproc type} {0 -1}
{::Menu instproc unpost} {0 -1}
{::Menu instproc xposition} {0 -1}
{::Menu instproc yposition} {0 -1}
{::Menubutton instproc cget} {{unknown {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -cursor -direction -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -indicatoron -justify -menu -padx -pady -relief -compound -state -takefocus -text -textvariable -underline -width -wraplength}}}}
{::Menubutton instproc configure} {list {void {{option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -cursor unknown -direction unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -indicatoron unknown -justify {enum left center right} -menu unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -compound {enum none bottom top left right center} -state unknown -takefocus boolean -text string -textvariable {setgref string} -underline int -width unknown -wraplength int}}} {list {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -cursor -direction -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -indicatoron -justify -menu -padx -pady -relief -compound -state -takefocus -text -textvariable -underline -width -wraplength}}}}
{::Message instproc cget} {{unknown {{enum -anchor -aspect -background -bd -bg -borderwidth -cursor -fg -font -foreground -highlightbackground -highlightcolor -highlightthickness -justify -padx -pady -relief -takefocus -text -textvariable -width}}}}
{::Message instproc configure} {list {void {{option -anchor {enum n ne e se s sw w nw center} -aspect unknown -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -fg color -font string -foreground color -highlightbackground color -highlightcolor color -highlightthickness pixel -justify {enum left center right} -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -takefocus boolean -text string -textvariable {setgref string} -width unknown}}} {list {{enum -anchor -aspect -background -bd -bg -borderwidth -cursor -fg -font -foreground -highlightbackground -highlightcolor -highlightthickness -justify -padx -pady -relief -takefocus -text -textvariable -width}}}}
{::Panedwindow instproc add} {0 -1}
{::Panedwindow instproc cget} {{unknown {{enum -background -bd -bg -borderwidth -cursor -handlepad -handlesize -height -opaqueresize -orient -relief -sashcursor -sashpad -sashrelief -sashwidth -showhandle -width}}}}
{::Panedwindow instproc configure} {list {void {{option -background color -bd pixel -bg color -borderwidth pixel -cursor unknown -handlepad unknown -handlesize unknown -height unknown -opaqueresize unknown -orient {enum horizontal vertical} -relief {enum raised sunken flat ridge solid groove} -sashcursor unknown -sashpad unknown -sashrelief unknown -sashwidth unknown -showhandle unknown -width unknown}}} {list {{enum -background -bd -bg -borderwidth -cursor -handlepad -handlesize -height -opaqueresize -orient -relief -sashcursor -sashpad -sashrelief -sashwidth -showhandle -width}}}}
{::Panedwindow instproc forget} {0 -1}
{::Panedwindow instproc identify} {0 -1}
{::Panedwindow instproc panecget} {0 -1}
{::Panedwindow instproc paneconfigure} {0 -1}
{::Panedwindow instproc panes} {0 -1}
{::Panedwindow instproc proxy} {0 -1}
{::Panedwindow instproc sash} {0 -1}
{::Radiobutton instproc cget} {{unknown {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -command -compound -cursor -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -indicatoron -justify -offrelief -overrelief -padx -pady -relief -selectcolor -selectimage -state -takefocus -text -textvariable -tristateimage -tristatevalue -underline -value -variable -width -wraplength}}}}
{::Radiobutton instproc configure} {list {void {{option -activebackground color -activeforeground unknown -anchor {enum n ne e se s sw w nw center} -background color -bd pixel -bg color -bitmap unknown -borderwidth pixel -command script -compound {enum none bottom top left right center} -cursor unknown -disabledforeground color -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -image unknown -indicatoron unknown -justify {enum left center right} -offrelief unknown -overrelief unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -selectcolor unknown -selectimage unknown -state unknown -takefocus boolean -text string -textvariable {setgref string} -tristateimage unknown -tristatevalue unknown -underline int -value unknown -variable unknown -width unknown -wraplength int}}} {list {{enum -activebackground -activeforeground -anchor -background -bd -bg -bitmap -borderwidth -command -compound -cursor -disabledforeground -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -image -indicatoron -justify -offrelief -overrelief -padx -pady -relief -selectcolor -selectimage -state -takefocus -text -textvariable -tristateimage -tristatevalue -underline -value -variable -width -wraplength}}}}
{::Radiobutton instproc deselect} void
{::Radiobutton instproc flash} void
{::Radiobutton instproc invoke} void
{::Radiobutton instproc select} {0 -1}
{::Scale instproc cget} {{unknown {{enum -activebackground -background -bigincrement -bd -bg -borderwidth -command -cursor -digits -fg -font -foreground -from -highlightbackground -highlightcolor -highlightthickness -label -length -orient -relief -repeatdelay -repeatinterval -resolution -showvalue -sliderlength -sliderrelief -state -takefocus -tickinterval -to -troughcolor -variable -width}}}}
{::Scale instproc configure} {list {void {{option -activebackground color -background color -bigincrement unknown -bd pixel -bg color -borderwidth pixel -command script -cursor unknown -digits unknown -fg color -font string -foreground color -from unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -label unknown -length unknown -orient {enum horizontal vertical} -relief {enum raised sunken flat ridge solid groove} -repeatdelay int -repeatinterval int -resolution unknown -showvalue unknown -sliderlength unknown -sliderrelief unknown -state unknown -takefocus boolean -tickinterval unknown -to unknown -troughcolor color -variable unknown -width unknown}}} {list {{enum -activebackground -background -bigincrement -bd -bg -borderwidth -command -cursor -digits -fg -font -foreground -from -highlightbackground -highlightcolor -highlightthickness -label -length -orient -relief -repeatdelay -repeatinterval -resolution -showvalue -sliderlength -sliderrelief -state -takefocus -tickinterval -to -troughcolor -variable -width}}}}
{::Scale instproc coords} {0 -1}
{::Scale instproc get} {0 -1}
{::Scale instproc identify} {0 -1}
{::Scale instproc set} {0 -1}
{::Scrollbar instproc activate} {0 -1}
{::Scrollbar instproc cget} {{unknown {{enum -activebackground -activerelief -background -bd -bg -borderwidth -command -cursor -elementborderwidth -highlightbackground -highlightcolor -highlightthickness -jump -orient -relief -repeatdelay -repeatinterval -takefocus -troughcolor -width}}}}
{::Scrollbar instproc configure} {list {void {{option -activebackground color -activerelief unknown -background color -bd pixel -bg color -borderwidth pixel -command script -cursor unknown -elementborderwidth unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -jump boolean -orient {enum horizontal vertical} -relief {enum raised sunken flat ridge solid groove} -repeatdelay int -repeatinterval int -takefocus boolean -troughcolor color -width unknown}}} {list {{enum -activebackground -activerelief -background -bd -bg -borderwidth -command -cursor -elementborderwidth -highlightbackground -highlightcolor -highlightthickness -jump -orient -relief -repeatdelay -repeatinterval -takefocus -troughcolor -width}}}}
{::Scrollbar instproc delta} {0 -1}
{::Scrollbar instproc fraction} {0 -1}
{::Scrollbar instproc get} {0 -1}
{::Scrollbar instproc identify} {0 -1}
{::Scrollbar instproc set} {0 -1}
{::Spinbox instproc bbox} {0 -1}
{::Spinbox instproc cget} {{unknown {{enum -activebackground -background -bd -bg -borderwidth -buttonbackground -buttoncursor -buttondownrelief -buttonuprelief -command -cursor -disabledbackground -disabledforeground -exportselection -fg -font -foreground -format -from -highlightbackground -highlightcolor -highlightthickness -increment -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -invalidcommand -invcmd -justify -relief -readonlybackground -repeatdelay -repeatinterval -selectbackground -selectborderwidth -selectforeground -state -takefocus -textvariable -to -validate -validatecommand -values -vcmd -width -wrap -xscrollcommand}}}}
{::Spinbox instproc configure} {list {void {{option -activebackground color -background color -bd pixel -bg color -borderwidth pixel -buttonbackground unknown -buttoncursor unknown -buttondownrelief unknown -buttonuprelief unknown -command script -cursor unknown -disabledbackground unknown -disabledforeground color -exportselection boolean -fg color -font string -foreground color -format unknown -from unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -increment unknown -insertbackground color -insertborderwidth pixel -insertofftime int -insertontime int -insertwidth pixel -invalidcommand unknown -invcmd unknown -justify {enum left center right} -relief {enum raised sunken flat ridge solid groove} -readonlybackground unknown -repeatdelay int -repeatinterval int -selectbackground color -selectborderwidth pixel -selectforeground color -state unknown -takefocus boolean -textvariable {setgref string} -to unknown -validate unknown -validatecommand unknown -values unknown -vcmd unknown -width unknown -wrap unknown -xscrollcommand script}}} {list {{enum -activebackground -background -bd -bg -borderwidth -buttonbackground -buttoncursor -buttondownrelief -buttonuprelief -command -cursor -disabledbackground -disabledforeground -exportselection -fg -font -foreground -format -from -highlightbackground -highlightcolor -highlightthickness -increment -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -invalidcommand -invcmd -justify -relief -readonlybackground -repeatdelay -repeatinterval -selectbackground -selectborderwidth -selectforeground -state -takefocus -textvariable -to -validate -validatecommand -values -vcmd -width -wrap -xscrollcommand}}}}
{::Spinbox instproc delete} {0 -1}
{::Spinbox instproc get} {0 -1}
{::Spinbox instproc icursor} {0 -1}
{::Spinbox instproc identify} {0 -1}
{::Spinbox instproc index} {0 -1}
{::Spinbox instproc insert} {0 -1}
{::Spinbox instproc invoke} {0 -1}
{::Spinbox instproc scan} {0 -1}
{::Spinbox instproc selection} {0 -1}
{::Spinbox instproc set} {0 -1}
{::Spinbox instproc validate} {0 -1}
{::Spinbox instproc xview} {0 -1}
{::Text instproc bbox} {0 -1}
{::Text instproc cget} {{unknown {{enum -autoseparators -background -bd -bg -blockcursor -borderwidth -cursor -endline -exportselection -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -inactiveselectbackground -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -maxundo -padx -pady -relief -selectbackground -selectborderwidth -selectforeground -setgrid -spacing1 -spacing2 -spacing3 -startline -state -tabs -tabstyle -takefocus -undo -width -wrap -xscrollcommand -yscrollcommand}}}}
{::Text instproc compare} {{boolean string {{enum < <= == >= > !=}} string}}
{::Text instproc configure} {list {void {{option -autoseparators unknown -background color -bd pixel -bg color -blockcursor unknown -borderwidth pixel -cursor unknown -endline unknown -exportselection boolean -fg color -font string -foreground color -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -inactiveselectbackground unknown -insertbackground color -insertborderwidth pixel -insertofftime int -insertontime int -insertwidth pixel -maxundo unknown -padx pixel -pady pixel -relief {enum raised sunken flat ridge solid groove} -selectbackground color -selectborderwidth pixel -selectforeground color -setgrid boolean -spacing1 unknown -spacing2 unknown -spacing3 unknown -startline unknown -state unknown -tabs unknown -tabstyle unknown -takefocus boolean -undo unknown -width unknown -wrap unknown -xscrollcommand script -yscrollcommand script}}} {list {{enum -autoseparators -background -bd -bg -blockcursor -borderwidth -cursor -endline -exportselection -fg -font -foreground -height -highlightbackground -highlightcolor -highlightthickness -inactiveselectbackground -insertbackground -insertborderwidth -insertofftime -insertontime -insertwidth -maxundo -padx -pady -relief -selectbackground -selectborderwidth -selectforeground -setgrid -spacing1 -spacing2 -spacing3 -startline -state -tabs -tabstyle -takefocus -undo -width -wrap -xscrollcommand -yscrollcommand}}}}
{::Text instproc count} {{int {? {option -chars {} -displaychars {} -displayindices {} -displaylines {} -indices {} -lines {} -xpixels {} -ypixels {}}} string string}}
{::Text instproc debug} {0 -1}
{::Text instproc delete} {{void {string index} {? string endIndex}}}
{::Text instproc dlineinfo} {{list {string index}}}
{::Text instproc dump} {{list {? {option -all {} -command string -image {} -mark {} -tag {} -text {} -window {}}} {string index} {? string index}}}
{::Text instproc edit} {
     {boolean {{const modified}} {? boolean}}
     {void {{const redo}}}
     {void {{const reset}}}
     {void {{const separator}}}
     {void {{const undo}}}
}
{::Text instproc get} {{string {? {option -displaychars {}}} {string index} {? string endIndex}}}
{::Text instproc image} {0 -1}
{::Text instproc index} {{string {string index}}}
{::Text instproc insert} {{void {string index} string {* string tag}}}
{::Text instproc mark} {0 -1}
{::Text instproc peer} {0 -1}
{::Text instproc replace} {{void {string index} {string index} string {* string tag}}}
{::Text instproc scan} {0 -1}
{::Text instproc search} {{string {? {option -forwards {} -backwards {} -exact {} -regexp {} -nolinestop {} -nocase {} -count {setvar int} -all {} -overlap {} -elide {} -- {}}} {string pattern} {string index} {? string stopIndex}}}
{::Text instproc see} {{void {string index}}}
{::Text instproc tag} {0 -1}
{::Text instproc window} {0 -1}
{::Text instproc xview} {0 -1}
{::Text instproc yview} {0 -1}
{::Toplevel instproc cget} {{unknown {{enum -bd -borderwidth -class -menu -relief -screen -use -background -bg -colormap -container -cursor -height -highlightbackground -highlightcolor -highlightthickness -padx -pady -takefocus -visual -width}}}}
{::Toplevel instproc configure} {list {void {{option -bd pixel -borderwidth pixel -class unknown -menu unknown -relief {enum raised sunken flat ridge solid groove} -screen unknown -use unknown -background color -bg color -colormap unknown -container unknown -cursor unknown -height unknown -highlightbackground color -highlightcolor color -highlightthickness pixel -padx pixel -pady pixel -takefocus boolean -visual unknown -width unknown}}} {list {{enum -bd -borderwidth -class -menu -relief -screen -use -background -bg -colormap -container -cursor -height -highlightbackground -highlightcolor -highlightthickness -padx -pady -takefocus -visual -width}}}}

}
array set xotclObjectsArr {
::Button {Class ::widget {}}
::Canvas {Class ::widget {}}
::Checkbutton {Class ::widget {}}
::Entry {Class ::widget {}}
::Frame {Class ::widget {}}
::Label {Class ::widget {}}
::Labelframe {Class ::widget {}}
::Listbox {Class ::widget {}}
::Menu {Class ::widget {}}
::Menubutton {Class ::widget {}}
::Message {Class ::widget {}}
::Panedwindow {Class ::widget {}}
::Radiobutton {Class ::widget {}}
::Scale {Class ::widget {}}
::Scrollbar {Class ::widget {}}
::Spinbox {Class ::widget {}}
::Text {Class ::widget {}}
::Toplevel {Class ::widget {}}

}

   my registerObject ::. ::Toplevel {} {}


    my registerTTkProcs

}
