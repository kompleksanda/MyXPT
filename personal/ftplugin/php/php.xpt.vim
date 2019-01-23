XPTemplate priority=lang
set dict+=~/vimfiles/MyXPT/personal/ftplugin/php/complete.txt

XPT t abbr "\$this
$this->`^

XPT s abbr "self::
self::`^

XPT p abbr "parent::
parent::`^

XPT foreach " foreach (.. as ..) {..}
foreach ($`var^ as `$`key` => ^`$`value`^)`$BRloop^{
    `cursor^
}

XPT fun " function ..( .. ) {..}
XSET param|post=ExpandInsideEdge(', $', '')
function `funName^(`$`param`^)`$BRfun^{
    `cursor^
}

XPT class " class .. { .. }
XSET $_preValues_={"_":"","name":1,"MORE..":""}
XSET $_param_=if string\(V\()) == "__autoload"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=NextC("className")')
XSET $_param_+=|  call xfunc.xset\\('XSET funBody.def=NextC("include_once($className ." . string("php") .")");')
XSET $_param_+=|elseif string\(V\()) == "__clone"
XSET $_param_+=|  call xfunc.xset\\('XSET funBody.def=NextC("cloned = $this;`^")')
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=Cancel()')
XSET $_param_+=|elseif string\(V\()) == "__toString"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=Cancel()')
XSET $_param_+=|elseif string\(V\()) == "__set"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=NextC("property, $value")')
XSET $_param_+=|elseif string\(V\()) == "__call"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=NextC("method, $args")')
XSET $_param_+=|elseif string\(V\()) == "__get"
XSET $_param_+=|  call xfunc.xset\\('XSET param.def=NextC("property")')
XSET $_param_+=|else
XSET $_param_+=|  call xfunc.snipGS\\({"":{"postFilters":"param"}}, xfunc.snipGS\\({"fun":{"postFilters":"param"}}))
XSET $_param_+=|endif
XSET funName.post=XS($_param_, V())
XSET $_paramDef_=|  call xfunc.snipGS\\({"":{"postFilters":"param"}}, "_unlet_")
XSET $_paramDef_+=|  call xfunc.snipGS\\({"":{"defaultValues":"param"}}, "_unlet_")
XSET $_paramDef_+=|  call xfunc.snipGS\\({"":{"defaultValues":"funBody"}}, "_unlet_")
XSET MORE FUNCTION\.\.\.=XS($_paramDef_, "MORE FUNCTION...")
XSET _=Next()
XSET $_funName_=["__destruct","__clone","__autoload","__toString","__get","__set","__call"]
XSET funName=eval($_funName_)
XSET modifier=ChooseStr("private","public","protected","const","static")
XSET modifier.post=ReturnIfEq([""], "", V() . " `modifier^")
XSET $_name_=ACMB\({'\V\^\.\+\s\*\zs=\\$':'= `val^'})
XSET name.ontype=ZS($_name_)
XSET MORE\.\.=Cancel()
XSET $_className2_=  let more = xfunc.snipGS\\({"":{"defaultValues":"MORE.."}})
XSET $_className2_+=|if T\(V0\()) == "Iterator" | call xfunc.xset\\('XSET MORE\.\.=' . more.text . '`:_iterator_funcs:^')
XSET $_className2_+=|elseif T\(V0\()) == "IteratorAggregate" | call xfunc.xset\\('XSET MORE\.\.=' . more.text . '`:_iteratorAggregate_funcs:^')
XSET $_className2_+=|elseif T\(V0\()) == "Countable" | call xfunc.xset\\('XSET MORE\.\.=' . more.text . '`:_countable_funcs:^')
XSET $_className2_+=|endif
XSET $_className2_1_=return xfunc.ReturnIfNotEq\\(["className2",""], T\(V\()) . "`, `className2^", "")
XSET className2.post=ChainX($_className2_, $_className2_1_)
XSET $_interfaces_=Iterator IteratorAggregate Countable
XSET className2=split($_interfaces_, " ")
``final` ^`$_xSnipName^ `className^` `EXTENDS...{{^ extends `className^`}}^` `IMPLEMENTS...{{^ implements `className2^`}}^{
    `INSTANCE VARIABLES...{{^`modifier^`name^;
`INSTANCE VARIABLES...^`}}^`_^xset('XSET modifier=ChooseStr("private","public","protected","final","static","abstact")')^^
    `:fun({"funName":"Next('__construct')"}):^
    `MORE FUNCTION...{{^`modifier^`:fun({"cursor":"funBody"}):^
`MORE FUNCTION...^`}}^`MORE..^
}


XPT class_constants alias=_chooseXSET
XSET $__class__ the class name=__class__

XPT abstract alias=class

XPT interface
XSET $_import_={"fun":{"allValues":"param"}, "class":{"postFilters":"className2"}}
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

XPT is_ alias=_chooseXSET "is_* builtin functions
XSET $is_numeric=   is_numeric($`var^)
XSET $is_empty=     is_empty($`var^)
XSET $is_array=     is_array($`mixed_var^)
XSET $is_float=     is_float($`var^)
XSET $is_null=      is_null($`mixed_var^)
XSET $is_numeric=   is_numeric($`mixed_var^)
XSET $is_string=    is_string($`mixed_var^)
XSET $is_finite=    is_finite($`float_var^)
XSET $is_bool=      is_bool($`mixed_var^)
XSET $is_infinite=  is_infinite($`float_var^)
XSET $is_file=      is_file($`string_filename^)
XSET $is_dir=       is_dir($`string_filename^)
XSET $is_object=    is_object($`mixed_var^)
XSET $is_readable=  is_readable($`string_filename^)
XSET $is_scalar=    is_scalar($`mixed_var^)
XSET $is_a=         is_a($`object_object^, $`string_className^)
XSET $is_nan=       is_nan($`float_var^)
XSET $is_tainted=   is_tainted($`string_string^)
XSET $is_int=       is_int($`mixed_var^)
XSET $is_executable=is_executable($`string_filename^)
XSET $is_resource=  is_resource($`mixed_var^)
XSET $is_link=      is_link($`string_filename^)
XSET $is_callable=  is_callable($`callable_name^)
XSET $is_subclass_of=is_subclass_of($`mixed_object^, $`string_className^)
XSET $is_soap_fault=is_soap_fault($`mixed_object^)
XSET $is_uploaded_file=is_uploaded_file($`string_filename^)
XSET $is_writable=  is_writable($`string_filename^)
XSET $isset=        isset($`var^)

