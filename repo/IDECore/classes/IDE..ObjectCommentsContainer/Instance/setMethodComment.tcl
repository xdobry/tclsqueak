IDE::ObjectCommentsContainer instproc setMethodComment {type method text} {
    my set comment_${type}($method) $text
}
