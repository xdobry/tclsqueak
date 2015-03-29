proc Wikit::Format::vs {last current text} {
	variable html_frag
	set      html_frag($last$current) $text
	return
}
