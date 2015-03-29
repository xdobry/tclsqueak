CoreSignatureRepository instproc registerItcl {} {
    my instvar commandsArr methodsArr


    array set commandsArr {
::itcl::class {{{void docu} {string name} {string body}}}
::itcl::body {{{void docu} {string itcl-class} {list arguments} {string body}}}
::itcl::code {{{script docu} {+ unknown args}}}
::itcl::delete {{{void docu} {{enum object class namespace}} {+ string elem}}}
::itcl::is {
    {boolean {{const class}} {string class}}
    {boolean {{const object}} {? {option -class string}} {string object}}
}
::itcl::find {
    {list {{const classes}} {? string pattern}}
    {list {{const objects}} {? string pattern} {? {option -class string -isa string}}}
}
::itcl::ensemble {1 -1}
::itcl::scope {{string string}}
::itcl::configbody {2 2}
::itcl::local {{class string {* unknown args}}}
   }

    array set methodsArr {
{::itcl::object instproc configure} {0 -1 {} {list}}
{::itcl::object instproc cget} {1 1 {} {unknown}}
{::itcl::object instproc isa} {1 1 {} {boolean}}
{::itcl::object instproc info} {0 0 {} {} {
    {class 0 0 {} {xotcl}}
    {inherit 0 0 {} {list}}
    {heritage 0 0 {} {list}}
    {function 0 -1 {} {unknown}}
    {variable 0 -1 {} {unknown}}
    }}
}
    #my registerObject ::itcl::class ::itcl::class ::itcl::object {}
    my registerObject ::itcl::object ::itcl::class {} {}

    my addNamespaceExport ::itcl {body class code configbody delete delete_helper ensemble find local scope}

}
