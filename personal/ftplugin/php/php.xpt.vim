XPTemplate priority=lang

let s:f = g:XPTfuncs()

set dict+=~/vimfiles/MyXPT/personal/ftplugin/php/complete.txt

"--------------- SETTING ------------------------

XPT _interfaces_ hidden
XSET $_interfaces_=Iterator IteratorAggregate Countable SplObserver SplSubject ArrayAccess

XPT _modifier_
XSET _modifier_=ChooseStr("private","public","protected","const","static", "abstract")
XSET _modifier_.post=RIE([""], "", V() . " `_modifier_^")
`_modifier_^

XPT _iterator_funcs hidden
// ---------- ITERATOR --------------
//back to the start
public function rewind(){}
public function key(){}
// return the current value
public function current(){}
public function next(){}
//check whether object contains more entries
public function valid(){ 
    return false;
}

XPT _iteratorAggregate_funcs hidden
// ---------- ITERATOR AGGREGATE --------------
public function getIterator(){}

XPT _countable_funcs hidden
// ---------- COUNTABLE --------------
public function count(){}

XPT _arrayAccess_funcs hidden
// ---------- ARRAY ACCESS --------------
public function offsetExists($offset){}
public function offsetGet($offset){}
public function offsetSet($offset, $value){}
public function offsetUnset($offset){}

XPT _splObserver_funcs hidden
// ---------- SPL OBSERVER --------------
public function update(SplSubject $subject){}

XPT _splSubject_funcs hidden
// ---------- SPL SUBJECT --------------
public function attach (SplObserver $observer){}
public function detach (SplObserver $observer){}
public function notify (){}

"-------------- SETTING ------------------------

XPT cv setting=_modifier_
XSET $_import_={"_modifier_": {"defaultValues": "_modifier_|_modifier1_"}}
XSET $_sign_=  if string\(R\("_modifier1_")) == ""
XSET $_sign_+=|    call xfunc.xset\\('XSET sign=Next("$")')
XSET $_sign_+=|    call xfunc.xset\\('XSET _modifier_=Cancel()')
XSET $_sign_+=|else
XSET $_sign_+=|    call xfunc.xset\\('XSET sign=Next(" ")')
XSET $_sign_+=|endif
XSET _modifier1_.post=X($_sign_, V())
XSET sign.pre=
`_modifier1_^` `_modifier_^`sign^`name^ = `cursor^;

XPT cvs dyn alias=cv
XSET cursor="`curso^"

XPT cvl dyn alias=cv
XSET cursor=array\(`value^ExpandInsideEdge2\(", ","")^^)

XPT cvd dyn alias=cv
XSET cursor=array\(`key^ => `value^` `...ANODA{{^, `key^ => `value^` `...ANODA^`}}^)

XPT dv
unset($``cursor^);

