CoreSignatureRepository instproc registerTclOO {} {
    my instvar commandsArr methodsArr

    array set methodsArr {
{::oo::class instproc create} {{{class {}} {string {}} {* unknown}}}
{::oo::class instproc new} {{{class {}} {* unknown}}}
{::oo::object instproc variable} {{{void {}} {+ unknown}}}
{::oo::object instproc destroy} {{{void {}} }}
}

    my registerObject ::oo::class ::oo::class ::oo::object {}
    my registerObject ::oo::object ::oo::class {} {}

    array set commandsArr {
::oo::my {0 -1}
::oo::self {0 -1}
::oo::next {0 -1}
::oo::define {{{class {}} {string {}} {* unknown}}}
::oo::objdefine {{{class {}} {string {}} {* unknown}}}
    }

    my addNamespaceExport ::oo {class object body next my self}
    my addNamespaceImport {} ::oo::*

}
