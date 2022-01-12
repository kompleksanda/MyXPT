XPTemplate priority=lang-2
"call g:XPTaddBundle( 'java', 'android' )

XPT s abbr
super.`^
XPT t abbr
this.

XPT _java_params hidden
XSET $_types_=int String void byte short long float boolean char Character String
XSET type=split($_types_)
XSET type.post=sCat(V(),'` ^ChooseStr("[\`\^]","...")^')
`param...{{^`type^ `name^`, `paramN...{{^, `type^ `name^`, `paramN...^`}}^`}}^

XPT _java_string dyn hidden
XSET string.ontype=ACMB({'\V\^\s\*\zs"\$':'"`^"` `stringAfter^', "\\V\\^\\s\\*\\zs'\\$":"'`^'` `stringAfter^", '\V\^\S\+\s\*\zs+\$' : '+ `string^'})
XSET stringAfter.ontype=ACMB({'\V\^\s\*\zs+\$' : '+ `string^'})
`string^

XPT _java_array dyn hidden
XSET val\.\..post=RIE([""], "", RIE([N()], "`, `val^`, `val..^", V() . "`, `val..^"))
XSET array.ontype=ACMB({ '\V\^\s\*\zs{\$' : '{`:_java_args:^}' })
`array^

XPT val setting=_java_string|_java_array
XSET val.ontype=ACMB({'\V\^\s\*\zs"\$':'"`^"` `stringAfter^', "\\V\\^\\s\\*\\zs'\\$":"'`^'` `stringAfter^", '\V\^\s\*new\s\+\w\+\s\*\zs(\$':'(`:_java_args:^);', '\V\^\s\*\zs{\$': '{`val^`, `val..^}'})
`val^

XPT _java_args
`:val:^`, `val..^

XPT var dyn setting=_java_params
XSET modifier=ChooseStr("private","public","protected","static","final")
XSET modifier.post=RIE([""], "", V() . " `modifier^")
XSET name.pre=name 
XSET type.post=sCat(V(),"`[` `]^")
XSET  .post=RIE(" ", "[]")
`modifier^`type^ `name^ACMB({'\V\\\^\S\+\s\*\zs=\$' : XS('if T(R(" "))[-1:-1] == "]"|return "= {\`:_java_args:\^}"|el|return "= \`:val:\^"|en')})^

XPT fun setting=var
`modifier^`type^ `name^(`:_java_params!!:^){
    `cursor^
}

XPT funn
`Include:fun^

XPT class
XSET className2.post=ReturnIfNotEq(["className2",""], V() . "`, `className2^", "")
public` `abstract^ class `className^` `EXTENDS...{{^ extends `className^`}}^` `IMPLEMENTS...{{^ implements `className2^`}}^{
    public `className^(`:_java_params:^){
        `cursor^
    }
}

XPT println
System.out.println(`:_java_string:^)

XPT mainclass synonym=mc
public class `fileRoot()^ {
    `Include:main^
}

XPT enum " public enum { .. }
``public` ^enum `enumName^
{
    `elem^` `...^`,Echo("\n")`subElem`^` `...^
}

XPT import
import

XPT instanceof
`a^ instanceof `b^

XPT try wrap=what
XSET handler=$CL handling $CR
XSETm $Exception!!
ArithmeticException Arithmetic error, such as divide-by-zero=ArithmeticException
ArrayIndexOutOfBoundsException Array index is out-of-bounds=ArrayIndexOutOfBoundsException
ArrayStoreException Assignment to an array element of an incompatible type=ArrayStoreException
ClassCastException Invalid cast=ClassCastException
IllegalArgumentException Illegal argument used to invoke a method=IllegalArgumentException
IllegalMonitorStateException Illegal monitor operation, such as waiting on an unlocked thread=IllegalMonitorStateException
IllegalStateException Environment or application is in incorrect state=IllegalStateException
IllegalThreadStateException Requested operation not compatible with current thread state=IllegalThreadStateException
IndexOutOfBoundsException Some type of index is out-of-bounds=IndexOutOfBoundsException
NegativeArraySizeException Array created with a negative size=NegativeArraySizeException
NullPointerException Invalid use of a null reference=NullPointerException
NumberFormatException Invalid conversion of a string to a numeric format=NumberFormatException
SecurityException Attempt to violate security=SecurityException
StringIndexOutOfBounds Attempt to index outside the bounds of a string=StringIndexOutOfBounds
UnsupportedOperationException An unsupported operation was encountered=UnsupportedOperationException
reqFiveWayNavSpecify true for this attribute if you require an input device capable of navigating up, down, left, and right and of clicking the current selection. Thisincludes both trackballs and directional pads (D-pads).=android:reqFiveWayNav="true"
reqHardKeyboard — If your application requires a hardware keyboard, specify true.=android:reqHardKeyboard="true"
reqKeyboardType — Lets you specify the keyboard type as one of nokeys, qwerty,twelvekey, or undefined.=android:reqKeyboardType="`reqKeyboardType^ChooseStr("nokeys","qwerty","twelvekey","undefined)^"
reqNavigation — Specify the attribute value as one of nonav, dpad, trackball,wheel, or undefined as a required navigation device.=android:reqNavigation="`reqNavigation^ChooseStr("nonav","dpad","trackball","wheel","undefined")^"
reqTouchScreen — Select one of notouch, stylus, finger, or undefined to specifythe required touchscreen input.=android:reqTouchScreen="`reqTouchScreen^ChooseStr("notouch","stylus","finger","undefined")^"
XSETm END
try
{
    `what^
}` `catch...^
XSETm catch...|post

catch (`Exception!!^ `e^)
{
    `handler^
}` `catch...^
XSETm END
`finally...{{^finally
{
    `cursor^
}`}}^

XPT throw
XSET Exception=BreakPick({"try":"$Exception!!"}, "def")
XSET Exception.post=BreakPick({"try":"$Exception!!"}, "post", V())
XSET exception.ontype=ACMB({'\V\s\*new\zs \$':' `Exception^(`^);'})
throw `exception^

XPT interface
XSET $_import_={"class":{"postFilters":"className2"}}
XSET $_preValues_={"intBody":""}
XSET $_intBody_=ACMB\({'\V\^f\%[u\]\\$':'function `name^(`$`param`^);\n`intBody^'})
XSET intBody.ontype=ZS($_intBody_)
interface `intName^` `EXTENDS...{{^ implements `className2^`}}^{
    `intBody^
}