XPT array_ alias=_chooseXSET "array builtin functions
XSET $array_change_key_case Returns an array with its keys lower or uppercased, or FALSE if array is not an array=array_change_key_case($`array_array^`, `case=CASE_LOWER CHANGE...{{^, CASE_UPPER`}}^)
XSET $array_chunk divides array into sized chunks\. Returns a multidimensional numerically indexed array, starting with zero,   with each dimension containing size elements\. If size is less than 1 E_WARNING will be thrown and NULL returned=array_chunk($`array_array^, $`int_size^`, `preserve_keys=false CHANGE...{{^, true`}}^)
XSET $array_column Returns an array of values representing a single column from the input array\.=array_column($`array_array^, $`mixed_columnKey^)
XSET $array_combine creates an array by using the values from the keys array as keys and the values from the values array\. Returns the combined array , FALSE if the number of elements   for each array isn't equal\.=array_combine($`array_keys^, $`array_values^)
XSET $array_count_values returns an array using   the values of array as keys and   their frequency in array as values\.=array_count_values($`array_array^)
XSET $array_diff Returns an array containing all the entries from array1 that are not present in any of the other arrays\.=array_diff($`array_array1^, $`array_arrayN^)
XSET $array_diff_assoc compares array1 against array2 and   returns the difference\. Unlike array_diff() the array   keys are also used in the comparison\.=array_diff_assoc($`array_array1^, $`array_arrayN^)
XSET $array_diff_key Returns an array containing all the entries from array1 whose keys are not present in any of the   other arrays\.=array_diff_key($`array_array1^, $`array_arrayN^)
XSET $array_diff_uassoc like array_diff_assoc but performed by a user supplied callback function=array_diff_uassoc($`array_array1^, $`array_arrayN^, `callable callback^)
XSET $array_diff_ukey like array_diff_key but performed by a user supplied callback function=array_diff_ukey($`array_array1^, $`array_arrayN^, `callable callback^)
XSET $array_fill fills an array with num entries of the value of the value parameter, keys starting at the start_index parameter\.=array_fill($`int_startIndex^, $`int_num^, $`mixed_value^)
XSET $array_fill_keys fills an array with the   value of the value parameter, using the   values of the keys array as keys\.=array_fill_keys($`array_keys^, $`mixed_value^)
XSET $array_filter  iterates over each value in the array passing them to the callback function\.   If the callback function returns true, the   current value from array is returned into   the result array\. Array keys are preserved\. If no callback is supplied, all entries of array equal to FALSE will be removed\.=array_filter($`array_array^`, `CALLABLE_CALLBACK...{{^, `callback^`}}^)
XSET $array_flip exchanges all keys with their associated values in an array=array_flip($`array_array^)
XSET $array_intersect returns an array containing all the values of array1 that are present in all the arguments\. Note that keys are preserved\.=array_intersect($`array_array1^, $`array_arrayN^)
XSET $array_intersect_assoc computes the intersection of arrays with additional index check=array_intersect_assoc($`array_array1^, $`array_arrayN^)
XSET $array_intersect_key computes the intersection of arrays using keys for comparison=array_keys($`array_array1^, $`array_arrayN^)
XSET $array_intersect_uassoc computes the intersection of arrays with additional index check, compares indexes by a callback function=array_intersect_uassoc($`array_array1^, $`array_arrayN^, `callable callback^)
XSET $array_intersect_ukey computes the intersection of arrays using a callback function on the keys for comparison=array_intersect_ukey($`array_array1^, $`array_arrayN^, `callable callback^)
XSET $array_keys returns the keys, numeric and   string, from the array \. If the optional search_value is specified,   then only the keys for that value are returned\. Otherwise, all   the keys from the array are returned\.=array_keys\(`array array^, `OP  mixed search_value^, `OP  bool strict = false^)
XSET $array_key_exists returns TRUE if the   given key is set in the array\.=array_key_exists($`mixed_key^, $`array_array^)
XSET $array_map returns an array containing all the elements of array1 after applying the callback function to each one\. The number of parameters that the callback function accepts   should match the number of arrays   passed to the array_map()=array_map($`callable_callback^, $`array_arrayN^)
XSET $array_merge merges the elements of one or more arrays together so that the values of one are appended to the end of the previous one\. It returns the resulting   array\. If the input arrays have the same string keys, then the later value for that key will overwrite the previous one\.  If, however, the arrays   contain numeric keys, the later value will not overwrite the original value, but will be   appended\. Values in the input array with numeric keys will be renumbered with   incrementing keys starting from zero in the result array\.=array_merge\(`array array1^, `array arrayN^)
XSET $array_merge_recursive=array_merge_recursive\(`array array1^, `array arrayN^)
XSET $array_multisort can be used to sort several   arrays at once, or a multi-dimensional array by one or more   dimensions\. Associative ( string ) keys will be maintained, but numeric   keys will be re-indexed\. return True or false on failure=array_multisort\(`array &array1^`, `sort_order = SORT_ASC change{{^, SORT_DESC`}}^`, `sort_flags = SORT_REGULAR change{{^, `pickL\({'SORT_REGULAR compare items normally (dont change types)':'SORT_REGULAR','SORT_NUMERIC compare items numerically':'SORT_NUMERIC','SORT_STRING compare items as strings':'SORT_STRING','SORT_LOCALE_STRING compare items as strings, based on the current locale. It uses the locale, which can be changed using setlocale\()':'SORT_LOCALE_STRING','SORT_NATURAL compare items as strings using "natural ordering" like natsort\()':'SORT_NATURAL','SORT_FLAG_CASE can be combined (bitwise OR) with SORT_STRING or SORT_NATURAL to sort strings case-insensitively This argument can be swapped with sort_order or omitted entirely, in which case SORT_REGULAR is assumed':'SORT_FLAG_CASE'})^`}}^)
XSET $array_pad returns a copy of the array padded to size specified by size with value value\.If size is positive then the array is padded on the right, if it's negative then on the left\. If the   absolute value of size is less than or   equal to the length of the array then no   padding takes place\.   It is possible to add at most 1048576 elements at a time\.=array_pad($`array_array^, $`int_size^, $`mixed_value^)
XSET $array_pop pops and returns the last value of   the array , shortening the array by one element\.   If array is empty (or is not an array), NULL will be returned\. Will additionally produce a Warning when called on a non-array\.=array_pop($`array_&array)
XSET $array_product returns the product of values in an array\.=array_product($`array_array^)
XSET $array_push push one or more elements onto the end of array returns the new length of array=array_push($`array_&array^, $`mixed_valueN^)
XSET $array_rand picks one or more random entries out of an array, and returns the   key (or keys as array) of the random entries\. Trying to pick more elements than there are in the array will result in an E_WARNING level error, and NULL will be returned\.=array_rand($`array_array^`, `NUM=1 CHANGE...{{^, `num^`}}^)
XSET $array_reduce iteratively reduce the array to a single value using a callback function=array_reduce($`array_array^, $`callable_callback^, `OP  mixed initial \= NULL^)
XSET $array_replace replaces the values of array1 with values having the same keys in each of the following   arrays\. Returns the replacement Array or NULL on error\. If a key from the first array exists in the second array, its value   will be replaced by the value from the second array\. If the key exists in the   second array, and not the first, it will be created in the first array\.   If a key only exists in the first array, it will be left as is\.   If several arrays are passed for replacement, they will be processed   in order, the later arrays overwriting the previous values\.=array_replace($`array_array1^, $`array_arrayN^)
XSET $array_replace_recursive recursive of array_replace=array_replace_recursive($`array_array1^, $`array_arrayN^)
XSET $array_reverse return an array with elements in reverse order=array_reverse($`array_array^`, `preserve_keys=false CHANGE...{{^, true`}}^)
XSET $array_search searches and array for needle and returns the key for needle if it is found in the   array, FALSE otherwise\.=array_search($`mixed_needle^, $`array_haystack^`, `strict=false CHANGE...{{^, true`}}^)
XSET $array_shift shift an element off the beginning of array [] array_shift() shifts the first value of the array off and returns it, shortening the array by one element and moving everything   down\.=array_shift($`array_&array)
XSET $array_slice returns the sequence of elements   from the array array as specified by the offset and length parameters\.=array_slice($`array_array^, $`int_offset^, `OP  int length = NULL^, `OP  bool preserve_keys \= false^)
XSET $array_splice removes the elements designated by offset and length from the input array,   and replaces them with the elements of the replacement array, if supplied\. Note that numeric keys in input are not preserved\. Returns the array consisting of the extracted elements\. If length is omitted, removes everything from offset to the end of the array\.=array_splice($`array_array^, $`int_offset^, `OP  int length^, `OP  mixed replacement \= array ()^)
XSET $array_sum Returns the sum of values as an integer or float\.=array_sum($`array_array^)
XSET $array_udiff like array_diff but using a user function for comparison=array_udiff($`array_array1^, $`array_arrayN^, `callable value_compare_func^)
XSET $array_udiff_assoc computes the difference of arrays with additional index check, compares data by a callback function=array_udiff_assoc($`array_array1^, $`array_arrayN^)
XSET $array_udiff_uassoc computes the difference of arrays with additional index check, compares data and indexes by a callback function=array_udiff_uassoc\(`array array1^, `array arrayN^, `callable value_compare_func^, `callable key_compare_func^)
XSET $array_uintersect=array_uintersect($`array_array1^, $`array_arrayN^, `callable value_compare_func^)
XSET $array_uintersect_assoc=array_uintersect_assoc($`array_array1^, $`array_arrayN^, `callable value_compare_func^)
XSET $array_uintersect_uassoc=array_uintersect_uassoc\(`array array1^, `array arrayN^, `callable value_compare_func^, `callable key_compare_func^)
XSET $array_unique takes an input array and returns a new array without duplicate values\. Note that keys are preserved\. array_unique() sorts the values treated as string at first, then will keep the first key encountered for every value, and ignore all following keys\.=array_unique($`array_array^)
XSET $array_unshift prepends passed elements to the front   of the array \. Note that the list of elements is   prepended as a whole, so that the prepended elements stay in the same   order\.=array_unshift($`array_&array^)
XSET $array_values returns all the values from the array and indexes the array numerically\.=array_values($`array_array^)
XSET $array_walk apply a user function to every member of an array Returns TRUE on success or FALSE on failure\.=array_walk($`array_&array^, $`callable_callback^, `OP  mixed userdata \= NULL^)
XSET $array_walk_recursive= array_walk_recursive($`array_&array^, $`callable_callback^)
XSET $count count all elements in an array, length, or something in an object [] counts all elements in an array, or something in an object\. For objects, if you have SPL installed, you can hook into count() by implementing interface Countable \. The interface has exactly one method, Countable::count() , which returns the return value for the count() function\. Please see the Array section of the manual for a detailed explanation of how arrays   are implemented and used in PHP\. (((int [][] RET_DESC: Returns the number of elements in array_or_countable \.   If the parameter is not an array or not an object with   implemented Countable interface, 1 will be returned\.   There is one exception, if array_or_countable is NULL , 0 will be returned\. [][] {MODE : If the optional mode parameter is set to COUNT_RECURSIVE (or 1), count() will recursively count the array\.  This is particularly useful for       counting all the elements of a multidimensional array\. Caution count() can detect recursion to avoid an infinite        loop, but will emit an E_WARNING every time it        does (in case the array contains itself more than once) and return a        count higher than may be expected\. [[]] ARRAY_OR_COUNTABLE : An array or Countable object\.})))=count\(`mixed array_or_countable^`, `OP  int mode = COUNT_NORMAL change{{^, COUNT_RECURSIVE`}}^)

