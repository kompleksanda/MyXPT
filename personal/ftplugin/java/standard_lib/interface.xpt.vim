XPTemplate priority=lang-2

let s:f = g:XPTfuncs()

XPTinclude
	  \ _common/common

XPT Comparable alias=_chooseXSET
XSET $compareTo int=compareTo\(`T o^)

XPT Runnable alias=_chooseXSET
XSET $run void When an object implementing interface Runnable is used to create a thread, starting the thread causes the object's run method to be called in that separately executing thread\. The general contract of the method run is that it may take any action whatsoever\.=run\()

XPT Closeable alias=_chooseXSET
XSET $close void Closes this resource, relinquishing any underlying resources\. =close\()

XPT Flushable alias=_chooseXSET
XSET $flush void Flushes this stream by writing any buffered output to the underlying stream\.=flush\()

XPT Readable alias=_chooseXSET
XSET $read int Attempts to read characters into the specified character buffer\. Returns The number of char values added to the buffer, or -1 if this source of characters is at its end=read\(`CharBuffer cb^)

XPT Collection alias=_chooseXSET
XSET $EMPTY_SET Set The empty set (immutable)\.  This set is serializable\.=Collection.EMPTY_SET
XSET $EMPTY_LIST List The empty list (immutable)\.  This list is serializable\.=Collection.EMPTY_LIST
XSET $EMPTY_MAP Map The empty map (immutable)\.  This map is serializable\.=Collection.EMPTY_MAP
XSET $sort <T extends Comparable <? super T>> void Sorts the specified list into ascending order, according to the natural ordering of its elements\.=Collection.sort\(`List <T> list^)
XSET $sort <T> void Sorts the specified list according to the order induced by the specified comparator\.=sort\(`List <T> list^, `Comparator <? super T> c^)
XSET $binarySearch <T> int Searches the specified list for the specified object using the binary search algorithm\.  The list must be sorted into ascending order according to the natural ordering of its elements (as by the sort(List) method) prior to making this call\.=Collection.binarySearch\(`List <? extends Comparable <? super T>> list^, `T key^)
XSET $binarySearch <T> int Searches the specified list for the specified object using the binary search algorithm\.  The list must be sorted into ascending order according to the specified comparator (as by the sort(List, Comparator) method), prior to making this call\.=Collection.binarySearch\(`List <? extends T> list^, `T key^, `Comparator <? super T> c^)
XSET $reverse void Reverses the order of the elements in the specified list\.=Collection.reverse\(`List <?> list^)
XSET $shuffle void Randomly permutes the specified list using a default source of randomness\.  All permutations occur with approximately equal likelihood\.=Collection.shuffle\(`List <?> list^)
XSET $shuffle void Randomly permute the specified list using the specified source of randomness\.  All permutations occur with equal likelihood assuming that the source of randomness is fair\.=Collection.shuffle\(`List <?> list^, `Random rnd^)
XSET $swap void Swaps the elements at the specified positions in the specified list\.=Collection.swap\(`List <?> list^, `int i^, `int j^)
XSET $fill <T> void Replaces all of the elements of the specified list with the specified element\.=Collection.fill\(`List <? super T> list^, `T obj^)
XSET $copy <T> void Copies all of the elements from one list into another\.  After the operation, the index of each copied element in the destination list will be identical to its index in the source list\.=Collection.copy\(`List <? super T> dest^, `List <? extends T> src^)
XSET $min <T extends Object & Comparable <? super T>> T =Collection.min\(`Collection <? extends T> coll^)
XSET $min <T> T Returns the minimum element of the given collection, according to the order induced by the specified comparator\.=Collection.min\(`Collection <? extends T> coll^, `Comparator <? super T> comp^)
XSET $max <T extends Object & Comparable <? super T>> T =max\(`Collection <? extends T> coll^)
XSET $max <T> T Returns the maximum element of the given collection, according to the order induced by the specified comparator\.=max\(`Collection <? extends T> coll^, `Comparator <? super T> comp^)
XSET $rotate void Rotates the elements in the specified list by the specified distance\. After calling this method, the element at index i will be the element previously at index (i - distance) mod list\.size() , for all values of i between 0 and list\.size()-1 , inclusive\.=Collection.rotate\(`List <?> list^, `int distance^)
XSET $replaceAll <T> boolean Replaces all occurrences of one specified value in a list with another\.=Collection.replaceAll\(`List <T> list^, `T oldVal^, `T newVal^)
XSET $indexOfSubList int Returns the starting position of the first occurrence of the specified target list within the specified source list, or -1 if there is no such occurrence\.=Collection.indexOfSubList\(`List <?> source^, `List <?> target^)
XSET $lastIndexOfSubList int Returns the starting position of the last occurrence of the specified target list within the specified source list, or -1 if there is no such occurrence\.=Collection.lastIndexOfSubList\(`List <?> source^, `List <?> target^)
XSET $unmodifiableCollection <T> Collection <T> Returns an unmodifiable view of the specified collection\.=Collectioon.unmodifiableCollection\(`Collection <? extends T> c^)
XSET $unmodifiableSet <T> Set <T> Returns an unmodifiable view of the specified set\.=Collection.unmodifiableSet\(`Set <? extends T> s^)
XSET $unmodifiableSortedSet <T> SortedSet <T> Returns an unmodifiable view of the specified sorted set\.=Collection.unmodifiableSortedSet\(`SortedSet <T> s^)
XSET $unmodifiableNavigableSet <T> NavigableSet <T> Returns an unmodifiable view of the specified navigable set\.=Collection.unmodifiableNavigableSet\(`NavigableSet <T> s^)
XSET $unmodifiableList <T> List <T> Returns an unmodifiable view of the specified list\.=Collection.unmodifiableList\(`List <? extends T> list^)
XSET $unmodifiableMap <K,V> Map <K,V> Returns an unmodifiable view of the specified map\.=Collection.unmodifiableMap\(`Map <? extends K,? extends V> m^)
XSET $unmodifiableSortedMap <K,V> SortedMap <K,V> Returns an unmodifiable view of the specified sorted map\.=Collection.unmodifiableSortedMap\(`SortedMap <K,? extends V> m^)
XSET $unmodifiableNavigableMap <K,V> NavigableMap <K,V> Returns an unmodifiable view of the specified navigable map\.=Collection.unmodifiableNavigableMap\(`NavigableMap <K,? extends V> m^)
XSET $synchronizedCollection <T> Collection <T> turns a synchronized (thread-safe) collection backed by the specified collection\.=Collection.synchronizedCollection\(`Collection <T> c^)
XSET $synchronizedSet <T> Set <T> Returns a synchronized (thread-safe) set backed by the specified set\.=Collection.synchronizedSet\(`Set <T> s^)
XSET $synchronizedSortedSet <T> SortedSet <T> Returns a synchronized (thread-safe) sorted set backed by the specified sorted set\.=Collection.synchronizedSortedSet\(`SortedSet <T> s^)
XSET $synchronizedNavigableSet <T> NavigableSet <T> Returns a synchronized (thread-safe) navigable set backed by the specified navigable set\.=Collection.synchronizedNavigableSet\(`NavigableSet <T> s^)
XSET $synchronizedList <T> List <T> Returns a synchronized (thread-safe) list backed by the specified list\.=Collection.synchronizedList\(`List <T> list^)
XSET $synchronizedMap <K,V> Map <K,V> Returns a synchronized (thread-safe) map backed by the specified map\.=Collection.synchronizedMap\(`Map <K,V> m^)
XSET $synchronizedSortedMap <K,V> SortedMap <K,V> Returns a synchronized (thread-safe) sorted map backed by the specified sorted map\.=Collection.synchronizedSortedMap\(`SortedMap <K,V> m^)
XSET $synchronizedNavigableMap <K,V> NavigableMap <K,V> Returns a synchronized (thread-safe) navigable map backed by the specified navigable map\.=Collection.synchronizedNavigableMap\(`NavigableMap <K,V> m^)
XSET $checkedCollection <E> Collection <E> Returns a dynamically typesafe view of the specified collection\.=Collection.checkedCollection\(`Collection <E> c^, `Class <E> type^)
XSET $checkedQueue <E> Queue <E> Returns a dynamically typesafe view of the specified queue\.=Collection.checkedQueue\(`Queue <E> queue^, `Class <E> type^)
XSET $checkedSet <E> Set <E> Returns a dynamically typesafe view of the specified set\.=Collection.checkedSet\(`Set <E> s^, `Class <E> type^)
XSET $checkedSortedSet <E> SortedSet <E> Returns a dynamically typesafe view of the specified sorted set\.=checkedSortedSet\(`SortedSet <E> s^, `Class <E> type^)
XSET $checkedNavigableSet <E> NavigableSet <E> Returns a dynamically typesafe view of the specified navigable set\.=Collection.checkedNavigableSet\(`NavigableSet <E> s^, `Class <E> type^)
XSET $checkedList <E> List <E> Returns a dynamically typesafe view of the specified list\.=Collection.checkedList\(`List <E> list^, `Class <E> type^)
XSET $checkedMap <K,V> Map <K,V> Returns a dynamically typesafe view of the specified map\.=Collection.checkedMap\(`Map <K,V> m^, `Class <K> keyType^, `Class <V> valueType^)
XSET $checkedSortedMap <K,V> SortedMap <K,V> Returns a dynamically typesafe view of the specified sorted map\.=Collection.checkedSortedMap\(`SortedMap <K,V> m^, `Class <K> keyType^, `Class <V> valueType^)
XSET $checkedNavigableMap <K,V> NavigableMap <K,V> Returns a dynamically typesafe view of the specified navigable map\.=Collection.checkedNavigableMap\(`NavigableMap <K,V> m^, `Class <K> keyType^, `Class <V> valueType^)
XSET $emptyIterator <T> Iterator <T> Returns an iterator that has no elements\.  More precisely, hasNext always returns false \. next always throws NoSuchElementException \. remove always throws IllegalStateException \.=Collection.emptyIterator\()
XSET $emptyListIterator <T> ListIterator <T> =Collection.emptyListIterator\()
XSET $emptyEnumeration <T> Enumeration <T> =Collection.emptyEnumeration\()
XSET $emptySet final <T> Set <T> =Collection.emptySet\()
XSET $emptySortedSet <E> SortedSet <E> =Collection.emptySortedSet\()
XSET $emptyNavigableSet <E> NavigableSet <E> =Collection.emptyNavigableSet\()
XSET $emptyList final <T> List <T> =Collection.emptyList\()
XSET $emptyMap final <K,V> Map <K,V> =Collection.emptyMap\()
XSET $emptySortedMap final <K,V> SortedMap <K,V> =Collection.emptySortedMap\()
XSET $emptyNavigableMap final <K,V> NavigableMap <K,V> =Collection.emptyNavigableMap\()
XSET $singleton <T> Set <T> Returns an immutable set containing only the specified object\.=Collection.singleton\(`T o^)
XSET $singletonMap <K,V> Map <K,V> Returns an immutable map, mapping only the specified key to the specified value\.=Collection.singletonMap\(`K key^, `V value^)
XSET $nCopies <T> List <T> Returns an immutable list consisting of n copies of the specified object\.=Collection.nCopies\(`int n^, `T o^)
XSET $reverseOrder <T> Comparator <T> Returns a comparator that imposes the reverse of the natural ordering on a collection of objects that implement the Comparable interface\.=Collection.reverseOrder\()
XSET $reverseOrder <T> Comparator <T> Returns a comparator that imposes the reverse ordering of the specified comparator\.=Collection.reverseOrder\(`Comparator <T> cmp^)
XSET $enumeration <T> Enumeration <T> Returns an enumeration over the specified collection\.=Collection.enumeration\(`Collection <T> c^)
XSET $list <T> ArrayList <T> Returns an array list containing the elements returned by the specified enumeration in the order they are returned by the enumeration\.=Collection.list\(`Enumeration <T> e^)
XSET $frequency int Returns the number of elements in the specified collection equal to the specified object\.=Collection.frequency\( Collection <?> c, Object o)
XSET $disjoint boolean Returns true if the two specified collections have no elements in common\.=Collection.disjoint\(`Collection <?> c1^, `Collection <?> c2^)
XSET $addAll @SafeVarargs <T> boolean Adds all of the specified elements to the specified collection\.=Collection.addAll\(`Collection <? super T> c^, `T\.\.\. elements^)
XSET $newSetFromMap <E> Set <E> Returns a set backed by the specified map\.  The resulting set displays the same ordering, concurrency, and performance characteristics as the backing map\.=Collection.newSetFromMap\(`Map <E, Boolean > map^)
XSET $asLifoQueue <T> Queue <T> Returns a view of a Deque as a Last-in-first-out (Lifo) Queue \.=Collection.asLifoQueue\(`Deque <T> deque^)

XPT Enumeration alias=_chooseXSET
XSET $hasMoreElements boolean Tests if this enumeration contains more elements\.=hasMoreElements\()
XSET $nextElement E Returns the next element of this enumeration if this enumeration object has at least one more element to provide\.=nextElement\()


