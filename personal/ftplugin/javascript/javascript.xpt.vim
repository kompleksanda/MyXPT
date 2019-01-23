XPTemplate priority=lang

XPTinclude
      \ javascript/My_*
      \ javascript/javascript.dom

call g:XPTaddBundle( 'javascript', 'jquery' )

XPT _varSke hidden
XSET value.pre=value
var `name^ = `value^;
XPT cva alias=_varSke
XSET value=Embed('new Array(`size?^)')
XPT cvaa setting=cva
`value^
XPT cvr alias=_varSke "create variable for regexp statement
XSET value=Embed('/`re^/g')
XPT cvrr setting=cvr text=cvaa
..XPT

XPT while
while (`cond^){
    `cursor^
}
XPT afun " function ( .. ) {..}
XSET arg*|post=ExpandIfNotEmpty(', ', 'arg*')
function (`arg*^) {
    `cursor^
}
XPT with "with (..){..}
with (`library^){
    `cursor^
}


XPT str alias=_chooseXSET
XSET $length Returns the length of a string=length
XSET $charAt() Returns the character at the specified index (position)=charAt\(`index^)
XSET $charCodeAt() Returns the Unicode of the character at the specified index=charCodeAt\(`index^)
XSET $concat() Joins two or more strings, and returns a new joined strings=concat\(`str_between^,`other_str^)
XSET $endsWith() Checks whether a string ends with specified string/characters=endsWith\()
XSET $fromCharCode() Converts Unicode values to characters=fromCharCode\()
XSET $includes() Checks whether a string contains the specified string/characters=includes\()
XSET $indexOf() Returns the position of the first found occurrence of a specified value in a string=indexOf\(`str^)
XSET $lastIndexOf(`str^) Returns the position of the last found occurrence of a specified value in a string=lastIndexOf\(`str^)
XSET $localeCompare() Compares two strings in the current locale=localeCompare\()
XSET $match() Searches a string for a match against a regular expression, and returns the matches=match\()
XSET $repeat() Returns a new string with a specified number of copies of an existing string=repeat\()
XSET $replace() Searches a string for a specified value, or a regular expression, and returns a new string where the specified values are replaced=replace\(`str_OR_re^,`new_str^)
XSET $search() Searches a string for a specified value, or regular expression, and returns the position of the match=search\(`str_OR_re^)
XSET $slice() Extracts a part of a string and returns a new string=slice\(`index_start^`, `index_end?^)
XSET $split() Splits a string into an array of substrings using str or regexp=split\(`str_OR_re^)
XSET $startsWith() Checks whether a string begins with specified characters=startsWith\()
XSET $substr() Extracts the characters from a string, beginning at a specified start position, and through the specified number of character=substr\(`index_start^`, `length?^)
XSET $substring() Extracts the characters from a string, between two specified indices no negative number=substring\(`index_start^`, `index_end?^)
XSET $toLocaleLowerCase() Converts a string to lowercase letters, according to the hosts locale=toLocaleLowerCase\()
XSET $toLocaleUpperCase() Converts a string to uppercase letters, according to the hosts locale=toLocaleUpperCase\()
XSET $toLowerCase() Converts a string to lowercase letters=toLowerCase\()
XSET $toString() Returns the value of a String object=toString\()
XSET $toUpperCase() Converts a string to uppercase letters=toUpperCase\()
XSET $trim() Removes whitespace from both ends of a string=trim\()
XSET $valueOf() Returns the primitive value of a String object=valueOf\()

XPT bool alias=_chooseXSET
XSET $constructor Returns the function that created JavaScript"s Boolean prototype=constructor
XSET $prototype Allows you to add properties and methods to the Boolean prototype=prototype
XSET $toString() Converts a boolean value to a string, and returns the result=toString\()
XSET $valueOf() Returns the primitive value of a boolean=valueOf\()

XPT re alias=_chooseXSET
XSET $global: true=global
XSET $ignoreCase: false=ignoreCase
XSET $lastIndex: 0 The index at which to start the next match=lastIndex
XSET $multiline: false=multiline
XSET $source: "sdfs" The text of the pattern=source
XSET $compile=compile\()
XSET $exec Executes a search for a match in its string parameter returns re_exec=exec\(`string?^)
XSET $test Tests for a match in its string parameter Returns true or false=test\(`string?^)
XSET $toSource same as to source =toSource\()
XSET $toString e\.g "/sdfs/g"=toString\()
XSET $RegExp\.$input set and get=RegExp.\$input
XSET $RegExp\.input set and get=RegExp.input
XSET $RegExp\.lastMatch set and get=RegExp.lastMatch
XSET $RegExp\.lastParen set and get=RegExp.lastParen
XSET $RegExp\.leftContext set and get=RegExp.leftContext
XSET $RegExp\.rightContext set and get=RegExp.rightContext

