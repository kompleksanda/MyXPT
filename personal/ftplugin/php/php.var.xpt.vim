XPTemplate priority=lang

XPT cv
$`name^ = `cursor^;
XPT cvs
$`name^ = "`cursor^";
XPT cvl
$`name^ = array(`value^ExpandInsideEdge2(", ","")^^);
XPT cvd
$`name^ = array(`key^ => `value^` `...ANODA{{^, `key^ => `value^` `...ANODA^`}}^);
XPT dv
unset($``cursor^);
XPT cc
define("`name^UpperCase(V())^", `cursor^);