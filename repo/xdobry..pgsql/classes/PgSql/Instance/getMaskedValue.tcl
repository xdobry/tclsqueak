PgSql instproc getMaskedValue {value type} {
    if {$type eq "datetime" || $type eq "timestamp"} {
        return [my getTimeValue $value]
    } elseif {$type eq "boolean"} {
        if {$value} {
            return true
        } else {
            return false
        }
    } elseif {$type eq "longblob"} {
        return [my maskBytea $value]
    } elseif {[my needEscape $type]} {
        return '[my escape $value]'
    } else {
        return $value
    }
}
