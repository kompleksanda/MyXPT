XPTemplate priority=lang
let s:f = g:XPTfuncs()
XPTinclude
	  \ _common/common

XPT stylesheet 

XPT rule

XPT selector
`tag^

XPT declaration
`:selector:^ {
    `cursor^
}

XPT property 

XPT value 

