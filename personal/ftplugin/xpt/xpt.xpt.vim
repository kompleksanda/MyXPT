XPTemplate priority=lang

let s:f = g:XPTfuncs()

XPT xset
XSETm $value
if xfunc.R\('m') == "" && xfunc._ctx.renderContext.phase != "rendering"
	return "=`cursor^"
else
	return "\n`cursor^\nXSETm END"
endif
XSETm END
XSET name.pre=name
\XSET`m^ `name^ACM({'\^.\+\.\zspo':'post','\^.\+\.\zspr':'pre','\^.\+\.\zsd':'def','\^.\+\.\zso':'ontype'})^`value^X($value)^