XPT re_atoms
XSET $meth={'i Perform case-insensitive matching':'i','g Perform a global match (find all matches rather than stopping after the first match)':'g'
XSET $meth+=,'m Perform multiline matching':'m','[abc] Find any character between the brackets':'[abc]','[^abc] Find any character NOT between the brackets':'[^abc]'
XSET $meth+=,'[0-9] Find any digit between the brackets':'[0-9]','[^0-9] Find any digit NOT between the brackets':'[^0-9]'
XSET $meth+=,'(x|y) Find any of the alternatives specified':'(x|y)','. Find a single character, except newline or line terminator':'.','\w Find a word character':'\w'
XSET $meth+=,'\W Find a non-word character':'\W','\d Find a digit':'\d'
XSET $meth+=,'\D Find a non-digit character':'\D','\s Find a whitespace character':'\s'
XSET $meth+=,'\S Find a non-whitespace character':'\S','\b Find a match at the beginning/end of a word':'\b'
XSET $meth+=,'\B Find a match not at the beginning/end of a word':'\B','\0 Find a NUL character':'\0'
XSET $meth+=,'\n Find a new line character':'\n','\f Find a form feed character':'\f'
XSET $meth+=,'\r Find a carriage return character':'\r','\t Find a tab character':'\t'
XSET $meth+=,'\v Find a vertical tab character':'\v','\xxx Find the character specified by an octal number xxx':'\xxx'
XSET $meth+=,'\xdd Find the character specified by a hexadecimal number dd':'\xdd','\uxxxx Find the Unicode character specified by a hexadecimal number xxxx':'\uxxxx'
XSET $meth+=,'n+ Matches any string that contains at least one n':'n+','n* Matches any string that contains zero or more occurrences of n':'n*'
XSET $meth+=,'n? Matches any string that contains zero or one occurrences of n':'n?','n{X} Matches any string that contains a sequence of X n"s':'n{X}'
XSET $meth+=,'n{X,Y} Matches any string that contains a sequence of X to Y n"s':'n{X,Y}','n{X,} Matches any string that contains a sequence of at least X n"s':'n{X,}'
XSET $meth+=,'n$ Matches any string with n at the end of it':'n$','^n Matches any string with n at the beginning of it':'^n'
XSET $meth+=,'?=n Matches any string that is followed by a specific string n':'?=n','?!n Matches any string that is not followed by a specific string n':'?!n'
XSET $meth+=,'constructor Returns the function that created the RegExp object"s prototype':'constructor','global Checks whether the "g" modifier is set':'global'
XSET $meth+=,'ignoreCase Checks whether the "i" modifier is set':'ignoreCase','lastIndex Specifies the index at which to start the next match':'lastIndex'
XSET $meth+=,'multiline Checks whether the "m" modifier is set':'multiline','source Returns the text of the RegExp pattern':'source'
XSET $meth+=,'compile() Deprecated in version 1.5. Compiles a regular expression':'compile()','exec() Tests for a match in a string. Returns the first match':'exec(`str^)'
XSET $meth+=,'test() Tests for a match in a string. Returns true or false':'test(`str^)','toString() Returns the string value of the regular expression':'toString()'
XSET $meth+=}
XSET method.def=Choose(keys(eval($meth)))
XSET method.post=eval($meth . "['".V()."']")
`method^

XPT date alias=_chooseXSET
XSET $getDate() Returns the day of the month (from 1-31)=getDate\()
XSET $getDay() Returns the day of the week (from 0(sunday)-6(saturday))=getDay\()
XSET $getFullYear() Returns the year \= 2019=getFullYear\()
XSET $getHours() Returns the hour (from 0-23)=getHours\()
XSET $getMilliseconds() Returns the milliseconds (from 0-999)=getMilliseconds\()
XSET $getMinutes() Returns the minutes (from 0-59)=getMinutes\()
XSET $getMonth() Returns the month (from 0-11)=getMonth\()
XSET $getSeconds() Returns the seconds (from 0-59)=getSeconds\()
XSET $getTime() Returns the number of milliseconds since midnight Jan 1 1970, and a specified date=getTime\()
XSET $getTimezoneOffset() Returns the time difference between UTC time and local time, in minutes=getTimezoneOffset\()
XSET $getUTCDate() Returns the day of the month, according to universal time (from 1-31)=getUTCDate\()
XSET $getUTCDay() Returns the day of the week, according to universal time (from 0-6)=getUTCDay\()
XSET $getUTCFullYear() Returns the year, according to universal time=getUTCFullYear\()
XSET $getUTCHours() Returns the hour, according to universal time (from 0-23)=getUTCHours\()
XSET $getUTCMilliseconds() Returns the milliseconds, according to universal time (from 0-999)=getUTCMilliseconds\()
XSET $getUTCMinutes() Returns the minutes, according to universal time (from 0-59)=getUTCMinutes\()
XSET $getUTCMonth() Returns the month, according to universal time (from 0-11)=getUTCMonth\()
XSET $getUTCSeconds() Returns the seconds, according to universal time (from 0-59)=getUTCSeconds\()
XSET $Date\.now() Returns the number of milliseconds since midnight Jan 1, 1970=now\()
XSET $Date\.parse() Parses a date string and returns the number of milliseconds since January 1, 1970=Date.parse\(`str^)
XSET $setDate() Sets the day of the month of a date object=setDate\(`int_day^)
XSET $setFullYear() Sets the year of a date object=setFullYear\(`year^,`month^,`day^)
XSET $setHours() Sets the hour of a date object=setHours\()
XSET $setMilliseconds() Sets the milliseconds of a date object=setMilliseconds\()
XSET $setMinutes() Set the minutes of a date object=setMinutes\()
XSET $setMonth() Sets the month of a date object=setMonth\()
XSET $setSeconds() Sets the seconds of a date object=setSeconds\()
XSET $setTime() Sets a date to a specified number of milliseconds after/before January 1, 1970=setTime\()
XSET $setUTCDate() Sets the day of the month of a date object, according to universal time=setUTCDate\()
XSET $setUTCFullYear() Sets the year of a date object, according to universal time=setUTCFullYear\()
XSET $setUTCHours() Sets the hour of a date object, according to universal time=setUTCHours\()
XSET $setUTCMilliseconds() Sets the milliseconds of a date object, according to universal time=setUTCMilliseconds\()
XSET $setUTCMinutes() Set the minutes of a date object, according to universal time=setUTCMinutes\()
XSET $setUTCMonth() Sets the month of a date object, according to universal time=setUTCMonth\()
XSET $setUTCSeconds() Set the seconds of a date object, according to universal time=setUTCSeconds\()
XSET $setYear() Deprecated. Use the setFullYear() method instead=setYear\()
XSET $toDateString() Converts the date portion of a Date object into a readable string e\.g "Fri Dec 28 2018"=toDateString\()
XSET $toISOString() Returns the date of UTC as a string, using the ISO standard e\.g "2018-12-29T03:26:03.816Z"=toISOString\()
XSET $toJSON() Returns the date of UTC as a string, formatted as a JSON date e\.g "2018-12-29T03:27:40.929Z"=toJSON\()
XSET $toLocaleDateString() Returns the date portion of a Date object as a string, using locale conventions e\.g "12/28/2018"=toLocaleDateString\()
XSET $toLocaleTimeString() Returns the time portion of a Date object as a string, using locale conventions e\.g "7:29:48 PM"=toLocaleTimeString\()
XSET $toLocaleString() Converts a Date object to a string, using locale conventions e\.g "12/28/2018, 7:30:43 PM"=toLocaleString\()
XSET $toString() Converts a Date object to a string e\.g "Fri Dec 28 2018 19:31:21 GMT-0800 (Pacific Standard Time)"=toString\()
XSET $toTimeString() Converts the time portion of a Date object to a string e\.g "19:32:06 GMT-0800 (Pacific Standard Time)"=toTimeString\()
XSET $toUTCString() Converts a Date object to a string, according to universal time e\.g "Sat, 29 Dec 2018 03:24:22 GMT"=toUTCString\()
XSET $Date\.UTC() Returns the number of milliseconds in a date since midnight of January 1, 1970, according to UTC time=UTC\()
XSET $valueOf() Returns the primitive value of a Date object e\.g 1546054491872=valueOf\()',

