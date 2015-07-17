TclExprParser instproc getNextToken {} {
    my instvar stream parser elem
    $parser skipBlanks
    set exprRest [$stream getRest]
    #puts "exprRest '$exprRest'"

    if {$exprRest eq ""} {
        return {}
    }
    #{^[0-9]+} {
    #   set tokenType value
    #}

    switch -regexp -matchvar hit -- $exprRest {
        {^0[xbo][0-9]+} {
            # hex binar and octal
            set tokenType value
        }
        {^([0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?|[0-9]+\.)} {
            # double
            set tokenType value
        }
        {^(round|wide|sqrt|sin|log10|double|hypot|atan|bool|rand|abs|acos|atan2|entier|srand|sinh|log|floor|tanh|tan|isqrt|int|asin|min|ceil|cos|cosh|exp|pow|max|fmod)} {
            set tokenType funct
        }
        {^(==|ne|\*\*|!=|ni|\|\||<<|<=|>=|&&|>>|eq|in|[!%&*+|<\-^>~?/:])} {
            set tokenType op
        }
        {^\(} {
            set tokenType (
        }
        {^,} {
            set tokenType ,
        }
        {^\)} {
            set tokenType )
        }
        {^:} {
            set tokenType :
        }
        {^\$} {
            set selem [$parser getVariable $elem]
            if {$selem eq ""} {
                my addError "unknown part $exprRest"
                return
            }
            $elem addElem $selem
            return [list $selem value]
        }
        {^\[} {
            set selem [$parser getBeginingCommandSubstPure $elem]
            $elem addElem $selem
            return [list $selem value]
        }
        {^"} {
            set selem [$parser getQuoted $elem]
            $elem addElem $selem
            return [list $selem value]
        }
        {\{} {
            set selem [$parser getNoSubst $elem]
            $elem addElem $selem
            return [list $selem value]
        }
        default {
            my addError "unknown part $exprRest"
            return
        }
    }
    set tokenValue [lindex $hit 0]
    #puts "tok value $tokenValue"
    set end [$stream pos]
    incr end [string length $tokenValue]
    incr end -1
    set literal [PrsLiteral new -childof $elem -begin [$stream pos] -end $end]
    $elem addElem $literal
    $stream addPos [string length $tokenValue]
    return [list $literal $tokenType]
}
