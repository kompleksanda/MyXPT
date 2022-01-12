XPTemplate priority=sub-

let s:f = g:XPTfuncs()

fun! s:f.LM()
	return "`"
endfunction
fun! s:f.RM()
	return "^"
endfunction


XPT XSET dyn
XSET event.ontype=AC('post','ontype','def','pre')
\XSET`m^ `key^`.`event^`m^RIE("","=","\n")^`value^`m^RIE("","","\nXSETm END")^
`next^BuildSnippet("XSET")^^

XPT _xset_ hidden alias=XSET
XSET m.def=Next("")

XPT _xset_m hidden alias=XSET
XSET m.def=Next("m")

XPT xpt dyn
XSET options.pre=_
XSET options.ontype=ACMB({'\V\^\zsa\$':'alias=`val^ `options^','\V\^\zssy\$':'synonym=`val^ `options^','\V\^\zsse\$':'setting=`val^ `options^','\V\^\zst\$':'text=`val^ `options^','\V\^\zsw\$':'wrap=`val^ `options^','\V\^\zsd\$':'dyn `options^'})
\XPT `name^ `options^
XSET sniptext.ontype=ACMB({'\V\^XSET\zs \$':Trigger("_xset_"), '\V\^XSETm\zs \$':Trigger("_xset_m")})
`sniptext^

XPT xx dyn
XSET ComeFirst=n r
XSET RM=^
`l^RIE(R("r"),"","\`LM()\`l\^",'\'.LM()."\`l\^")^\``n^`LM()`r^\^``f`RM()^`RM^RIE(R("f"),"","","\`RM\^")^

XPT inctemp "`:name:^
\``Include:^`name^`:^\^

XPT XPTemplate 
XSET priority=ChooseStr("all", "spec", "like", "lang", "sub", "personal")
XPTemplate priority=`priority^

XPT exp
\`\``init_text^\`{{\^`content^\`}}\^

XPT rep 
\``init_text^...\^`content^\``init_text^...\^

XPT var 
XPTvar $`name^ `value^

XPT brif "`\$BRif^
\`$BRif\^

XPT brloop "`\$BRloop^
\`$BRloop\^

XPT brfun "`\$BRfun^
\`$BRfun\^

XPT brel "`\$BRel^
\`$BRel\^
