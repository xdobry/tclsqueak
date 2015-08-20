CoreSignatureRepository instproc registerXotclCoreMethods {} {
    my instvar methodsArr commandsArr
    # def specification
    # signature = {xotclclass method} min-arguments max-arguments options types subcommands
    # types = return_type arg1_type arg2_type ...
    # subcommand = signature

    # types
    # unknown list elem string int numeric boolean texpr body def
    # "ref" for variable refernce for example {ref string} - name of variable that holds string
    # def is used for define variable without known type as for "global"
    # ref - requires defined variable
    # setret - set the reference of name
    # wref - do not requires defined variable (weak ref)

    array set methodsArr {
{::xotcl::Class instproc allinstances} {{{{list xotcl} {}}}}
{::xotcl::Class instproc alloc} {{{xotcl {}} {string {}}}}
{::xotcl::Class instproc create} {{{xotcl {}} {string {}} {* unknown}}}
{::xotcl::Class instproc info} {
  {{{list xotcl} {}} {{const classchildren}} {? string {}}}
  {{xotcl {}} {{const classparent}}}
  {{{list xotcl} {}} {{const heritage}} {? string {}}}
  {{{list xotcl} {}} {{const instances}} {? {option -closure {}}} {? string {}}}
  {{list {}} {{const instargs}} {string {}}}
  {{body {}} {{const instbody}} {string {}}}
  {{list {}} {{const instcommands}} {? string {}}}
  {{string {}} {{const instdefault}} {string {}} {string {}} {wref {}}}
  {{{list xotcl} {}} {{const instfilter}}}
  {{xotcl {}} {{const instfilterguard}} {string {}}}
  {{list {}} {{const instforward}} {? {option -definition string}} {string {}}}
  {{unknown {}} {{const instinvar}}}
  {{{list xotcl} {}} {{const instmixin}} {string {}}}
  {{{list xotcl} {}} {{const instmixinof}} {? {option -closure {}}} {? string}}
  {{list {}} {{const instnonposargs}} {string {}}}
  {{body {}} {{const instpost}} {string {}}}
  {{body {}} {{const instpre}} {string {}}}
  {{list {}} {{const instprocs}} {? string {}}}
  {{{list xotcl} {}} {{const mixinof}} {? {option -closure {}}} {? string pattern}}
  {{list {}} {{const parameter}}}
  {{{list xotcl} {}} {{const subclass}} {? {option -closure {}}} {? string pattern}}
  {{{list xotcl} {}} {{const superclass}} {? {option -closure {}}} {? string pattern}}
  {{list {}} {{const args}} {string {}}}
  {{string {}} {{const body}} {string {}}}
  {{xotcl {}} {{const class}}}
  {{{list xotcl} {}} {{const children}} {string {}}}
  {{list {}} {{const commands}} {string {}}}
  {{string {}} {{const default}} {string {}} {string {}} {wref {}}}
  {{list {}} {{const filter}} {? {option -guard {} -order {}}}}
  {{xotcl {}} {{const filterguard}} {string {}}}
  {{{list xotcl} {}} {{const forwards}} {? {option -definition string}} {string {}}}
  {{boolean {}} {{const hasNamespace}}}
  {{list {}} {{const info}} {string {}}}
  {{string {}} {{const invar}}}
  {{{list string} {}} {{const methods}} {? {option -nocmds {} -noprocs {} -nomixins {}}} {string {}}}
  {{list {}} {{const mixin}} {? {option -guard {} -order {}}} {string {}}}
  {{{list string} {}} {{const nonposargs}} {string {}}}
  {{{list string} {}} {{const parametercmd}} {string {}}}
  {xotcl {{const parent}}}
  {{string {}} {{const post}} {string {}}}
  {{string {}} {{const pre}} {string {}}}
  {{{list string} {}} {{const procs}} {string {}}}
  {{{list xotcl} {}} {{const precedence}} {? {option -intrisic {}}} {string {}}}
  {{{list string} {}} {{const vars}} {string {}}}
}
{::xotcl::Class instproc instdestroy} {{{void {}}}}
{::xotcl::Class instproc instfilter} {{{void {}}}}
{::xotcl::Class instproc instfilterguard} {{{void {}}}}
{::xotcl::Class instproc instforward} {{{void {}}}}
{::xotcl::Class instproc instinvar} {{{void {}}}}
{::xotcl::Class instproc instmixin} {
    {{{list xotcl {}}}}
    {void xotcl}
    {void {{enum assign get add delete}} {+ xotcl}}
}
{::xotcl::Class instproc instparametercmd} {{{void {}} {string {}}}}
{::xotcl::Class instproc instproc} {{{void {}} string {+ unknown}}}
{::xotcl::Class instproc new} {{{xotcl {}} {* unknown}}}
{::xotcl::Class instproc parameter} {{{void {}} {list {}}}}
{::xotcl::Class instproc parameterclass} {{{void {}} {xotcl {}}}}
{::xotcl::Class instproc recreate} {{{void {}} {xotcl {}} {* unknown}}}
{::xotcl::Class instproc superclass} {{{void {}} {{list xotcl} {}}}}
{::xotcl::Object instproc append} {{{string {}} {{ref string} {}} {string {}}}}
{::xotcl::Object instproc array} {
  {boolean {{const anymore}} string searchid}
  {void {{const donesearch}} string searchid}
  {boolean {{const exists}} string}
  {list {{const get}} string {? string pattern}}
  {list {{const names}} string {? enum -glob -regexp -exact} {? string pattern}}
  {string {{const nextelement}} {{ref array}} searchid}
  {void {{const set}} string list}
  {{int {}} {{const size}} string}
  {searchid {{const startsearch}} string}
  {void {{const unset}} string {? string pattern}}
  {unknown {{const statistics}} string}
}
{::xotcl::Object instproc autoname} {{{string {}} {string {}}}}
{::xotcl::Object instproc check} {1 1}
{::xotcl::Object instproc class} {{{void {}} {xotcl {}} {* unknown}}}
{::xotcl::Object instproc cleanup} {{{void {}}}}
{::xotcl::Object instproc configure} {{{void {}} {* unknown}}}
{::xotcl::Object instproc contains} {{{void {}} {? {option -withnew {} -object {xotcl} -class {xotcl}}} {body {}}}}
{::xotcl::Object instproc copy} {{{void {}} {string {}}}}
{::xotcl::Object instproc destroy} {{{void {}}}}
{::xotcl::Object instproc eval} {1 -1}
{::xotcl::Object instproc exists} {{boolean string}}
{::xotcl::Object instproc extractConfigureArg} {2 3}
{::xotcl::Object instproc filter} {0 -1}
{::xotcl::Object instproc filterguard} {2 2}
{::xotcl::Object instproc filtersearch} {1 1}
{::xotcl::Object instproc forward} {0 -1}
{::xotcl::Object instproc getExitHandler} {{{void {}}}}
{::xotcl::Object instproc hasclass} {{{boolean {}} {string {}}}}
{::xotcl::Object instproc incr} {{{int {}} {unknown {}} {int {}}}}
{::xotcl::Object instproc info} {
  {{list {}} {{const args}} {string {}}}
  {{string {}} {{const body}} {string {}}}
  {{xotcl {}} {{const class}} {? string {}}}
  {{{list xotcl} {}} {{const children}} {? string {}}}
  {{list {}} {{const commands}} {? string {}}}
  {{string {}} {{const default}} {string {}} {string {}} {wref {}}}
  {{list {}} {{const filter}} {? {option -guard {} -order {}}}}
  {{xotcl {}} {{const filterguard}} {string {}}}
  {{{list xotcl} {}} {{const forwards}} {? {option -definition string}} {string {}}}
  {{boolean {}} {{const hasNamespace}}}
  {{list {}} {{const info}} {string {}}}
  {{string {}} {{const invar}}}
  {{{list string} {}} {{const methods}} {? {option -nocmds {} -noprocs {} -nomixins {}}} {? string {}}}
  {{list {}} {{const mixin}} {? {option -guard {} -order {}}} {string {}}}
  {{{list string} {}} {{const nonposargs}} {string {}}}
  {{{list string} {}} {{const parametercmd}} {string {}}}
  {xotcl {{const parent}}}
  {{string {}} {{const post}} {string {}}}
  {{string {}} {{const pre}} {string {}}}
  {{{list string} {}} {{const procs}} {? string {}}}
  {{{list xotcl} {}} {{const precedence}} {? {option -intrisic {}}} {? string {}}}
  {{{list string} {}} {{const vars}} {? string {}}}
}
{::xotcl::Object instproc instvar} {{{void {}} {+ unknown}}}
{::xotcl::Object instproc insvar} {{{void {}} {+ unknown}}}
{::xotcl::Object instproc isclass} {{{boolean {}} {unknown {}}}}
{::xotcl::Object instproc ismetaclass} {{{boolean {}} {unknown {}}}}
{::xotcl::Object instproc ismixin} {{{boolean {}} {string {}}}}
{::xotcl::Object instproc isobject} {{{boolean {}} {unknown {}}}}
{::xotcl::Object instproc istype} {{{boolean {}} {xotcl {}}}}
{::xotcl::Object instproc lappend} {{{list {}} {{setref list} {}} {+ unknown}}}
{::xotcl::Object instproc mixin} {0 -1}
{::xotcl::Object instproc move} {{{void {}} {string {}}}}
{::xotcl::Object instproc noinit} {{{void {}}}}
{::xotcl::Object instproc parametercmd} {{{void {}}}}
{::xotcl::Object instproc proc} {{{void {}} {string {proc name}} {list args} {unknown body} {* unknown}}}
{::xotcl::Object instproc procsearch} {{{list {}} {string {}}}}
{::xotcl::Object instproc requireNamespace} {{{void {}}}}
{::xotcl::Object instproc self} {0 -1}
{::xotcl::Object instproc set} {{{unknown {}} {{wref unknown} {}} {? unknown}}}
{::xotcl::Object instproc setExitHandler} {{{void {}} {body {}}}}
{::xotcl::Object instproc subst} {{{string {}} {string {}}}}
{::xotcl::Object instproc trace} {
  {unknown {{const variable}} unknown unknown unknown {? unknown} {? unknown} {? unknown}}
  {unknown {{const vdelete}} unknown unknown unknown {? unknown} {? unknown} {? unknown}}
  {unknown {{const vinfo}} unknown {? unknown}}
  {unknown {{const add}} unknown unknown unknown unknown {? unknown} {? unknown} {? unknown} {? unknown} {? unknown}}
  {unknown {{const remove}} unknown unknown unknown unknown unknown {? unknown} {? unknown} {? unknown} {? unknown} {? unknown}}
  {unknown {{const info}} unknown unknown unknown {? unknown} {? unknown} {? unknown}}
}
{::xotcl::Object instproc unset} {1 -1}
{::xotcl::Object instproc uplevel} {1 -1}
{::xotcl::Object instproc upvar} {2 -1}
{::xotcl::Object instproc volatile} {{{void {}}}}
{::xotcl::Object instproc vwait} {1 1}
    }

    my registerObject ::xotcl::Class Class ::xotcl::Object {}
    my registerObject ::xotcl::Object Class {} {}
    my registerObject ::xotcl::Attribute Class ::xotcl::Object {}

    array set commandsArr {
::xotcl::my {0 -1}
::xotcl::self {0 -1}
::xotcl::next {0 -1}
::xotcl::myproc {0 -1}
::xotcl::myvar {0 -1}
::xotcl::@ {0 -1}
    }

    my addNamespaceExport ::xotcl {Object Class self next my @ myproc myvar Attribute}
    my addNamespaceImport {} ::xotcl::*
}
