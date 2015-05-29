IDE::CBCodeController instproc getMethodedit {} {
    #ttc rettype xotcl IDE::MethodEditNotebook
    return [my info parent]::methodedit
}
