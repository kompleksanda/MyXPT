XPTemplate priority=lang


XPT _iterator_funcs hidden
public function rewind(){//back to the start
}
public function key(){
}
public function current(){// return the current value
}
public function next(){
}
public function valid(){ //check whether object contains more entries
    return false;
}

XPT _iteratorAggregate_funcs hidden
public function getIterator(){
}

XPT IteratorAggregate alias=_chooseXSET
XSET $getIterator=getIterator\()

XPT Iterator alias=_chooseXSET
XSET $rewind back to the start=rewind\()
XSET $key=key\()
XSET $current return the current value=current\()
XSET $next=next\()
XSET $valid check whether array contains more entries=valid\()

XPT _countable_funcs hidden
public function count(){

}

XPT ArrayIterator setting=_chooseXSET
XSET $new ArrayIterator=ArrayIterator\(`OP MIXED array=array ()^)
XSET $append=       append($`mixed_value^)
XSET $asort by values no value is returned=asort\()
XSET $count  gets the number of elements in the array , or the number of   public properties in the object \. (((public int [][] RET_DESC: The number of elements or public properties in the associated array or object , respectively\.=count\()
XSET $getArrayCopy return a copy of the array, export it to an array or array of public properties   if ArrayIterator refers to an object \.=getArrayCopy\()
XSET $getFlags=     getFlags\()
XSET $ksort by keys no value is returned=ksort\()
XSET $natcasesort sort the entries by values using a case insensitive "natural order" algorithm\. no return=natcasesort\()
XSET $natsort sort the entries by values using a "natural order" algorithm\. no return=natsort\()
XSET $offsetExists return TRUE if the offset exists, otherwise FALSE = offsetExists($`string_index^)
XSET $offsetGet return the value at offset index \.=offsetGet($`string_index^)
XSET $offsetSet sets a value for a given offset\. no return=offsetSet($`string_index^, $`string_newVal^)
XSET $offsetUnset unsets a value for an offset\. no return=offsetUnset($`string_index^)
XSET $seek seek to position=seek($`int_position^)
XSET $serialize returns the serialized ArrayIterator=serialize\()
XSET $setFlags=setFlags\()
XSET $uasort sort the entries by values using user defined function\.=uasort\(`string cmp_function^)
XSET $uksort  sort the entries by key using user defined function\.=uksort\(`string cmp_function^)
XSET $unserialize return the ArrayIterator=unserialize\(`string serialized^)
`SettingK("Iterator")^`function^

XPT FilesystemIterator alias=_chooseXSET
XSET $new FilesystemIterator=FilesystemIterator($`string_path^)
XSET $current=          current\()
XSET $key for the current file=key\()
XSET $next=             next\()
XSET $rewind=           rewind\()

XPT ArrayObject setting=_chooseXSET
XSET $new ArrayObject {ITERATOR_CLASS : Specify the class that will be used for iteration of the ArrayObject object\.} [][] EXCEPTION:  Throws InvalidArgumentException when: input is not an array or object flags is not an integer iterator_class is not an object that implements Iterator=ArrayObject\(`OP  mixed input \= []^`, `OP  int flags \= 0^`, `OP  string iterator_class \= "ArrayIterator"^)
XSET $exchangeArray exchange the array for another one\. [] exchange the current array with another array or object \. (((public array [][] RET_DESC: Returns the old array \. [][] {INPUT : The new array or object to exchange with the current array\.})))=exchangeArray(`mixed input^)
XSET $getIterator create a new iterator from an ArrayObject instance [] create a new iterator from an ArrayObject instance\. (((public ArrayIterator [][] RET_DESC: An iterator from an ArrayObject \.)))=getIterator()
XSET $getIteratorClass gets the iterator classname for the ArrayObject\. [] gets the class name of the array iterator that is used by ArrayObject::getIterator() \. (((public string [][] RET_DESC: Returns the iterator class name that is used to iterate over this object\.)))=getIteratorClass()
XSET $setIteratorClass sets the iterator classname for the ArrayObject\. [] sets the classname of the array iterator that is used by ArrayObject::getIterator() \. (((public void [][] RET_DESC: No value is returned\. [][] {ITERATOR_CLASS : The classname of the array iterator to use when iterating over this object\.})))=setIteratorClass(`string iterator_class^)
XSET function.def=getVariables([""])
`function^