IDE::RegexpBrowser proc initDefaults {} {
    if {[my exists initialized]} return
    my set initialized 1
    global tcl_platform
    my createLogoImage
    my set version 3.0
    my set geometry            800x600+0+0
    # main font used to display the text
    if {$tcl_platform(platform) == "windows"} {
        my set font_regexp     {Courier 10}
        my set font_replace    {Courier 10}
        my set font_sample     {Courier 10}
    } else {
        my set font_regexp		9x15
        my set font_replace	9x15
        my set font_sample		9x15
    }
    # the font used in the popup menu (use ---- to get a separator, else format is {font size ?bold?}
    my set fonts 				{{Courier 8} {Courier 9} {Courier 10} {Courier 11} {Courier 12}
    ----
    {Arial 8} {Arial 9} {Arial 10} {Arial 11} {Arial 12}
    ----
    8x13 8x13bold 9x15 9x15bold 10x20}
    # the colors for the different matching groups
    my set colors              {#ff0000 #0000ff darkgreen violetred #ff9000 #537db9 #e4c500     firebrick darkgoldenrod hotpink}
    my set bgcolors            {#ffe6e6 #e6e6ff #e6ffe6   #efd5e1   #fef3e5 #d6dce5 lightyellow white    white        white}
    # use background color in sample by default ? (1 use, 0 do not use)
    my set background			0
    # background color to visualize the non-reporting group (?:...)
    my set color_noreport      #fffdc4
    # background color to visualize the lookhead group (?=...) and (?!...)
    my set color_lookahead     wheat
    # show/hide help about control characters in regexp
    my set show_help			0
    # show/hide history windows on startup
    my set history				0
    # mode to use on startup (select/concat = raw, select/insert new lines = nl, replace = replace)
    my set mode				replace
    # database of some regexp to appear in the "Insert regexp" menu
    my set regexp_db {
        "URL"			{(?:^|")(http|ftp|mailto):(?://)?(\w+(?:[\.:@]\w+)*?)(?:/|@)([^"\?]*?)(?:\?([^\?"]*?))?(?:$|")}
        "IP numbers" 	{[12]?[0-9]?[0-9](\.[12]?[0-9]?[0-9]){3}}
        "HTML tags"		{<[^<>]+>}
        "HTML tag content" {<(\w+)[^>]*?>(.*?)</\1>}
        "vars and arrays (PHP)" {\$[^0-9 ]{1}[a-zA-Z0-9_]*((?:\[[a-zA-Z0-9_'\"]+\])*)}
        "dd/mm/yyyy"	{(0[1-9]|[12][0-9]|3[01])(/|-)(0[1-9]|1[12])(/|-)[12][0-9]{3}}
        "mm/dd/yyyy"	{(0[1-9]|1[12])(/|-)(0[1-9]|[12][0-9]|3[01])(/|-)[12][0-9]{3}}
        "hh:mm"			{([01][0-9]|2[0-3]):[0-5][0-9]}
        "user@domain.net" {[A-Za-z0-9_.-]+@([A-Za-z0-9_]+\.)+[A-Za-z]{2,4}}
    }
}
