XPTemplate priority=lang

let s:f = g:XPTfuncs()

call g:XPTaddBundle( 'python', 'django' )

XPTinclude
	  \ _common/common

XPT cv 
`name^ = `cursor^

XPT cvl dyn alias=cv
XSET cursor=`close^`args^`close2^
XSET close=ChooseStr("[","(")
XSET args.post=ExpandInsideEdge(", ", "")
XSET $close2=if T\(R\("close")) == "("|retu")"|el|retu"]"|en
XSET close2=XS($close2)

XPT cvd dyn alias=cv 
XSET cursor={`args^}
XSET args=`name^ : `value^`, `MORE^
XSET MORE.post=BuildIfNoChange(', `args^')
