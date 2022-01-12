XPTemplate priority=lang

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
	  \ _common/common


XPT R synonym=Pre|execut|T
`$_xSnipName^(`arg^)

XPT Item dyn alias=R synonym=GetWrappedText|Edges|Cancel|IsChanged|StillHasPH|N|NN|V|IV|VS|IVE|V0|Phase|C|Void|VoidLine|Remove|date|datetime|time|file|fileRoot|fileExt|path|ItemEdges
XSET arg=Void()

XPT HasStep dyn alias=R synonym=Snippet
XSET arg="`name^"

XPT SV dyn alias=R
XSET arg=`pattern^, `replace^, `flag^

XPT S dyn alias=R
XSET arg=`text^, FilterText("SV", "arg", "defaultValues")

XPT ChooseStr dyn alias=R
XSET arg="`text^"` `...^, "`text^"`, `...^

XPT Choose alias=ChooseStr
XSET arg=[FilterText("ChooseStr", "arg", "defaultValues")]

XPT EchoIf dyn alias=R
XSET arg=`is_true^, `text^

XPT EchoIfEq dyn alias=R
XSET arg=`expected^, `text^

XPT ExpandIfNotEmpty dyn alias=R
XSET arg=`left^, `item^`, `right?^

XPT ExpandInsideEdge dyn alias=R synonym=ExpandInsideEdge2
XSET arg=`left^, `right^

XPT FilterText setting=_chooseXSET
XSET $(name, "defaultValues") choose inside this snippet=`name^`, `"defaultValues"^
XSET $(snipname, name, "defaultValues")=`snipname^, `name^, `filt^
XSET filt=ChooseStr('"defaultValues"', '"preValues"', '"postFilters"', '"ontypeFilters"')
`$_xSnipName^(`Snippet("_chooseXSET")^)

XPT Text text=FilterText setting=_chooseXSET
XSET $(text)=`text^
XSET $(text, {action:\.\.}=`text^, {`^}

XPT AlignL dyn alias=R "`name^`name^AlignL\(size)^
XSET arg=`size^`, "`_^"

XPT AlignR alias=AlignL "XSET name.ontype=AlignR\(size)^

XPT Restrict dyn alias=R
XSET arg=`size^

XPT BreakPick setting=_chooseXSET text=FilterText
XSET $(var, "def")="$`var^", "def"
XSET $({snip:var,\.\.}, "def")={`^}, "def"
XSET $(var, "post", V())="$`var^", "post",  V\())
XSET $({snip:var,\.\.}, "post", V())={`^}, "post", V\()

XPT RINE setting=_chooseXSET text=FilterText synonym=RIE
XSET $(expected, retval, else?)=`expected^, `retval^`, `else?^
XSET $(test, expected, retval else?)=`teststring^, `expected^, `retval^`, `else?^

XPT getVariables setting=_chooseXSET text=FilterText
XSET $() picks all variables in this snip=
XSET $(vars) picks specific variables in this snip=[$`vars^]
XSET $(snips) picks all variables in all snips=[`snips^]
XSET $(snips vars) picks specific variables in all snips=[`snips^]`, [$`vars^]

XPT getVariablesPost setting=_chooseXSET text=FilterText
XSET $(str) in this snip only=`str^
XSET $(str, snips) in all given snips=`str^, [`snip^]

XPT Setting setting=_chooseXSET text=FilterText
XSET $(snip)=`snip^
XSET $({snip:\.\.})={`^}

XPT SettingK dyn alias=R 
XSET arg=`snip^

XPT xset dyn alias=R
XSET arg=`xsetcode^`, `snip?^

XPT _query setting=_chooseXSET hidden
XSET $pick the whole settings=1
XSET $pick a variable="$`name^"
XSET $pick setting[name]="`name^"
XSET $pick others inside setting={"`tag^" : `value^}
XSET tag=ChooseStr("defaultValues","preValues","postFilters")
{`snip^, `Snippet("_chooseXSET")^}

XPT snipGS
XSET _query=Trigger("_query")
`$_xSnipName^(`_query^`, `"_unlet_"^)

XPT snipS setting=snipGS
`$_xSnipName^(`_query^, `val^)

XPT Stay dyn alias=R synonym=NextC
XSET arg=`str_OR_dict?^

XPT sCat dyn alias=R synonym=Echo|EchoIfNoChange|Build|BuildSnippet|BuildIfChanged|BuildIfNoChange|Next
XSET arg="`str..^"

XPT Trigger dyn alias=R synonym=Finish|UpperCase|LowerCase
XSET arg=`str^

XPT X dyn alias=R synonym=Z|XS|ZS
XSET arg=`str^`, `ret_str?^

XPT MergeSSetting dyn alias=R
XSET arg=`snip..^

XPT ACM synonym=ACMB
`$_xSnipName^({"`reg_exps^":"`str^"})

XPT AC setting=_chooseXSET synonym=ACB
XSET $str, str="`str...^"
XSET ${reg_exp, str}={"`reg_exp^", "`str^"}
`$_xSnipName^(`Snippet("_chooseXSET")^)

XPT pickL
`$_xSnipName^(`arg^)

XPT PrevItem dyn alias=R
XSET arg=`n^

XPT Vmatch dyn alias=R
XSET arg=`reg_exps..^

XPT Commentize dyn alias=R
XSET arg="`text^"

XPT ItemCreate dyn alias=R
XSET arg=`name^, `edges..^, `filters..^
XSET edges\.\..post=BuildIfNoChange('{"left" : `left^, "right" : `right^}')
XSET filters\.\..post=BuildIfNoChange('{"post" : `post^}')

XPT ExpandIfNotEmpty dyn alias=R
XSET arg=`sep^, `item^`, `right?^

XPT AutoCmpl dyn alias=R
XSET arg=`keepInPost_bool^, `str..^


