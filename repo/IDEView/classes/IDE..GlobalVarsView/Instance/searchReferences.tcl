IDE::GlobalVarsView instproc searchReferences actual {
     set endName [namespace tail $actual]
     IDE::MethodBrowser searchTextAll $endName
}
