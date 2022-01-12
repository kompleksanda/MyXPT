XPTemplate priority=lang
let s:f = g:XPTfuncs()
XPTinclude
	  \ _common/common

XPT prop
XSET $_preValues_={"name":1,"prop":1}
`name^NextC($_xCssName)^: `prop^NextC(_xCssProp(R('name')))^;
XPT color
XSET color=Choose(["red","green","blue","orange","yellow","brown","pink","grey","white","indigo","violet","aqua","slate","purple","black","rose","azure","chocolate","crimson","magenta","salmon","fuchsia","gold","khaki"])
XSET color.post=Build(V())
`color^

XPT flex
XSET $flex align its children on cross axis
display: flex;
align-items: center;
XSETm END
XSET $flex align its children on cross axis within a spacious parent
display: flex;
flex-wrap: wrap;
height: 400px;
align-content: space-between;
XSETm END
XSET $flex align its children on main axis
display: flex;
justify-content: center;
XSETm END
XSET $flex align child on cross axis
align-self: center;
XSETm END
XSET $flex with gap, row or column
display: flex;
flex-wrap: wrap;
row-gap: 10px;
column-gap: 2em;
//gap 10px;
XSETm END

XPT grid
XSET $grid align its children on cross axis and main axis
display: grid;
grid-template-columns: 120px 120px 120px;
align-items: start;
justify-content: space-between;