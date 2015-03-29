proc wikireap::ns_geturl url {
    set conn [http::geturl $url]
    set html [http::data $conn]
    http::cleanup $conn
    return $html
}
