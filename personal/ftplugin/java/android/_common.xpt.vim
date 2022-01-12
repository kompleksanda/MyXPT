XPTemplate priority=sub

XPTset orientation.=ChooseStr("vertical","horizontal")
XPTset layout_gravity.=ChooseStr("fill","fill_horizontal")
XPTset layout_width.=ChooseStr("fill_parent","wrap_content","match_parent")
XPTset layout_height.=ChooseStr("fill_parent","wrap_content","match_parent")

XPT _cx alias=_chooseXSET hidden
XSET _chooseXSET.post=sCat(getVariablesPost("$".V()), ReturnIfEq("","","\n".'`Snippet("_chooseXSET")^'))

XPT xml_head
<?xml version="1.0" encoding="utf-8"?>

XPT _snip hidden
`snipchoose^Z(pickL(GetVar($_xSnipName)))^
