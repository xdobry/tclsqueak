IDE::MethodBrowser proc searchBreakPoints {} {
    my searchTextAll {([^#]\[self\]|[^#]my) halt}
}
