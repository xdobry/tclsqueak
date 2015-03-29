CoreSignatureRepository instproc registerCoreProcs {} {
    my instvar commandsArr xotclObjectsArr methodsArr
    # def specification
    # signature = name min-arguments max-arguments options types subcommands
    # types = {return_type method_doc} {arg1_type arg_name} {arg2_type arg_name}
    # subcommand = signature

    # types
    # unknown list elem string int numeric boolean texpr body def
    # "ref" for variable refernce for example {ref string} - name of variable that holds string
    # def is used for define variable without known type as for "global"
    # ref - requires defined variable
    # setret - set the reference of name
    # wref - do not requires defined variable (weak ref)

    array set commandsArr {
::after {
  {unknown {{const ms}}}
  {unknown {{const cancel}} afterid}
  {unknown {{const cancel}} {+ script}}
  {afterid {{const idle}} {+ script}}
  {list {{const info}} {? afterid}}
  {afterid {int {millisecounds}} {? script script}}
  {afterid {int {millisecounds}} {+ unknown script}}
}
::append {{{string {}} {{setref string} {}} {+ string {}}}}
::apply {1 -1}
::array {
  {boolean {{const anymore}} {{ref array}} searchid}
  {void {{const donesearch}} {{ref array}} searchid}
  {boolean {{const exists}} string}
  {list {{const get}} {{ref array}} {? string pattern}}
  {list {{const names}} {{ref array}} {? enum -glob -regexp -exact} {? string pattern}}
  {string {{const nextelement}} {{ref array}} searchid}
  {void {{const set}} {{setref array}} list}
  {{int {}} {{const size}} {{ref array} {}}}
  {searchid {{const startsearch}} {{ref array}}}
  {void {{const unset}} {{wref array}} {? string pattern}}
  {string {{const statistics}} {{ref array}}}
}
::auto_execok {{{boolean {Determines whether there is an executable file or shell builtin by the name cmd}} {string cmd}}}
::auto_import {{void {string pattern}}}
::auto_load {{void {string cmd}}}
::auto_mkindex {{void {string dir} {+ string pattern}}}
::auto_qualify {{{{list string}} {string command} {string namespace}}}
::auto_reset {{void}}
::binary {
  {string {{const format}} string {+ unknown}}
  {int {{const scan}} string string {+ {ref string}}}
}
::bgerror {{void string}}
::break {{void}}
::cd {{void {? string dirname}}}
::catch {{int unknown {? unknown} {? {setref dict}}}}
::chan {
  {boolean {{const blocked}} channelid}
  {void {{const close}} channelid}
  {list {{const configure}}}
  {string {{const configure}} {option -blocking boolean -buffering string -buffersize int -encoding string -eofchar unknown -translation unknown}}
  {void {{const copy}} channelid channelid {? {option -size int -command script}}}
  {channelid {{const create}} {unknown mode} {unknown cmdPrefix}}
  {boolean {{const eof}} channelid}
  {void {{const event}} channelId {unknown event} {? script script}}
  {void {{const flush}} channelid}
  {string {{const gets}} channelid}
  {int {{const gets}} channelid {{ref string}}}
  {list {{const names}} {? string pattern}}
  {int {{const pending}} channelid {{enum input output}}}
  {void {{const postevent}} channelid {unknown eventSpec}}
  {void {{const puts}} {? {const -nonewline}} {? channelid} string}
  {string {{const read}} channelid {? int}}
  {void {{const seek}} channelid {int offset} {? {enum start current end} origin}}
  {int {{const tell}} channelid}
  {void {{const truncate}} channelid {? int}}
}
::clock {
  {string {{const format}} int {? {option -base int -format string -gmt boolean -timezone string}}}
  {int {{const add}} int {+ unknown} {? {option -base int -format string -gmt boolean -timezone string}}}
  {int {{const clicks}}}
  {int {{const seconds}}}
  {int {{const microseconds}}}
  {int {{const milliseconds}}}
  {int {{const scan}} string {? {option -base int -format string -gmt boolean -timezone string}}}
}
::close {{{void {}} {channelid {}}}}
::concat {{list {* unknown}}}
::continue {{void}}
::dde {
  {string {{const servername}} {? {option -force {} -handler string}} {? {const --}} {? string topic}}
  {string {{const execute}} {? {option -async {}}} {string service} {string topic} {string data}}
  {string {{const poke}} {string service} {string topic} {string item} {string data}}
  {string {{const request}} {? {option -binar {}}} {string service} {string topic} {string item}}
  {{{list string}} {{const services}} {string service} {string topic}}
  {unknown {{const eval}} {? {option -async {}}} {string topic} {string cmd} {* unknown arg}}
}
::dict {
  {void {{const append}} {{ref dict}} {+ string key} {string value}}
  {dict {{const create}} {* string keyvalue}}
  {boolean {{const exists}} dict {+ string key}}
  {dict {{const filter}} dict {enum key value} {string pattern}}
  {dict {{const filter}} dict {const script} list {unknown body}}
  {void {{const for}} list dict {unknown body}}
  {unknown {{const get}} dict {+ string key}}
  {int {{const incr}} {{ref dict}} {+ string key}}
  {list {{const info}} dict}
  {{{list string}} {{const keys}} {? string pattern}}
  {void {{const lappend}}  {{ref dict}}  {+ string key} {string value}}
  {dict {{const merge}} {+ dict}}
  {dict {{const remove}} dict {+ string key}}
  {dict {{const replace}} dict {+ string keyvalue}}
  {void {{const set}} {{ref dict}} {+ string key} {string value}}
  {int {{const size}} {{ref dict}}}
  {void {{const unset}} {{ref dict}} {+ string key}}
  {unknown {{const update}} {{ref dict}} {* unknown}}
  {{{list string}} {{const values}} dict {? string pattern}}
  {unknown {{const with}} dict {+ string key} {unknown body}}
}
::encoding {
  {string {{const convertfrom}} {? string encoding} string}
  {string {{const convertto}} {? string encoding} string}
  {list {{const names}}}
  {{string encoding} {{const system}} {? string encoding}}
  {list {{const dirs}} {? unknown}}
}
::eof {{{boolean {}} {channelid {}}}}
::error {{void {string message} {? string info} {? string code}}}
::eval {1 -1}
::exec {{unknown {? {option -ignorestderr {} -keepnewline {}}} {* unknown}}}
::exit {{{void {}} {? int {return code}}}}
::expr {{{numeric {}} {+ unknown}}}
::fblocked {{unknown {? {option boolean channelid}} unknown {? unknown}}}
::fconfigure {{unknown {? {option -blocking boolean -buffering string -buffersize int -encoding string -eofchar unknown -translation string -translation unknown}} unknown {* unknown}}}
::fcopy {2 -1}
::file {
  {int {{const atime}} {string filename} {? int time}}
  {list {{const attributes}} {string filename}}
  {string {{const attributes}} {string filename} {string option}}
  {void {{const attributes}} {string filename} {+ string option}}
  {list {{const channels}} {? string pattern}}
  {void {{const copy}} {? {option -force}} {? {const --}} {+ string source} {string targetDir}}
  {void {{const delete}} {? {option -force}} {? {const --}} {+ string pathname}}
  {string {{const dirname}} {string filename}}
  {boolean {{const executable}} {string filename}}
  {boolean {{const exists}} {string filename}}
  {string {{const extension}} {string filename}}
  {boolean {{const isdirectory}} {string filename}}
  {boolean {{const isfile}} {string filename}}
  {string {{const join}} {+ string}}
  {void {{const lstat}} {string filename} {{setref array}}}
  {unknown {{const mkdir}} unknown {* unknown}}
  {int {{const mtime}} {string filename} {? int time}}
  {string {{const nativename}} {string filename}}
  {string {{const owned}} {string filename}}
  {string {{const pathtype}} {string filename}}
  {boolean {{const readable}} {string filename}}
  {string {{const readlink}} {string filename}}
  {unknown {{const rename}} unknown unknown {* unknown}}
  {string {{const rootname}} {string filename}}
  {int {{const size}} {string filename}}
  {{{list string}} {{const split}} {string filename}}
  {void {{const stat}} {string filename} {{setref array}}}
  {string {{const tail}} {string filename}}
  {string {{const type}} {string filename}}
  {list {{const volumes}}}
  {boolean {{const writable}} {string filename}}
  {unknown {{const link}} unknown {? unknown} {? unknown}}
  {string {{const normalize}} {string filename}}
  {string {{const separator}} {? string filename}}
  {list {{const system}} {string filename}}
}
::fileevent {{void channelid {enum readable writable} {? script script}}}
::flush {{{void {}} {channelid {}}}}
::for {{{void {}} {unknown {}} {texpr {}} {unknown {}} {unknown {}}}}
::foreach {{void {+ unknown}}}
::format {{{string {}} {string {format}} {* string args}}}
::gets {
    {{string {read line from channel}} {channelid {}}}
    {{int {read line from channel}} {channelid {}} {{setref string} {}}}
}
::glob {{unknown {? {option -directory string -join {} -nocomplain {} -path string -tails {} -types list}} unknown {* unknown}}}
::global {1 -1}
::history {
  {unknown {{const add}} unknown {? unknown} {? unknown}}
  {unknown {{const change}} unknown {? unknown} {? unknown}}
  {unknown {{const clear}}}
  {unknown {{const event}} {? unknown}}
  {unknown {{const info}} {? unknown}}
  {unknown {{const keep}} {? unknown}}
  {unknown {{const nextid}}}
  {unknown {{const redo}} {? unknown}}
}
::if {{{unknown {}} {texpr {}} {? {const then}} {unknown {}} {* unknown}}}
::incr {{{int {increment variable reference}} {{ref int} {}} {? int {}}}}
::info {
  {{{list string}} {{const args}} {string {proc name}}}
  {string {{const body}} {string {proc name}}}
  {int {{const cmdcount}}}
  {{{list sting}} {{const commands}} {? string pattern}}
  {boolean {{const complete}} string}
  {boolean {{const default}} {string {proc name}} {string arg} {{setref string}}}
  {boolean {{const exists}} string}
  {{{list string}} {{const globals}} {? string pattern}}
  {string {{const hostname}}}
  {list {{const level}} int}
  {int {{const level}}}
  {string {{const library}}}
  {{{list string}} {{const loaded}} {? unknown interp}}
  {{{list string}} {{const locals}} {? string pattern}}
  {string {{const nameofexecutable}}}
  {string {{const patchlevel}}}
  {{{list string}} {{const procs}} {? string pattern}}
  {string {{const script} {? string}}}
  {string {{const sharedlibextension}}}
  {string {{const tclversion}}}
  {{{list string}} {{const vars}} {? string pattern}}
  {dict {{const frame}} {? int}}
  {{{list string}} {{const functions}} {? string pattern}}
  {list {{const class}} {{const call}} class {string method}}
  {string {{const class}} {{const constructor}} class}
  {string {{const class}} {{const definition}} class {string method}}
  {string {{const class}} {{const destructor}} class}
  {list {{const class}} {{const filters}} class}
  {string {{const class}} {{const forward}} class {string method}}
  {string {{const class}} {{const instances}} class {? string pattern}}
  {list {{const class}} {{const methods}} class {? {option -all {} -private {}}}}
  {list {{const class}} {{const methodtype}} class {string method}}
  {list {{const class}} {{const mixins}} class}
  {list {{const class}} {{const subclasses}} class}
  {list {{const class}} {{const superclasses}} class}
  {list {{const class}} {{const variables}} class}
  {list {{const object}} {{const call}} class {string method}}
  {string {{const object}} {{const class}} class {? string classname}}
  {string {{const object}} {{const definition}} class {string method}}
  {list {{const object}} {{const filters}} class}
  {string {{const object}} {{const forward}} class {string method}}
  {string {{const object}} {{const name}} class}
  {string {{const object}} {{const isa}} {{enum class metaclass mixin object typeof}} class {? string arg2}}
  {list {{const object}} {{const methods}} class {? {option -all {} -private {}}}}
  {list {{const object}} {{const methodtype}} class {string method}}
  {list {{const object}} {{const mixins}} class}
  {list {{const object}} {{const namespace}} class}
  {list {{const object}} {{const variables}} class}
  {list {{const object}} {{const vars}} class {? string pattern}}
}
::interp {
  {unknown {{const alias}} unknown unknown {* unknown}}
  {list {{const aliases}} {? {class ::_TclInterp}}}
  {{{class ::_TclInterp}} {{const create}} {? {option -safe}} {? {new class ::_TclInterp} slave}}
  {void {{const delete}} {+ {class ::_TclInterp}}}
  {unknown {{const eval}} {{class ::_TclInterp}} {+ unknown}}
  {boolean {{const exists}} {{class ::_TclInterp}}}
  {void {{const expose}} {{class ::_TclInterp}} {string hiddenName} {? string exposedCmdName}}
  {void {{const hide}} {{class ::_TclInterp}} {string hiddenName} {? string hiddenCmdName}}
  {list {{const hidden}} {{class ::_TclInterp}}}
  {unknown {{const invokehidden}} {{class ::_TclInterp}} {? {option -global {} -namespace string}} {? {const --}} {string hiddenCmdName} {? unknown arg}}
  {boolean {{const issafe}} {? {class ::_TclInterp}}}
  {void {{const marktrusted}} {{class ::_TclInterp}}}
  {void {{const share}} {{class ::_TclInterp}} channelid slave}
  {{{list slave}} {{const slaves}} {? {class ::_TclInterp}}}
  {list {{const target}} {{class ::_TclInterp}} {string alias}}
  {void {{const transfer}} {{class ::_TclInterp}} channelid slave}
  {unknown {{const bgerror}} {{class ::_TclInterp}} {string cmdPrefix}}
  {boolean {{const debug}} {{class ::_TclInterp}} {? {option -frame {}}} {? boolean}}
  {int {{const limit}} {{class ::_TclInterp}} {* unknown}}
  {int {{const recursionlimit}} {{class ::_TclInterp}} {? int}}
}
::join {{{string {}} {list {}} {? string {}}}}
::lappend {{{list {}} {{setref list} {}} {+ unknown}}}
::lassign {{{void {}} {list {}} {+ setref}}}
::lindex {{{unknown {}} {list {}} {+ index {}}}}
::linsert {{{list {}} {list {}} {index {}} {+ unknown}}}
::list {{{list {create list}} {* unknown}}}
::llength {{{int {}} {list {}}}}
::load {1 3}
::lmap {{{list {}} {+ unknown}}}
::lrange {{{list {}} {list {}} {index {}} {index {}}}}
::lrepeat {{{list {create list by repeat elements}} {int {number of repeat}} unknown}}
::lreplace {{list list index index {* unknown elem}}}
::lreverse {{{list {}} {list {}}}}
::lsearch {{{unknown {}} {? {option -exact {} -glob {} -regexp {} -sorted {} -all {} -inline {} -not {} -start int -asc {} -dictionary {} -integer {} -nocase {} -real {} -decreasing {} -increasing {} -bisect {} -index int  -subindices {}}} {list {}} {unknown {}}}}
::lset {{{list {Change an element in a list}} {{ref list}} {+ index} {? unknown {new value}}}}
::lsort {{{list {}} {? {option -ascii {} -dictionary {} -integer {} -real {} -command script -increasing {} -decreasing {} -indicies {} -index list -nocase {} -unique {}}} list}}
::memory {
  {unknown {{const info}}}
  {unknown {{const trace}} unknown {? unknown}}
  {unknown {{const validate}} unknown {? unknown}}
  {unknown {{const trace_on_at_malloc}} unknown {? unknown}}
  {unknown {{const break_on_malloc}} unknown {? unknown}}
  {unknown {{const display}} unknown {? unknown}}
  {unknown {{const active}} unknown {? unknown}}
  {unknown {{const init}} unknown {? unknown}}
  {unknown {{const onexit}} unknown {? unknown}}
  {unknown {{const objs}} unknown {? unknown}}
  {unknown {{const tag}} unknown {? unknown}}
}
::namespace {
  {unknown {{const children}} {? unknown} {? unknown}}
  {unknown {{const code}} unknown {? unknown}}
  {unknown {{const current}}}
  {unknown {{const delete}} unknown {* unknown}}
  {unknown {{const eval}} unknown unknown {* unknown}}
  {unknown {{const exists}} unknown {? unknown}}
  {unknown {{const export}} {* unknown}}
  {unknown {{const forget}} unknown {* unknown}}
  {unknown {{const import}} unknown {* unknown}}
  {unknown {{const inscope}} unknown unknown {* unknown}}
  {unknown {{const origin}} unknown {? unknown}}
  {string {{const parent}} {? string}}
  {unknown {{const qualifiers}} unknown {? unknown}}
  {string {{const tail}} string}
  {unknown {{const which}} {? {option -variable {} -command {}}} {* unknown}}
  {unknown {{const ensemble}} unknown {* unknown}}
  {unknown {{const path}} {? unknown}}
  {unknown {{const upvar}} unknown {* unknown}}
  {unknown {{const unknown}} {? unknown}}
}
::open {
    {{channelid {}} {string {channelid name}} {? {enum r r+ w w+ a a+ RDONLY WRONLY RDWR APPEND BINARY CREAT
EXCL NOCTTY NONBLOCK TRUNC}}}
}
::package {
  {unknown {{const forget}} {* unknown}}
  {void {{const ifneeded}} {string package} {string version} script}
  {list {{const names}}}
  {int {{const present}} {? {option -exact {}}} {string package} {* unknown requirement}}
  {void {{const provide}} {string package} {? string version}}
  {void {{const require}} {? {option -exact {}}} {string package {? string version}}}
  {script {{const unknown}} {? script}}
  {int {{const vcompare}} {string verison} {string version}}
  {list {{const versions}} {string package}}
  {int {{const vsatisifes}} {string package} string}
  {unknown {{const prefer}} {? unknown}}
}
::parray {{{void {print array to stdout}} {{ref array} array}}}
::pid {{{int {get process id}} {? string {}}}}
::proc {{{void {define tcl procedure}} {string {}} {list {}} {unknown body}}}
::puts {{{void {write to stout or file channel}} {? {option -nonewline {}}} {? channelid channel} {string string}}}
::pwd {{{string {get current directory}}}}
::read {{{string {}} {? {option -nonewline {}}} {channelid {}} {? int {}}}}
::regexp {{unknown {? {option -about {} -expanded {} -indices {} -line {} -linestop {} -lineanchor {} -nocase {} -all {} -inline {} -start int -- {}}} unknown unknown {* unknown}}}
::registry {
  {unknown {{const brodcast}} {? {option -timeout int}} unknown {? unknown}}
  {unknown {{const delete}} unknown {? unknown} {? unknown}}
  {unknown {{const get}} unknown unknown {? unknown} {? unknown}}
  {unknown {{const keys}} unknown {? unknown} {? unknown}}
  {unknown {{const set}} unknown {? unknown} {? unknown} {? unknown}}
  {unknown {{const type}} unknown unknown {? unknown} {? unknown}}
  {unknown {{const values}} unknown {? unknown} {? unknown}}
}
::regsub {{string {? {option -all {} -expanded {} -line {} -linestop {} -lineanchor {} -nocase {} -start int -- {}}} {string expression} {string string} {string substring} {? {setref string}}}}
::rename {2 2}
::return {
    {void {? {option -errorcode string -errorinfo string -level string -options dict -code string}} {? unknown}}
}
::scan {2 -1}
::seek {{{void {}} {channelid {}} {int {}} {? {enum start current end} {origin}}}}
::set {{{unknown {}} {{wref unknown} {}} {? unknown}}}
::socket {
    {channelid {? {option -myaddr string -myport int -async {} -myaddr string -error {} -sockname {} -peername {}}} {string host} {int port}}
    {channelid {{const -server}} script {? {option -myaddr string -myport int -async {} -myaddr string -error {} -sockname {} -peername {}}} {int port}}
}
::source {1 3}
::split {{{list {}} {string {}} {? string splitChars}}}
::string {
  {int {{const bytelength}} string}
  {int {{const compare}} {? {option -nocase {} -length int}} string  string}
  {boolean {{const equal}} {? {option -nocase {} -length int}} string  string}
  {int {{const first}} string string {? int}}
  {string {{const index}} string index}
  {boolean {{const is}} {{enum alnum alpha ascii boolean control digit double false graph integer list lower print punct space true upper wideinteger wordchar xdigit}} {? {option -strict {} -failindex {setref int}}} string}
  {int {{const last}} string string {? int}}
  {int {{const length}} string}
  {{string {}} {{const map}} {? {option -nocase {}}} {list {}} {string {}}}
  {boolean {{const match}} {? {option -nocase {}}} {string pattern} string}
  {string {{const range}} string index index}
  {string {{const repeat}} string int}
  {string {{const replace}} string index index {? string}}
  {string {{const totitle}} string {? index} {? index}}
  {string {{const tolower}} string {? index} {? index}}
  {string {{const toupper}} string {? index} {? index}}
  {string {{const trim}} string {? string}}
  {string {{const trimleft}} string {? string}}
  {string {{const trimright}} string {? string}}
  {string {{const wordend}} string index}
  {string {{const wordstart}} string index}
  {string {{const reverse}} string}
}
::subst {{{string {}} {? {option -nobackslashes {} -nocommands {} -novariables {}}} {string {}}}}
::switch {{void {? {option -exact {} -glob {} -regexp {} -nocase {} -matchvar {setref {list string}} -indexvar {setref {list int}}}} {? {const --}} string {* unknown}}}
::tcl_endOfWord {2 2}
::tcl_findLibrary {6 6}
::tcl_startOfNextWord {2 2}
::tcl_startOfPreviousWord {2 2}
::tcl_wordBreakAfter {2 2}
::tcl_wordBreakBefore {2 2}
::tell {{{void {}} {channelid {}}}}
::time {{string body {? int}}}
::trace {
  {unknown {{const variable}} unknown unknown unknown}
  {unknown {{const vdelete}} unknown unknown unknown}
  {unknown {{const vinfo}} unknown}
  {void {{const add}} {{enum command execution variable}} {{enum array read write unset enter leave enterstep leavestep rename delete}} unknown}
  {void {{const remove}} {{enum command execution variable}} unknown unknown}
  {list {{const info}} {{enum command execution variable}} unknown}
}
::unknown {1 -1}
::unload {{unknown {? {option -nocomplain {} -keeplibrary {}}} unknown {* unknown}}}
::unset {{void {? {option -nocomplain}} {? {const --}} {+ unknown}}}
::update {{void {? {const idletasks}}}}
::uplevel {
    {unknown {? int level} {body script}}
    {unknown {? int level} {+ unknown scriptargs}}
}
::upvar {2 -1}
::variable {{void {* unknown}}}
::vwait {1 1}
::while {{{void {}} {texpr {}} {unknown {}}}}
::throw {{void {list type} {string message}}}
::try {1 -1}
}

    my registerObject ::_TclInterp Class {} {}


    array set methodsArr {
{::_TclInterp instproc alias} {{unknown unknown unknown {* unknown}}}
{::_TclInterp instproc aliases} {{list}}
{::_TclInterp instproc bgerror} {{unknown {string cmdPrefix}}}
{::_TclInterp instproc eval} {0 -1}
{::_TclInterp instproc expose} {0 -1}
{::_TclInterp instproc hide} {void {string hiddenName} {? string hiddenCmdName}}
{::_TclInterp instproc hidden} {{list}}
{::_TclInterp instproc invokehidden} {0 -1}
{::_TclInterp instproc issafe} {{boolean}}
{::_TclInterp instproc limit} {{int {* unknown}}}
{::_TclInterp instproc marktrusted} {0 -1}
{::_TclInterp instproc recursionlimit} {{int {? int}}}
  }

}