XPT str alias=_chooseXSET
XSET $addcslashes quote string with slashes in a C style [] returns a string with backslashes before characters that are listed in charlist parameter\. (((string [][] RET_DESC: Returns the escaped string\. [][] {CHARLIST : A list of characters to be escaped\. If charlist contains characters \n , \r etc\., they are       converted in C-like style, while other non-alphanumeric characters       with ASCII codes lower than 32 and higher than 126 converted to       octal representation\. When you define a sequence of characters in the charlist argument       make sure that you know what characters come between the       characters that you set as the start and end of the range\. <?php echo addcslashes ( 'foo[ ]' , 'A\.\.z' ); // output:  \f\o\o\[ \] // All upper and lower-case letters will be escaped // \.\.\. but so will the [\]^_` ?> Also, if the first character in a range has a higher ASCII value       than the second character in the range, no range will be       constructed\.  Only the start, end and period characters will be       escaped\. Use the ord() function to find the       ASCII value for a character\. <?php echo addcslashes ( "zoo['\.']" , 'z\.\.A' ); // output:  \zoo['\\.'] ?> Be careful if you choose to escape characters 0, a, b, f, n, r, t and       v\. They will be converted to \0, \a, \b, \f, \n, \r, \t and \v, all of       which are predefined escape sequences in C\. Many of these sequences are       also defined in other C-derived languages, including PHP, meaning that       you may not get the desired result if you use the output of addcslashes() to generate code in those languages       with these characters defined in charlist \. [[]] STR : The string to be escaped\.})))=addcslashes\(`string str^, `string charlist^)
XSET $strcasecmp binary safe case-insensitive string comparison [] binary safe case-insensitive string comparison\. (((int [][] RET_DESC: Returns < 0 if str1 is less than str2 ; > 0 if str1 is greater than str2 , and 0 if they are   equal\. [][] {STR2 : The second string [[]] STR1 : The first string})))=strcasecmp\(`string str1^, `string str2^)
XSET $strcmp binary safe string comparison []  (((int [][] RET_DESC: Returns < 0 if str1 is less than str2 ; > 0 if str1 is greater than str2 , and 0 if they are   equal\. [][] {STR2 : The second string\. [[]] STR1 : The first string\.})))=strcmp\(`string str1^, `string str2^)
XSET $strcoll locale based string comparison [] note that this comparison is case sensitive, and unlike strcmp() this function is not binary safe\. strcoll() uses the current locale for doing the   comparisons\.  If the current locale is C or POSIX, this function is   equivalent to strcmp() \. (((int [][] RET_DESC: Returns < 0 if str1 is less than str2 ; > 0 if str1 is greater than str2 , and 0 if they are equal\. [][] {STR2 : The second string\. [[]] STR1 : The first string\.})))=strcoll\(`string str1^, `string str2^)
XSET $strcspn find length of initial segment not matching mask [] returns the length of the initial segment of str1 which does not contain any of the characters in str2 \. (((int [][] RET_DESC: Returns the length of the segment as an integer\. [][] {STR2 : The second string\. [[]] STR1 : The first string\. [[]] LENGTH : The length of the string to examine\. [[]] START : The start position of the string to examine\.})))=strcspn\(`string str1^, `string str2^, `OP  int start^, `OP  int length^)
XSET $stristr case-insensitive strstr [] returns all of haystack starting from and including the first   occurrence of needle to the end\. (((string [][] RET_DESC: Returns the matched substring\. If needle is not   found, returns FALSE \. [][] {HAYSTACK : The string to search in [[]] NEEDLE : If needle is not a string, it is converted to       an integer and applied as the ordinal value of a character\. [[]] BEFORE_NEEDLE : If TRUE , stristr() returns the part of the haystack before the       first occurrence of the needle (excluding needle)\.})))=stristr\(`string haystack^, `mixed needle^, `OP  bool before_needle \= false^)
XSET $strlen get string length=strlen\(`string string^)
XSET $strnatcasecmp case insensitive string comparisons using a "natural order" algorithm [] this function implements a comparison algorithm that orders alphanumeric   strings in the way a human being would\.  The behaviour of this function is   similar to strnatcmp() , except that the comparison is   not case sensitive\.  For more information see: Martin Pool's » Natural Order String Comparison page\. (((int [][] RET_DESC: Similar to other string comparison functions, this one returns < 0 if str1 is less than str2 >   0 if str1 is greater than str2 , and 0 if they are equal\. [][] {STR2 : The second string\. [[]] STR1 : The first string\.})))=strnatcasecmp\(`string str1^, `string str2^)
XSET $strnatcmp string comparisons using a "natural order" algorithm [] this function implements a comparison algorithm that orders   alphanumeric strings in the way a human being would, this is   described as a &quot;natural ordering&quot;\.     Note that this comparison is case sensitive\. (((int [][] RET_DESC: Similar to other string comparison functions, this one returns < 0 if str1 is less than str2 ; >   0 if str1 is greater than str2 , and 0 if they are equal\. [][] {STR2 : The second string\. [[]] STR1 : The first string\.})))=strnatcmp\(`string str1^, `string str2^)
XSET $strncasecmp binary safe case-insensitive string comparison of the first n characters [] this function is similar to strcasecmp() , with the   difference that you can specify the (upper limit of the) number of   characters from each string to be used in the comparison\. (((int [][] RET_DESC: Returns < 0 if str1 is less than str2 ; > 0 if str1 is   greater than str2 , and 0 if they are equal\. [][] {STR2 : The second string\. [[]] STR1 : The first string\. [[]] LEN : The length of strings to be used in the comparison\.})))=strncasecmp\(`string str1^, `string str2^, `int len^)
XSET $strncmp binary safe string comparison of the first n characters [] this function is similar to strcmp() , with the   difference that you can specify the (upper limit of the) number of   characters from each string to be used in the comparison\. Note that this comparison is case sensitive\. (((int [][] RET_DESC: Returns < 0 if str1 is less than str2 ; > 0 if str1 is greater than str2 , and 0 if they are   equal\. [][] {STR2 : The second string\. [[]] STR1 : The first string\. [[]] LEN : Number of characters to use in the comparison\.})))=strncmp\(`string str1^, `string str2^, `int len^)
XSET $strpbrk search a string for any of a set of characters [] strpbrk() searches the haystack string for a char_list \. (((string [][] RET_DESC: Returns a string starting from the character found, or FALSE if it is   not found\. [][] {HAYSTACK : The string where char_list is looked for\. [[]] CHAR_LIST : This parameter is case sensitive\.})))=strpbrk\(`string haystack^, `string char_list^)
XSET $strpos find the position of the first occurrence of a substring in a string [] find the numeric position of the first occurrence of needle in the haystack string\. (((mixed [][] RET_DESC: Returns the position of where the needle exists relative to the beginning of   the haystack string (independent of offset)\.   Also note that string positions start at 0, and not 1\. [][] {HAYSTACK : The string to search in\. [[]] NEEDLE : If needle is not a string, it is converted       to an integer and applied as the ordinal value of a character\. [[]] OFFSET : If specified, search will start this number of characters counted from       the beginning of the string\. Unlike strrpos() and strripos() , the offset cannot be negative\.})))=strpos\(`string haystack^, `mixed needle^, `OP  int offset \= 0^)
XSET $strptime parse a time/date generated with strftime [] strptime() returns an array with the date parsed, or FALSE on error\. Month and weekday names and other language dependent strings respect the     current locale set with setlocale() ( LC_TIME )\. (((array [][] RET_DESC: Returns an array or FALSE on failure\. [][] {DATE(STRING) : The string to parse (e\.g\. returned from strftime() )\. [[]] FORMAT(STRING) : The format used in date (e\.g\. the same as        used in strftime() )\. Note that some of the format        options available to strftime() may not have any        effect within strptime() ; the exact subset that are        supported will vary based on the operating system and C library in        use\. For more information about the format options, read the strftime() page\.})))=strptime\(`string date^, `string format^)
XSET $strrchr find the last occurrence of a character in a string [] this function returns the portion of haystack which   starts at the last occurrence of needle and goes   until the end of haystack \. (((string [][] RET_DESC: This function returns the portion of string, or FALSE if needle is not found\. [][] {HAYSTACK : The string to search in [[]] NEEDLE : If needle contains more than one character,       only the first is used\. This behavior is different from that of strstr() \. If needle is not a string, it is converted to       an integer and applied as the ordinal value of a character\.})))=strrchr\(`string haystack^, `mixed needle^)
XSET $strrev reverse a string [] returns string , reversed\. (((string [][] RET_DESC: Returns the reversed string\. [][] {STRING : The string to be reversed\.})))=strrev\(`string string^)
XSET $strripos find the position of the last occurrence of a case-insensitive substring in a string [] find the numeric position of the last occurrence of needle in the haystack string\. Unlike the strrpos() , strripos() is   case-insensitive\. (((int [][] RET_DESC: Returns the position where the needle exists relative to the beginnning of   the haystack string (independent of search direction   or offset)\.   Also note that string positions start at 0, and not 1\. [][] {HAYSTACK : The string to search in\. [[]] NEEDLE : If needle is not a string, it is converted       to an integer and applied as the ordinal value of a character\. [[]] OFFSET : If specified, search will start this number of characters counted from the       beginning of the string\. If the value is negative, search will instead start       from that many characters from the end of the string, searching backwards\.})))=strripos\(`string haystack^, `string needle^, `OP  int offset \= 0^)
XSET $strrpos find the position of the last occurrence of a substring in a string [] find the numeric position of the last occurrence of needle in the haystack string\. (((int [][] RET_DESC: Returns the position where the needle exists relative to the beginnning of   the haystack string (independent of search direction   or offset)\.   Also note that string positions start at 0, and not 1\. [][] {HAYSTACK : The string to search in\. [[]] NEEDLE : If needle is not a string, it is converted       to an integer and applied as the ordinal value of a character\. [[]] OFFSET : If specified, search will start this number of characters counted from the       beginning of the string\. If the value is negative, search will instead start       from that many characters from the end of the string, searching backwards\.})))=strrpos\(`string haystack^, `string needle^, `OP  int offset \= 0^)
XSET $strspn finds the length of the initial segment of a string consisting entirely of characters contained within a given mask\. [] finds the length of the initial segment of subject that contains only characters from mask \. If start and length are omitted, then all of subject will be   examined\. If they are included, then the effect will be the same as   calling strspn(substr(subject, start, length),   mask) (see substr for more information)\. The line of code: <?php var \= strspn ( "42 is the answer to the 128th question\." , "1234567890" ); ?> will assign 2 to var ,   because the string &quot;42&quot; is the initial segment   of subject that consists only of characters   contained within &quot;1234567890&quot;\. (((int [][] RET_DESC: Returns the length of the initial segment of subject which consists entirely of characters in mask \. [][] {START : The position in subject to       start searching\. If start is given and is non-negative,       then strspn() will begin       examining subject at       the start 'th position\. For instance, in       the string ' abcdef ', the character at       position 0 is ' a ', the       character at position 2 is       ' c ', and so forth\. If start is given and is negative,       then strspn() will begin       examining subject at       the start 'th position from the end       of subject \. [[]] LENGTH : The length of the segment from subject to examine\. If length is given and is non-negative,       then subject will be examined       for length characters after the starting       position\. If length is given and is negative,        then subject will be examined from the        starting position up to length characters from the end of subject \. [[]] MASK : The list of allowable characters\. [[]] SUBJECT : The string to examine\.})))=strspn\(`string subject^, `string mask^, `OP  int start^, `OP  int length^)
XSET $strstr find the first occurrence of a string [] returns part of haystack string starting from and including the first   occurrence of needle to the end of haystack \. (((string [][] RET_DESC: Returns the portion of string, or FALSE if needle is not found\. [][] {HAYSTACK : The input string\. [[]] NEEDLE : If needle is not a string, it is converted to       an integer and applied as the ordinal value of a character\. [[]] BEFORE_NEEDLE : If TRUE , strstr() returns       the part of the haystack before the first       occurrence of the needle (excluding the needle)\.})))=strstr\(`string haystack^, `mixed needle^, `OP  bool before_needle \= false^)
XSET $strtok tokenize string [] strtok() splits a string ( str )   into smaller strings (tokens), with each token being delimited by any   character from token \.   That is, if you have a string like &quot;This is an example string&quot; you   could tokenize this string into its individual words by using the   space character as the token\. Note that only the first call to strtok uses the string argument\.   Every subsequent call to strtok only needs the token to use, as   it keeps track of where it is in the current string\.  To start   over, or to tokenize a new string you simply call strtok with the   string argument again to initialize it\.  Note that you may put   multiple tokens in the token parameter\.  The string will be   tokenized when any one of the characters in the argument are   found\. (((string [][] RET_DESC: A string token\. [][] {TOKEN : The delimiter used when splitting up str \. [[]] STR : The string being split up into smaller strings (tokens)\.})))=strtok\(`string str^, `string token^)
XSET $strtolower make a string lowercase [] returns string with all alphabetic characters   converted to lowercase\. Note that 'alphabetic' is determined by the current locale\. This means   that in i\.e\. the default &quot;C&quot; locale, characters such as umlaut-A   (Ä) will not be converted\. (((string [][] RET_DESC: Returns the lowercased string\. [][] {STR : The input string\.})))=strtolower\(`string str^)
XSET $strtotime parse about any English textual datetime description into a Unix timestamp []  (((int [][] RET_DESC: Returns a timestamp on success, FALSE otherwise\. Previous to PHP 5\.1\.0,   this function would return -1 on failure\. [][] {NOW : The timestamp which is used as a base for the calculation of relative       dates\. [[]] TIME : A date/time string\. Valid formats are explained in Date and Time Formats \.} [][] EXCEPTION:  Every call to a date/time function will generate a E_NOTICE if the time zone is not valid, and/or a E_STRICT or E_WARNING messageif using the system settings or the TZ environmentvariable\. See also date_default_timezone_set())))=strtotime\(`string time^, `OP  int now \= time()^)
XSET $strtoupper make a string uppercase [] returns string with all alphabetic characters   converted to uppercase\. Note that 'alphabetic' is determined by the current locale\. For instance,   in the default &quot;C&quot; locale characters such as umlaut-a (ä) will not be   converted\. (((string [][] RET_DESC: Returns the uppercased string\. [][] {STRING : The input string\.})))=strtoupper\(`string string^)
XSET $strtr translate characters or replace substrings [] if given three arguments, this function returns a copy of str where all occurrences of each (single-byte)   character in from have been translated to the   corresponding character in to , i\.e\., every   occurrence of from[n] has been replaced with to[n] , where n is a valid   offset in both arguments\. If from and to have   different lengths, the extra characters in the longer of the two   are ignored\. The length of str will be the same as   the return value's\. If given two arguments, the second should be an array in the   form array('from' \=> 'to', \.\.\.) \. The return value is   a string where all the occurrences of the array keys have been   replaced by the corresponding values\. The longest keys will be tried first\.   Once a substring has been replaced, its new value will not be searched   again\. In this case, the keys and the values may have any length, provided that   there is no empty key; additionally, the length of the return value may   differ from that of str \.   However, this function will be the most efficient when all the keys have the   same size\. (((string [][] RET_DESC: Returns the translated string \. [][] {TO : The string replacing from \. [[]] FROM : The string being translated to to \. [[]] STR : The string being translated\. [[]] REPLACE_PAIRS : The replace_pairs parameter may be used instead of to and from , in which case it's an array in the form array('from' \=> 'to', \.\.\.) \.})))=strtr\(`string str^, `string from^, `string to^)
XSET $strval get string value of a variable []  (((string [][] RET_DESC: The string value of var \. [][] {VAR : The variable that is being converted to a string \. var may be any scalar type or an object that       implements the __toString() method\. You cannot use strval() on arrays or on       objects that do not implement the __toString() method\.})))=strval\(`mixed var^)
XSET $str_getcsv parse a CSV string into an array [] parses a string input for fields in CSV format   and returns an array containing the fields read\. (((array [][] RET_DESC: Returns an indexed array containing the fields read\. [][] {INPUT : The string to parse\. [[]] DELIMITER : Set the field delimiter (one character only)\. [[]] ENCLOSURE : Set the field enclosure character (one character only)\. [[]] ESCAPE : Set the escape character (one character only)\. Defaults as a backslash       ( \ )})))=str_getcsv\(`string input^, `OP  string delimiter \= '^, `OP '^, `OP  string enclosure \= '&quot;'^, `OP  string escape \= '\\'^)
XSET $str_ireplace case-insensitive version of str_replace\. [] this function returns a string or an array with all occurrences of search in subject (ignoring case) replaced with the given replace value\.  If you don't need fancy replacing rules, you should generally   use this function instead of preg_replace() with the i modifier\. (((mixed [][] RET_DESC: Returns a string or an array of replacements\.)))=str_ireplace\(`mixed search^, `mixed replace^, `mixed subject^, `OP  int &count^)
XSET $str_pad pad a string to a certain length with another string [] this functions returns the input string   padded on the left, the right, or both sides to the specified   padding length\. If the optional argument pad_string is not supplied, the input is padded with spaces, otherwise it   is padded with characters from pad_string up to the limit\. (((string [][] RET_DESC: Returns the padded string\. [][] {INPUT : The input string\. [[]] PAD_TYPE : Optional argument pad_type can be STR_PAD_RIGHT , STR_PAD_LEFT ,       or STR_PAD_BOTH \. If pad_type is not specified it is assumed to be STR_PAD_RIGHT \. [[]] PAD_LENGTH : If the value of pad_length is negative,       less than, or equal to the length of the input string, no padding       takes place\. [[]] PAD_STRING : Note : The pad_string may be truncated if the        required number of padding characters can't be evenly divided by the pad_string 's length\.})))=str_pad\(`string input^, `int pad_length^, `OP  string pad_string \= &quot; &quot;^, `OP  int pad_type \= STR_PAD_RIGHT^)
XSET $str_repeat repeat a string [] returns input repeated multiplier times\. (((string [][] RET_DESC: Returns the repeated string\. [][] {INPUT : The string to be repeated\. [[]] MULTIPLIER : Number of time the input string should be       repeated\. multiplier has to be greater than or equal to 0\.       If the multiplier is set to 0, the function       will return an empty string\.})))=str_repeat\(`string input^, `int multiplier^)
XSET $str_replace replace all occurrences of the search string with the replacement string [] this function returns a string or an array with all occurrences of search in subject replaced with the given replace value\. If you don't need fancy replacing rules (like regular expressions), you   should always use this function instead of preg_replace() \. (((mixed [][] RET_DESC: This function returns a string or an array with the replaced values\.)))=str_replace\(`mixed search^, `mixed replace^, `mixed subject^, `OP  int &count^)
XSET $str_rot13 perform the rot13 transform on a string [] performs the ROT13 encoding on the str argument and   returns the resulting string\. The ROT13 encoding simply shifts every letter by 13 places in the alphabet   while leaving non-alpha characters untouched\. Encoding and decoding are   done by the same function, passing an encoded string as argument will   return the original version\. (((string [][] RET_DESC: Returns the ROT13 version of the given string\. [][] {STR : The input string\.})))=str_rot13\(`string str^)
XSET $str_shuffle randomly shuffles a string []  (((string [][] RET_DESC: Returns the shuffled string\. [][] {STR : The input string\.})))=str_shuffle\(`string str^)
XSET $str_split convert a string to an array [] converts a string to an array\. (((array [][] RET_DESC: If the optional split_length parameter is   specified, the returned array will be broken down into chunks with each   being split_length in length, otherwise each chunk   will be one character in length\. [][] {SPLIT_LENGTH : Maximum length of the chunk\. [[]] STRING : The input string\.})))=str_split\(`string string^, `OP  int split_length \= 1^)
XSET $str_word_count return information about words used in a string [] counts the number of words inside string \.    If the optional format is not specified, then    the return value will be an integer representing the number of words    found\. In the event the format is specified, the return   value will be an array, content of which is dependent on the format \. The possible value for the format and the resultant outputs are listed below\. For the purpose of this function, 'word' is defined as a locale dependent   string containing alphabetic characters, which also may contain, but not start   with &quot;'&quot; and &quot;-&quot; characters\. (((mixed [][] RET_DESC: Returns an array or an integer, depending on the format chosen\. [][] {CHARLIST : A list of additional characters which will be considered as 'word' [[]] STRING : The string [[]] FORMAT : Specify the return value of this function\. The current supported values       are: 0 - returns the number of words found 1 - returns an array containing all the words found inside the string 2 - returns an associative array, where the key is the numeric          position of the word inside the string and          the value is the actual word itself})))=str_word_count\(`string string^, `OP  int format \= 0^, `OP  string charlist^)
XSET $substr return part of a string [] returns the portion of string specified by the start and length parameters\. (((string [][] RET_DESC: Returns the extracted part of string;  or FALSE on failure, or   an empty string \. [][] {START : If start is non-negative, the returned string       will start at the start 'th position in string , counting from zero\. For instance,       in the string ' abcdef ', the character at       position 0 is ' a ', the       character at position 2 is       ' c ', and so forth\. If start is negative, the returned string       will start at the start 'th character       from the end of string \. If string is less than or equal to start characters long, FALSE will be returned\. Example #1 Using a negative start <?php rest \= substr ( "abcdef" , - 1 ); // returns "f" rest \= substr ( "abcdef" , - 2 ); // returns "ef" rest \= substr ( "abcdef" , - 3 , 1 ); // returns "d" ?> [[]] LENGTH : If length is given and is positive, the string       returned will contain at most length characters       beginning from start (depending on the length of string )\. If length is given and is negative, then that many       characters will be omitted from the end of string (after the start position has been calculated when a start is negative)\.  If start denotes the position of this truncation or       beyond, false will be returned\. If length is given and is 0 , FALSE or NULL an empty string will be returned\. If length is omitted, the substring starting from start until the end of the string will be       returned\. Example #2 Using a negative length <?php rest \= substr ( "abcdef" , 0 , - 1 ); // returns "abcde" rest \= substr ( "abcdef" , 2 , - 1 ); // returns "cde" rest \= substr ( "abcdef" , 4 , - 4 ); // returns false rest \= substr ( "abcdef" , - 3 , - 1 ); // returns "de" ?> [[]] STRING : The input string\. Must be one character or longer\.} [][] EXCEPTION:  Returns FALSE on error\. <?php var_dump ( substr ( 'a' , 1 )); // bool(false) ?>)))=substr\(`string string^, `int start^, `OP  int length^)
XSET $substr_compare binary safe comparison of two strings from an offset, up to length characters [] substr_compare() compares main_str from position offset with str up to length characters\. (((int [][] RET_DESC: Returns < 0 if main_str from position offset is less than str , >   0 if it is greater than str , and 0 if they are equal\.   If offset is equal to or greater than the length of main_str or length is set and   is less than 1, substr_compare() prints a warning and returns FALSE \. [][] {CASE_INSENSITIVITY : If case_insensitivity is TRUE , comparison is       case insensitive\. [[]] LENGTH : The length of the comparison\. The default value is the largest of the       length of the str compared to the length of main_str less the offset \. [[]] MAIN_STR : The main string being compared\. [[]] STR : The secondary string being compared\. [[]] OFFSET : The start position for the comparison\. If negative, it starts counting       from the end of the string\.})))=substr_compare\(`string main_str^, `string str^, `int offset^, `OP  int length^, `OP  bool case_insensitivity \= false^)
XSET $substr_count count the number of substring occurrences [] substr_count() returns the number of times the needle substring occurs in the haystack string\. Please note that needle is case sensitive\. (((int [][] RET_DESC: This function returns an integer \. [][] {HAYSTACK : The string to search in [[]] NEEDLE : The substring to search for [[]] LENGTH : The maximum length after the specified offset to search for the       substring\. It outputs a warning if the offset plus the length is       greater than the haystack length\. [[]] OFFSET : The offset where to start counting})))=substr_count\(`string haystack^, `string needle^, `OP  int offset \= 0^, `OP  int length^)
XSET $substr_replace replace text within a portion of a string [] substr_replace() replaces a copy of string delimited by the start and (optionally) length parameters with the string given in replacement \. (((mixed [][] RET_DESC: The result string is returned\. If string is an   array then array is returned\. [][] {START : If start is positive, the replacing will       begin at the start 'th offset into string \. If start is negative, the replacing will       begin at the start 'th character from the       end of string \. [[]] LENGTH : If given and is positive, it represents the length of the portion of string which is to be replaced\. If it is       negative, it represents the number of characters from the end of string at which to stop replacing\. If it       is not given, then it will default to strlen( string ); i\.e\. end the replacing at the       end of string \. Of course, if length is zero then this function will have the       effect of inserting replacement into string at the given start offset\. [[]] STRING : The input string\. An array of string s can be provided, in which       case the replacements will occur on each string in turn\. In this case,       the replacement , start and length parameters may be provided either as       scalar values to be applied to each input string in turn, or as array s, in which case the corresponding array element will       be used for each input string\. [[]] REPLACEMENT : The replacement string\.})))=substr_replace\(`mixed string^, `mixed replacement^, `mixed start^, `OP  mixed length^)


XPT fil_chooseXSET
XSET $feof test for end of file=feof($`resource_handle^)
XSET $fflush=            fflush($`resource_handle^)
XSET $fgetc=             fgets($`resource_handle^)
XSET $fgets=             fgets($`resource_handle^`, `INT length{{^, `length^`}}^)
XSET $file reads entire file into array=file($`string_filename^)
XSET $fileatime get last access time=fileatime($`string_filename^)
XSET $filectime get inode change time=filectime($`string_filename^)
XSET $filegroup=        filegroup($`string_filename^)
XSET $fileinode=        fileinode($`string_filename^)
XSET $filemtime get modification time=filemtime($`string_filename^)
XSET $fileowner=        fileowner($`string_filename^)
XSET $fileperms=        fileperms($`string_filename^)
XSET $filesize=         filesize($`string_filename^)
XSET $filetype=         filetype($`string_filename^)
XSET $file_exists=      file_exists($`string_filename^)
XSET $file_get_contents reads entire file into a string=file_get_contents($`string_filename^)
XSET $file_put_contents write string to a file=file_get_contents($`string_filename^, $`mixed_data^)
XSET $fopen=            fopen($`string_filename^`, `mode...{{^, "`pickL\({"r read only file pointer:beginning":"r","r+ read and write file pointer: beginning":"r+","w write file pointer:beginning truncate:0":"w","w+ write read same as w":"w+","a write file pointer:end":"a","a+ write read same as a":"a+","x create for write file pointer:beginning":"x","x+ create for read write same as x":"x+","c write, create if file not exist, not truncated, file pointer:beginning":"c","c+":"c+ read write, same as c"})^"`}}^)
XSET $fprintf=          fprintf($`resource_handle^, $`string_format^, $`mixed_arg^)
XSET $fread=            fread($`resource_handle^, $`int_length^)
XSET $fscanf=           fscanf($`resource_handle^, $`string_format^, $`mixed_arg^)
XSET $fseek=            fseek($`resource_handle^, $`int_offset^`, `INT whence=SEEK_SET CHANGE...{{^, `whence^ChooseStr\("SEEK_CUR","SEEK_END")^`}}^)
XSET $fstat=            fstat($`resource_handle^)
XSET $ftell=            ftell($`resource_handle^)
XSET $fwrite=           fwrite($`resource_handle^, $`string_string^)
XSET $fclose=           fclose($`resource_handle^)

XPT cal alias=_chooseXSET "calendar
XSET $cal_days_in_month =cal_days_in_month($`int_calendar^, $`int_month^, $`int_year^)

XPT builtin setting=is_|array_|file_funcs|cal text=_chooseXSET "builtin
XSET $unset=            unset($`name^)
XSET $sizeof=           sizeof($`array^)
XSET $empty=            empty($`var^)
XSET $basename=         basename($`string_path^)
XSET $base_convert=     base_convert($`string_number^, $`int_fromBase^, $`int_toBase^)
XSET $bcadd=            bcadd($`string_leftOperand^, $`string_rightOperand^`, `INT scale...{{^, `scale^`}}^)
XSET $bccomp=           bccomp($`string_leftOperand^, $`string_rightOperand^`, `INT scale...{{^, `scale^`}}^)
XSET $bcdiv=            bcdiv($`string_leftOperand^, $`string_rightOperand^`, `INT scale...{{^, `scale^`}}^)
XSET $bcmod=            bcmod($`string_leftOperand^, $`string_modulus^)
XSET $bcmul=            bcmul($`string_leftOperand^, $`string_rightOperand^`, `INT scale...{{^, `scale^`}}^)
XSET $bcsub=            bcsub($`string_leftOperand^, $`string_rightOperand^`, `INT scale...{{^, `scale^`}}^)
XSET $bcscale=          bcscale($`int_scale^)
XSET $bin2hex=          bin2hex($`string_str^)
XSET $boolval=          boolval($`mixed_val^)
XSET $chunk_split split a string into smaller chunks=chunk_split($`string_body^`, `INT chunklen=76 CHANGE...{{^, `chunklen^`}}^)
XSET $copy copies file= copy($`string_source^, $`string_dest^)
XSET $count all elements in an array or Countable object=count($`mixed_array_or_countable^`, `INT mode=COUNT_NORMAL CHANGE...{{^, COUNT_RECURSIVE`}}^)

XPT _printfElts hidden 
XSET elts|pre=Echo('')
XSET elts=c_printf_elts( R( 'pattern' ), ',' )
"`pattern^"`elts^

XPT sprintf "sprintf\(...)
sprintf(`$SParg^`str^,`$SPop^`:_printfElts:^`$SParg^)

XPT php_format_Number
number_format(`value^, `num of decimal place^)

XPT php_date_setDefaultTimezone
date_default_timezone_set("`America/Los_Angeles^")

XPT phpg_date_getDefaultTimezone
date_default_timezone_get()

XPT php_format_Date
XSET fmt=pickL('m',{"January":"F","Jan":"M","yyyy":"Y","yy":"y","mm eg 02":"m","m eg 2":"n","dd eg 02":"d","d eg 2":"j","Friday":"l","Fri":"D","w eg 0 for Sunday":"w","h 12 hour format":"g","hh 12 hour format":"h","h 24 hour format":"G","hh 24 hour format":"H","minutes":"i","seconds":"s","am or pm":"a","AM or PM":"A"},"")
`fmt^

XPT php_date_getTimestampFromString synonym=php_getTodayAsTimestamp
strtotime("`today^")

XPT php_getDateFromTimestamp synonym=date abbr
XSET $_format_=ACMB\({'\V\^f\\$':'"`^Trigger("php_format_Date")^"'})
XSET format.ontype=ZS($_format_)
date(`format^`, `timestamp?`^)

XPT ereg "regular expression
`$_xSnipName^(`pattern^, `string^)

XPT preg_match alias=ereg "match

XPT phprs "replace string
preg_replace(`pattern^, `repl str^, `str^)

XPT list "list\(..
XSET arg|post=ExpandInsideEdge(", ","")
list(`arg^)

XPT phpst "strip tags
strip_tags(`string^`, `str excluded tags?`^)

XPT phpesc "escape html special character
htmlspecialchars(`string^);

XPT phpescs "escape string
mysqli_real_escape_string($`connection^, `string^)

XPT phpfmgf "global variable get file uploaded
XSET det=ChooseStr("name", "type", "tmp_name", "size")
$_FILES[`str fieldname^]['`det^']

XPT phpmktime "make time
mktime(`hour?^, `minute?^, `second?^, `month?^, `day?^, `year?^)

XPT phpsetcookies "make cookies
setcookies(`str name^`, `value?^`, `expiring timestamp?^)