XPT newDate
XSET stringDate=December 17, 1995 03:24:00
XSET $_date_=ACMB\({"\\V\\^\\zs'\\\\$":"'`stringDate^'", '\V\^\d\\{2,4\}\zs,\\$':', `0-11^, `1-31^`, `time_others`{{^, `hours^, `min^, `sec^, `ms^`}}^'})
XSET yearOrInt?.ontype=ZS($_date_)
new Date(`yearOrInt?^);
..XPT

XPT number alias=_chooseXSET
XSET $isSafeInteger() Checks whether a value is a safe integer=isSafeInteger\()
XSET $Number\.MAX_VALUE: 1\.7976931348623157e+308=Number.MAX_VALUE
XSET $Number\.MIN_VALUE: 5e-324=Number.MIN_VALUE
XSET $Number\.NEGATIVE_INFINITY: -Infinity=Number.NEGATIVE_INFINITY
XSET $Number\.NaN: NaN=Number.NaN
XSET $Number\.POSITIVE_INFINITY: Infinity=Number.POSITIVE_INFINITY
XSET $isFinite=isFinite\()
XSET $isNaN=isNaN\()
XSET $toExponential returns value in string exponential form, arg specify the number of digits after the decimal point 77\.1234\.toExponential() \= "7\.71234e+1"; 77\.1234\.toExponential(2) \= "7\.71e+1" =toExponential\(`fractionDigit?^)
XSET $toFixed Returns a string representing the Number object in fixed-point notation, arg specify the number of digits after the decimal point 11\.5\.toFixed() \= "12"; 0\.125\.tofixed(2) \= "0\.13" =toFixed\(`fractionDigit?^)
XSET $toLocaleString=toLocaleString\()
XSET $toPrecision Returns a string representing the Number object to the specified precision, arg specify the number of digits 12\.23\.toPrecision() \= "12\.23"; 2\.45\.toPrecision(2) \= "2\.5" =toPrecision\(`precision?^)
XSET $toString optional arg specifies the base to convert to 23 \= "23" 6\.toString(2) \= "110"=toString\(`radix?^)
XSET $toSource 23 \= "(new Number(23))"=toSource\()
XSET $valueOf=valueOf\()

XPT function alias=_chooseXSET
XSET $length numbers of parameters defined for function=length
XSET $apply calls the function subtituting it's this value for the first arg and its arguments the second arg=apply\(`this^, `arguments^)
XSET $call same as apply except in the way arguments is passed=call\(`this^, `argumentN^)
XSET $toString=toString\()
XSET $bind creates a new funtion and returns it, this of the new funtion is first arg, argument for it is second arg=bind\(`this^, `argumentN^)
XSET $valueOf same as toString=valueOf\()

XPT arguments alias=_chooseXSET
XSET $length numbers of arguments passed into function=length
XSET $callee this function itself=callee.

XPT strr setting=str
`var_name^.`function^
XPT ree setting=re
`var_name^.`function^
XPT datee setting=date text=ree
XPT elemm setting=elem text=re
..XPT

XPT math alias=_chooseXSET
XSET $E Returns Euler"s number (approx\. 2.718)=E
XSET $LN2 Returns the natural logarithm of 2 (approx\. 0.693)=LN2
XSET $LN10 Returns the natural logarithm of 10 (approx\. 2.302)=LN10
XSET $LOG2E Returns the base-2 logarithm of E (approx\. 1.442)=LOG2E
XSET $LOG10E Returns the base-10 logarithm of E (approx\. 0.434)=LOG10E
XSET $PI Returns PI (approx\. 3.14)=PI
XSET $SQRT1_2 Returns the square root of 1/2 (approx\. 0.707)=SQRT1_2
XSET $SQRT2 Returns the square root of 2 (approx\.  1.414)=SQRT2
XSET $abs(x) Returns the absolute value of x=abs\(`x^)
XSET $acos(x) Returns the arccosine of x, in radians=acos\(`x^)
XSET $asin(x) Returns the arcsine of x, in radians=asin\(`x^)
XSET $atan(x) Returns the arctangent of x as a numeric value between -PI/2 and PI/2 radians=atan\(`x^)
XSET $matan2(y,x) Returns the arctangent of the quotient of its arguments=atan2\(`y^,`x^)
XSET $ceil(x) Returns x, rounded upwards to the nearest integer=ceil\(`x^)
XSET $cos(x) Returns the cosine of x (x is in radians)=cos\(`x^)
XSET $exp(x) Returns the value of Ex=exp\(`x^)
XSET $floor(x) Returns x, rounded downwards to the nearest integer=floor\(`x^)
XSET $log(x) Returns the natural logarithm (base E) of x=log\(`x^)
XSET $max(x,y,z,\.\.\.,n) Returns the number with the highest value=max\(`arg1^, `argg^ExpandInsideEdge2(", ","")^^)
XSET $min(x,y,z,\.\.\.,n) Returns the number with the lowest value=min\(`arg1^, `argg^ExpandInsideEdge2(", ","")^^)
XSET $pow(x,y) Returns the value of x to the power of y=pow\(`x^,`y^)
XSET $random() Returns a random number between 0 and 1=random\()
XSET $round(x) Rounds x to the nearest integer=round\(`x^)
XSET $sin(x) Returns the sine of x (x is in radians)=sin\(`x^)
XSET $sqrt(x) Returns the square root of x=sqrt\(`x^)
XSET $tan(x) Returns the tangent of an angle=tan\(`x^)