XPT cc
define("`name^UpperCase(V())^", `cursor^);

XPT t abbr "\$this
$this->`cursor^

XPT s abbr "self::
self::`cursor^

XPT p abbr "parent::
parent::`cursor^

XPT foreach " foreach (.. as ..) {..}
foreach ($`var^ as `$`key` => ^`$`value`^)`$BRloop^{
    `cursor^
}

XPT fun dyn wrap=funBody " function ..( .. ) {..}
XSET param|post=ExpandInsideEdge(', $', '')
XSET $_funName_=["__destruct","__clone","__autoload","__toString","__get","__set","__call"]
XSET funName=eval($_funName_)
XSET $_param_=  if string\(V\()) == "__autoload"
XSET $_param_+=|  call xfunc.snipGS\\({"":{"postFilters":"param"}}, "_unlet_")
XSET $_param_+=|  call xfunc.xset\\('XSET param=NextC("className")')
XSET $_param_+=|  call xfunc.xset\\('XSET funBody.def=include_once\\\\(\\\\$className . ".php");`cursor^')
XSET $_param_+=|elseif string\(V\()) == "__clone"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=Cancel()')
XSET $_param_+=|  call xfunc.xset\\('XSET funBody.def=cloned = \\\\$this;`cursor^')
XSET $_param_+=|elseif string\(V\()) == "__toString"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=Cancel()')
XSET $_param_+=|  call xfunc.xset\\('XSET funBody=`cursor^')
XSET $_param_+=|elseif string\(V\()) == "__set"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=NextC("property, $value")')
XSET $_param_+=|  call xfunc.xset\\('XSET funBody=`cursor^')
XSET $_param_+=|elseif string\(V\()) == "__call"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=NextC("method, $args")')
XSET $_param_+=|  call xfunc.xset\\('XSET funBody=`cursor^')
XSET $_param_+=|elseif string\(V\()) == "__get"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=NextC("property")')
XSET $_param_+=|  call xfunc.xset\\('XSET funBody=`cursor^')
XSET $_param_+=|else
XSET $_param_+=|  call xfunc.xset\\('XSET funBody=`cursor^')
XSET $_param_+=|endif
XSET funName.post=XS($_param_, V())
function `funName^(`$`param`^)`$BRfun^{
    `funBody^
}

XPT class setting=_interfaces_|_modifier_ " class .. { .. }
XSET $_preValues_={"name":1,"MORE..":""}
XSET $_name_=ACMB\({'\V\^\.\+\s\*\zs=\\$':'= `val^'})
XSET name.ontype=ZS($_name_)
XSET MORE\.\.=Cancel()
XSET $_className2_=  let more = xfunc.snipGS\\({"":{"defaultValues":"MORE.."}})
XSET $_className2_+=|if T\(V0\()) == "Iterator" | call xfunc.xset\\('XSET MORE\.\.=' . more.text . '`:_iterator_funcs:^')
XSET $_className2_+=|elseif T\(V0\()) == "IteratorAggregate" | call xfunc.xset\\('XSET MORE\.\.=' . more.text . '`:_iteratorAggregate_funcs:^')
XSET $_className2_+=|elseif T\(V0\()) == "Countable" | call xfunc.xset\\('XSET MORE\.\.=' . more.text . '`:_countable_funcs:^')
XSET $_className2_+=|elseif T\(V0\()) == "SplObserver" | call xfunc.xset\\('XSET MORE\.\.=' . more.text . '`:_splObserver_funcs:^')
XSET $_className2_+=|elseif T\(V0\()) == "SplSubject" | call xfunc.xset\\('XSET MORE\.\.=' . more.text . '`:_splSubject_funcs:^')
XSET $_className2_+=|elseif T\(V0\()) == "ArrayAccess" | call xfunc.xset\\('XSET MORE\.\.=' . more.text . '`:_arrayAccess_funcs:^')
XSET $_className2_+=|endif
XSET $_className2_1_=return xfunc.RINE\\(["className2",""], T\(V\()) . "`, `className2^", "")
XSET className2.post=ChainX($_className2_, $_className2_1_)
XSET className2=split($_interfaces_, " ")
``final` ^`$_xSnipName^ `className^` `EXTENDS...{{^ extends `className^`}}^` `IMPLEMENTS...{{^ implements `className2^`}}^{
    `INSTANCE VARIABLES...{{^`_modifier_^`name^;
`INSTANCE VARIABLES...^`}}^
    `:fun({"funName":"Next('__construct')"}):^
    `MORE FUNCTION...{{^`_modifier_^`:fun:^
`MORE FUNCTION...^`}}^`MORE..^
}

XPT class_constants alias=_chooseXSET
XSET $__class__ the class name=__class__

XPT abstract alias=class

XPT interface dyn setting=_interfaces_
XSET $_import_={"fun":{"allValues":"param"}, "class":{"allValues":"className2", "variables":["$_className2_1_"]}}
XSET $_preValues_={"intBody":""}
XSET $_intBody_=ACMB\({'\V\^f\%[u\]\\$':'function `name^(`$`param`^);\n`intBody^'})
XSET intBody.ontype=ZS($_intBody_)
interface `intName^` `EXTENDS...{{^ extends `className2^`}}^ {
    `intBody^
}

XPT try wrap=code "try {...} except {...}
try {
    `code^
}
catch (`Exception^ $e){
    `cursor^
}

XPT f_date
XSET fmt=pickL('m',{"January":"F","Jan":"M","yyyy":"Y","yy":"y","mm eg 02":"m","m eg 2":"n","dd eg 02":"d","d eg 2":"j","Friday":"l","Fri":"D","w eg 0 for Sunday":"w","h 12 hour format":"g","hh 12 hour format":"h","h 24 hour format":"G","hh 24 hour format":"H","minutes":"i","seconds":"s","am or pm":"a","AM or PM":"A"},"")
`fmt^

XPT date abbr dyn
XSET $_format_=ACMB\({'\V\^f\\$':'"`^Trigger("f_date")^"'})
XSET format.ontype=ZS($_format_)
date(`format^`, `timestamp?`^)

XPT _FILES abbr
XSET det=ChooseStr("name", "type", "tmp_name", "size")
_FILES[`str fieldname^]['`det^']