XPT array alias=_chooseXSET
XSET $concat() joins two or more arrays, and returns a copy of the joined arrays [a,b].concat([a, c]) \= [a,b,a,c]=concat\(`array1^`, `arrayN^)
XSET $copyWithin() copies array elements within the array, to and from specified positions=copyWithin\()
XSET $every() checks if every element in an array pass a test=every\(`list^, `callbackfn^)
XSET $filter() creates a new array with every element in an array that pass a test=filter
XSET $fill() fill the elements in an array with a static value=fill\()
XSET $find() returns the value of the first element in an array that pass a test=find\()
XSET $findIndex() returns the index of the first element in an array that pass a test=findIndex\()
XSET $forEach() calls a function for each array element=forEach\(`list^, `callbackfn^)
XSET $from=       from\(`items^, `mapfn^, `thisArg^)
XSET $indexOf() search the array for an element and returns its position=indexOf\(`list^, `searchElement^)
XSET $isArray() checks whether an object is an array=Array.isArray
XSET $join() joins all elements of an array into a string=join
XSET $lastIndexOf() search the array for an element, starting at the end, and returns its position=lastIndexOf\(`list^, `searchElement^)
XSET $length you can give it a value to truncate or extend the array=length
XSET $map() creates a new array with the result of calling a function for each array element=map\(`list^, `callbackfn^)
XSET $pop() removes the last element of an array, and returns that element=pop\()
XSET $push() adds new elements to the end of an array, and returns the new length=push\(`elementN^)
XSET $reduce() reduce the values of an array to a single value (going left-to-right)=reduce\(`list^, `callbackfn^)
XSET $reduceRight() reduce the values of an array to a single value (going right-to-left)=reduceRight\(`list^, `callbackfn^)
XSET $reverse() reverses the order of the elements in an array=reverse\()
XSET $shift() removes the first element of an array, and returns that element=shift\()
XSET $slice() selects a part of an array, and returns the new array=slice\(`index_start^`, `index_end?^)
XSET $some() checks if any of the elements in an array pass a test=some
XSET $sort() sort element of an array if pass a function, the function must have to parameters and must return 0 if both parameters are equal, +number if first parameter > second or -number if second parameter < first=sort\(`compareFunction?^)
XSET $splice() adds/Removes elements from an array returns array containing removed elements=splice\(`startPosition^, `no_of_elem_to_remove^`, `new_elems^ExpandInsideEdge2(", ","")^^)
XSET $unshift() adds new elements to the beginning of an array, and returns the new length=unshift\(`elementN^)
XSET $toString() ["alex","ander"] \= "alex,ander"=toString\()
XSET $toSource() ["alex","ander"] \= "["alex,ander"]"=toSource\()

XPT ArrayBuffer alias=_chooseXSET
XSET $isView=isView
XSET $byteLength=byteLength
XSET $slice=slice

XPT Directory alias=_chooseXSET
XSET $getFileAndDirectories=getFileAndDirectories
XSET $name=name
XSET $path=path

XPT File alias=_chooseXSET
XSET $lastModified=lastModified
XSET $lastModifiedDate=lastModifiedDate
XSET $name=name

XPT FileList alias=_chooseXSET
XSET $item=item

XPT FileReader alias=_chooseXSET
XSET $DONE=DONE
XSET $EMPTY=EMPTY
XSET $LOADING=LOADING
XSET $readAsArrayBuffer=readAsArrayBuffer
XSET $readAsBinaryString=readAsBinaryString
XSET $readAsDataURL=readAsDataURL
XSET $readAsText=readAsText
XSET $result=result
XSET $name=name


XPT re_exec setting=Array text=_chooseXSET
XSET $input A read-only property that reflects the original string against which the regular expression was matched=input
XSET $index A read-only property that is the zerobased index of the match in the string=index
