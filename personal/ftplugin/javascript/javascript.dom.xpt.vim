XPTemplate priority=lang-2

XPT _commonEvent hidden
XSET $onabort=onabort
XSET $onblur=onblur
XSET $oncanplay=oncanplay
XSET $oncanplaythrough=oncanplaythrough
XSET $onchange=onchange
XSET $onclick=onclick
XSET $oncontextmenu =oncontextmenu
XSET $ondblclick=ondblclick
XSET $ondrag=ondrag
XSET $ondragend=ondragend
XSET $ondragenter=ondragenter
XSET $ondragleave=ondragleave
XSET $ondragover=ondragover
XSET $ondragstart=ondragstart
XSET $ondrop=ondrop
XSET $ondurationchange=ondurationchange
XSET $onemptied=onemptied
XSET $onended=onended
XSET $onerror=onerror
XSET $onfocus=onfocus
XSET $oninput=oninput
XSET $oninvalid=oninvalid
XSET $onkeydown=onkeydown
XSET $onkeypress=onkeypress
XSET $onkeyup=onkeyup
XSET $onload=onload
XSET $onloadeddata=onloadeddata
XSET $onloadedmetadata=onloadedmetadata
XSET $onloadstart=onloadstart
XSET $onmousedown=onmousedown
XSET $onmouseenter=onmouseenter
XSET $onmouseleave=onmouseleave
XSET $onmousemove=onmousemove
XSET $onmouseup=onmouseup
XSET $onpause=onpause
XSET $onplay=onplay
XSET $onplaying=onplaying
XSET $onprogress=onprogress
XSET $onratechange=onratechange
XSET $onreset=onreset
XSET $onresize=onresize
XSET $onscroll=onscroll
XSET $onseeked=onseeked
XSET $onseeking=onseeking
XSET $onselect=onselect
XSET $onshow=onshow
XSET $onstalled=onstalled
XSET $onsubmit=onsubmit
XSET $onsuspend=onsuspend
XSET $ontimeupdate=ontimeupdate
XSET $onvolumechange=onvolumechange
XSET $onwaiting=onwaiting

XPT _commonEventHTMLElementANDDocument hidden
XSET $onmouseout=onmouseout
XSET $onmouseover=onmouseover
XSET $dir set and get=dir
XSET $hidden set and get --hidden \=false=hidden
XSET $title get and set the value of the title attribute of an element \= "Title Page"=title

XPT _commonEventDocumentANDbuiltin hidden
XSET $onmozfullscreenchange=onmozfullscreenchange
XSET $onmozfullscreenerror=onmozfullscreenerror
XSET $onmozpointerlockchange=onmozpointerlockchange
XSET $onmozpointerlockerror=onmozpointerlockerror
XSET $onwheel=onwheel

XPT _commonEventElementANDDocument hidden
XSET $oncopy get and set=oncopy
XSET $oncut get and set=oncut
XSET $onpaste get and set=onpaste
XSET $childElementCount \= 2=childElementCount
XSET $children collection of an element"s child element (excluding text and comment nodes)=children.Trigger("HTMLCollection")
XSET $firstElementChild=firstElementChild.
XSET $lastElementChild=lastElementChild.
XSET $querySelector Returns the first child element that matches a specified CSS selector(s) of an element=querySelector\()
XSET $querySelectorAll Returns all child elements that matches a specified CSS selector(s) of an element=querySelectorAll\()
XSET $getElementsByClassName=getElementsByClassName\(`str^)
XSET $getElementsByTagName=getElementsByTagName\(`str^)
XSET $getElementsByTagNameNS=getElementsByTagNameNS\()

XPT _commonPropertyHTMLDocumentANDbuiltin hidden
XSET $getSelection=getSelection\()
XSET $location=location.Trigger("Location")

XPT Ddocument
XSET $document.adoptNode() Adopts a node from another document=`document^.adoptNode\()
XSET $document.documentMode Returns the mode used by the browser to render the document=`document^.documentMode
XSET $document.renameNode() Renames the specified node=`document^.renameNode\()
XSET $document.strictErrorChecking Sets or returns whether error-checking isenforced or not=`document^.strictErrorChecking

XPT ALL alias=_chooseXSET
XSET $getFeature() Returns an object which implements the APIs of a specified feature=getFeature\()
XSET $isSupported() Returns true if a specified feature is supported on the element=isSupported\()
XSET $nodelist\.item() Returns the node at the specified index in a NodeList=nodelist.item\()
XSET $nodelist\.length Returns the number of nodes in a NodeList=nodelist.length 


XPT Object alias=_chooseXSET
XSET $hasOwnProperty{Object}=hasOwnProperty\()
XSET $isPrototypeOf{Object}=isPrototypeOf\()
XSET $propertyIsEnumerable{Object}=propertyIsEnumerable\()
XSET $toLocaleString{Object}=toLocaleString\()
XSET $toString{Object}=toString\()
XSET $valueOf{Object}=valueOf\()
XSET $get{Object}=get\()
XSET $set{Object}=set\()
XSET $watch Watches for assignment to a property named prop in this object, calling handler(prop, oldval, newval) whenever prop is set and storing the return value in that property=watch\("`prop^", function (`prop^, `oldVal^, `newVal^){\n    `cursor\n})
XSET $unwatch=unwatch\("`prop^")

XPT EventTarget setting=Object text=_chooseXSET
XSET $addEventListener{EventTarget}=addEventListener\()
XSET $dispatchEvent{EventTarget}=dispatchEvent\()
XSET $removeEventListener{EventTarget}=removeEventListener\()

XPT FontFaceSet setting=EventTarget alias=_chooseXSET
XSET $add=add\()
XSET $check=check\()
XSET $clear=clear\()
XSET $delete=delete\()
XSET $entries=entries\()
XSET $forEach=forEach\()
XSET $has=has\()
XSET $keys=keys\()
XSET $load=load\()
XSET $onloading=onloading
XSET $onloadingdone=onloadingdone
XSET $onloadingerror=onloadingerror
XSET $ready=ready
XSET $size \= 0=size
XSET $status \= "loaded"=status
XSET $values=values\()

XPT Node setting=EventTarget text=_chooseXSET
XSET $ATTRIBUTE_NODE \= 2 = ATTRIBUTE_NODE
XSET $CDATA_SECTION_NODE \= 4 = CDATA_SECTION_NODE
XSET $COMMENT_NODE \= 8 = COMMENT_NODE
XSET $DOCUMENT_FRAGMENT_NODE \= 11 = DOCUMENT_FRAGMENT_NODE
XSET $DOCUMENT_NODE \= 9 =DOCUMENT_NODE
XSET $DOCUMENT_POSITION_CONTAINED_BY \= 16 = DOCUMENT_POSITION_CONTAINED_BY
XSET $DOCUMENT_POSITION_CONTAINS \= 8 = DOCUMENT_POSITION_CONTAINS
XSET $DOCUMENT_POSITION_DISCONNECTED \= 1 = DOCUMENT_POSITION_DISCONNECTED
XSET $DOCUMENT_POSITION_FOLLOWING \= 4 = DOCUMENT_POSITION_FOLLOWING
XSET $DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC \= 32 DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC
XSET $DOCUMENT_POSITION_PRECEDING \= 2 = DOCUMENT_POSITION_PRECEDING
XSET $DOCUMENT_TYPE_NODE \= 10 = DOCUMENT_TYPE_NODE
XSET $ELEMENT_NODE \= 1 = ELEMENT_NODE
XSET $ENTITY_NODE \= 6 = ENTITY_NODE
XSET $ENTITY_REFERENCE_NODE \= 5 = ENTITY_REFERENCE_NODE
XSET $NOTATION_NODE \= 12 = NOTATION_NODE
XSET $PROCESSING_INSTRUCTION_NODE \= 7 = PROCESSING_INSTRUCTION_NODE
XSET $TEXT_NODE \= 3 = TEXT_NODE
XSET $appendChild=appendChild\()
XSET $baseURI \= "file:///D:/alex/mylocalhost/test/index\.html"=baseURI
XSET $childNodes collection of an element"s child nodes (including text and comment nodes)=childNodes.Trigger("NodeList")
XSET $cloneNode Clones an element=cloneNode\()
XSET $compareDocumentPosition  Compares the document position of two elements=compareDocumentPosition\()
XSET $contains  Returns true if a node is a descendant of a node, otherwise false=contains\()
XSET $firstChild=firstChild.
XSET $hasChildNodes=hasChildNodes\()
XSET $insertBefore=insertBefore\()
XSET $isDefaultNamespace Returns true if a specified namespaceURI is the default, otherwise false=isDefaultNamespace\()
XSET $isEqualNode  Checks if two elements are equal=isEqualNode\()
XSET $isSameNode  Checks if two elements are the same node=isSameNode\()
XSET $lastChild=lastChild.
XSET $localName \= "h3"=localName
XSET $lookupNamespaceURI=lookupNamespaceURI\()
XSET $lookupPrefix=lookupPrefix\()
XSET $namespaceURI \= "http://www\.w3\.org/1999/xhtml"=namespaceURI
XSET $nextSibling=nextSibling.
XSET $nodeName \= "H3","#document"=nodeName
XSET $nodeType \= 1=nodeType
XSET $nodeValue get and set = nodeValue
XSET $normalize  Joins adjacent text nodes and removes empty text nodes in an  element=normalize\()
XSET $ownerDocument Returns the root element (document object) for an element=ownerDocument.
XSET $parentElement=parentElement.
XSET $parentNode=parentNode.
XSET $previousSibling=previousSibling.
XSET $removeChild=removeChild\()
XSET $replaceChild=replaceChild\()
XSET $textContent get and set the textual content of a node and its descendants =textContent

XPT DOMImplementation setting=Object alias=_chooseXSET
XSET $createDocument=createDocument\()
XSET $createDocumentType=createDocumentType\()
XSET $createHTMLDocument=createHTMLDocument\()
XSET $hasFeature=hasFeature\()

XPT Document setting=Node|_commonEvent|_commonEventHTMLElementANDDocument|_commonEventDocumentANDbuiltin|_commonEventElementANDDocument text=_chooseXSET
XSET $URL \= "file:///D:/alex/mylocalhost/test/index\.html"=URL
XSET $activeElement Returns the currently focused element in the document=activeElement.
XSET $adaptNode=adaptNode\()
XSET $caretPositionFromPoint=caretPositionFromPoint\()
XSET $characterSet \= "windows-1252","UTF-8"=characterSet
XSET $compatMode \= "BackCompat","CSS1Compat"=compatMode
XSET $contentType \= "text/html"=contentType
XSET $createAttribute=createAttribute\()
XSET $createAttributeNS=createAttributeNS\()
XSET $createCDATASection=createCDATASection\()
XSET $createComment=createComment\()
XSET $createDocumentFragment=createDocumentFragment\()
XSET $createElement=createElement\()
XSET $createEvent=createEvent\()
XSET $createExpression=createExpression\()
XSET $createNSResolver=createNSResolver\()
XSET $createNodeIterator=createNodeIterator\()
XSET $createProcessingInstruction=createProcessingInstruction\()
XSET $createRange=createRange\()
XSET $createTextNode=createTextNode\()
XSET $createTreeWalker=createTreeWalker\()
XSET $currentScript=currentScript
XSET $defaultView refers to Window object=defaultView.Trigger("builtin")
XSET $doctype Returns the Document Type Declaration associated with the document=doctype
XSET $documentElement normally refers to the HTMLHtmlElement tag=documentElement.
XSET $documentURI Sets or returns the location of the document \= "file:///D:/alex/mylocalhost/test/index\.html"=documentURI
XSET $elementFromPoint=elementFromPoint\()
XSET $enableStyleSheetForSet=enableStyleSheetForSet\()
XSET $evaluate=evaluate\()
XSET $fonts=fonts.Trigger("FontFaceSet")
XSET $getElementById=getElementById\(`str^)
XSET $hasFocus Returns a Boolean value indicating whether the document has focus=hasFocus\()
XSET $implementation=implementation.Trigger("DOMImplementation")
XSET $importNode Imports a node from another document=importNode\()
XSET $inputEncoding \= "windows-1252","UTF-8"=inputEncoding
XSET $lastModified \= "12/22/2018 01:20:34"=lastModified
XSET $lastStyleSheet=lastStyleSheet
XSET $mozCancelFullScreen=mozCancelFullScreen\()
XSET $mozExitPointerLock=mozExitPointerLock\()
XSET $mozFullScreen \= false=mozFullScreen
XSET $mozFullScreenElement=mozFullScreenElement
XSET $mozFullScreenEnabled \= true=mozFullScreenEnabled
XSET $mozHidden \= false=mozHidden
XSET $mozPointerLockElement=mozPointerLockElement
XSET $mozSetImageElement=mozSetImageElement\()
XSET $mozVisibilityState \= "visible"=mozVisibilityState
XSET $onafterscriptexecute=onafterscriptexecute
XSET $onbeforescriptexecute=onbeforescriptexecute
XSET $onreadystatechange=onreadystatechange
XSET $preferredStyleSheetSet=preferredStyleSheetSet
XSET $readyState Returns the (loading) status of the document \= "complete","loading"=readyState
XSET $referrer Returns the URL of the document that loaded the current document=referrer
XSET $releaseCapture=releaseCapture\()
XSET $selectedStyleSheetSet
XSET $styleSheetSets=styleSheetSets
XSET $styleSheets=styleSheets.Trigger("StyleSheetList")
XSET $visibilityState \= "visible"=visibilityState

XPT HTMLDocument synonym=doc setting=Document|_commonPropertyHTMLDocumentANDbuiltin text=_chooseXSET
XSET $alinkColor get and set=alinkColor
XSET $all=all.Trigger("HTMLAllCollection")
XSET $anchors=anchors.Trigger("HTMLCollection")
XSET $applets=applets.Trigger("HTMLCollection")
XSET $bgColor set and get=bgColor
XSET $body set and get refres to HTMLBodyElement=body.
XSET $captureEvents=captureEvents\()
XSET $clear=clear\()
XSET $close Closes the output stream previously opened with document\.open()=close\()
XSET $cookie set and get=cookie\()
XSET $designMode \= "off"=designMode
XSET $domain Returns the domain name of the server that loaded the document=domain
XSET $embeds=embeds.Trigger("HTMLCollection")
XSET $execCommand=execCommand\()
XSET $fgColor set and get=fgColor\()
XSET $forms=forms.Trigger("HTMLCollection")
XSET $getElementsByName=getElementsByName\(`str^)
XSET $getItems=getItems\()
XSET $head refers to HTMLHeadElement=head.
XSET $height [CHROME] \= 247=height
XSET $images=images.Trigger("HTMLCollection")
XSET $linkColor get and set=linkColor
XSET $links=links.Trigger("HTMLCollection")
XSET $open Opens an HTML output stream to collect output from document\.write()=open\()
XSET $plugins=plugins\()
XSET $queryCommandEnabled=queryCommandEnabled\()
XSET $queryCommandIndeterm=queryCommandIndeterm\()
XSET $queryCommandState=queryCommandState\()
XSET $queryCommandSupported=queryCommandSupported\()
XSET $queryCommandValue=queryCommandValue\()
XSET $releaseEvents=releaseEvents\()
XSET $scripts=scripts.Trigger("HTMLCollection")
XSET $vlinkColor set and get=vlinkColor
XSET $write=write\()
XSET $writeln=writeln\()
XSET $width [CHROME] \= 1366=width

XPT StyleSheetList setting=Object text=_chooseXSET
XSET $item=item\()
XSET $length=length
XSET $[n] CSSStyleSheet=[0].Trigger("CSSStyleSheet")

XPT _commonPropertyCharacterDataANDElement hidden
XSET $nextElementSibling=nextElementSibling.
XSET $previousElementSibling=previousElementSibling.
XSET $remove=remove\()

XPT CharacterData setting=Node|_commonPropertyCharacterDataANDElement text=_chooseXSET
XSET $appendData=appendData\()
XSET $data get and set \= "Red"=data
XSET $deleteData=deleteData\()
XSET $insertData=insertData\()
XSET $length=length
XSET $replaceData=replaceData\()
XSET $substringData=substringData\()

XPT Text setting=CharacterData alias=_chooseXSET
XSET $getDestinationInsertionPoints=getDestinationInsertionPoints\()
XSET $splitText=splitText\()
XSET $wholeText \= "Red"=wholeText

XPT Element setting=Node|_commonEventElementANDDocument|_commonPropertyCharacterDataANDElement text=_chooseXSET
XSET $animate=animate\()
XSET $attributes=attributes.Trigger("NamedNodeMap")
XSET $blur=blur\()
XSET $classList the class name(s) of an element=classList.Trigger("DOMTokenList")
XSET $className set and get=className
XSET $clientHeight the height of an element, including padding=clientHeight
XSET $clientLeft the width of the left border of an element=clientLeft
XSET $clientTop the width of the top border of an element=clientTop
XSET $clientWidth the width of an element, including padding=clientWidth
XSET $closest=closest\()
XSET $createShadowRoot=createShadowRoot\()
XSET $dataset=dataset
XSET $focus=focus\()
XSET $getAttribute Returns the specified attribute value of an element node=getAttribute\()
XSET $getAttributeNS=getAttributeNS\()
XSET $getAttributeNode Returns the specified attribute node=getAttributeNode\()
XSET $getAttributeNodeNS=getAttributeNodeNS\()
XSET $getBoundingClientRect=getBoundingClientRect\()
XSET $getClientRects=getClientRects\()
XSET $getDestinationInsertionPoints=getDestinationInsertionPoints\()
XSET $hasAttribute Returns true if an element has the specified attribute, otherwise false=hasAttribute\()
XSET $hasAttributeNS=hasAttributeNS\()
XSET $hasAttributes Returns true if an element has any attributes, otherwise false=hasAttributes\()
XSET $id set and get=id
XSET $innerHTML set and get  -- innerHTML \= "s<a>Hello</a>"=innerHTML
XSET $insertAdjacentElement=insertAdjacentElement\()
XSET $insertAdjacentHTML=insertAdjacentHTML\()
XSET $insertAdjacentText=insertAdjacentText\()
XSET $matches=matches\()
XSET $offsetHeight Returns the height of an element, including padding, border and scrollbar=offsetHeight
XSET $offsetLeft=offsetLeft
XSET $offsetParent=offsetParent.
XSET $offsetTop=offsetTop
XSET $offsetWidth Returns the width of an element, including padding, border and scrollbar=offsetWidth
XSET $onbeforecopy get and set=onbeforecopy
XSET $onbeforecut get and set=onbeforecut
XSET $onbeforepaste get and set=onbeforepaste
XSET $onsearch get and set=onsearch
XSET $onselectstart get and set=onselectstart
XSET $onwebkitfullscreenchange get and set=onwebkitfullscreenchange
XSET $onwebkitfullscreenerror get and set=onwebkitfullscreenerror
XSET $onwheel get and set=onwheel
XSET $outerHTML get and set=outerHTML
XSET $prefix=prefix
XSET $removeAttribute Removes a specified attribute from an element=removeAttribute\()
XSET $removeAttributeNS=removeAttributeNS\()
XSET $removeAttributeNode Removes a specified attribute node, and returns the removed node=removeAttributeNode\()
XSET $requestPointerLock=requestPointerLock\()
XSET $scrollHeight Returns the entire height of an element, including padding=scrollHeight
XSET $scrollIntoView=scrollIntoView\()
XSET $scrollIntoViewIfNeeded=scrollIntoViewIfNeeded\()
XSET $scrollLeft set and get=scrollLeft
XSET $scrollTop set and get=scrollTop
XSET $scrollWidth  Returns the entire width of an element, including padding=scrollWidth
XSET $setAttribute Sets or changes the specified attribute, to the specified value=setAttribute\()
XSET $setAttributeNS=setAttributeNS\()
XSET $setAttributeNode Sets or changes the specified attribute node=setAttributeNode\()
XSET $setAttributeNodeNS=setAttributeNodeNS\()
XSET $shadowRoot=shadowRoot
XSET $style=style.Trigger("CSSStyleDeclaration")
XSET $tagName Returns the tag name of an element \= "H3"=tagName
XSET $webkitMatchesSelector=webkitMatchesSelector\()
XSET $webkitRequestFullScreen=webkitRequestFullScreen\()
XSET $webkitRequestFullscreen=webkitRequestFullscreen\()

XPT HTMLElement synonym=elem setting=Element|_chooseXSET|_commonEvent|_commonEventHTMLElementANDDocument text=_chooseXSET
XSET $accessKey set and get=accessKey
XSET $click  Simulates a mouse-click on an element=click\()
XSET $contentEditable set and get \= "inherit"=contentEditable
XSET $draggable set and get \= false=draggable
XSET $innerText set and get=innerText
XSET $isContentEditable \= false=isContentEditable
XSET $lang set and get=lang
XSET $onautocomplete=onautocomplete
XSET $onautocompleteerror=onautocompleteerror
XSET $oncancel=oncancel
XSET $onclose=onclose
XSET $oncuechange=oncuechange
XSET $onmousewheel=onmousewheel
XSET $ontoggle=ontoggle
XSET $outerText set and get=outerText
XSET $spellcheck set and get=spellcheck
XSET $tabIndex Sets or returns the value of the tabindex attribute of an element  \= -1=tabIndex
XSET $translate set and get  \= true=translate
XSET $webkitdropzone set and get=webkitdropzone

XPT HTMLHeadingElement synonym=HTMLDivElement|HTMLParagraphElement setting=HTMLElement text=_chooseXSET
align Not supported in HTML5\. Usestyle\.textAlign instead\. Sets or returns the value of the align attribute of the heading element=align

XPT builtin setting=_chooseXSET|_commonEvent|_commonEventDocumentANDbuiltin|_commonPropertyHTMLDocumentANDbuiltin text=_chooseXSET
XSET $alert=      alert\(`obj^)
XSET $atob=       atob
XSET $blur=       blur
XSET $btoa=       btoa
XSET $cancelAnimationFrame=cancelAnimationFrame
XSET $captureEvents=captureEvents
XSET $clearInterval=clearInterval\(`intervalHandle^)
XSET $clearTimeout=clearTimeout
XSET $close=      close
XSET $closed=     closed
XSET $confirm shows confirm box returns Boolean=confirm\(`message_str^)
XSET $console=    console
XSET $createImageBitmap=createImageBitmap
XSET $crypto=     crypto
XSET $devicePixelRatio=devicePixelRatio
XSET $document=   document
XSET $dump=       dump
XSET $external=   external
XSET $fetch=      fetch
XSET $find=       find
XSET $focus=      focus
XSET $frameElement=frameElement
XSET $frames=     frame
XSET $fullScreen= fullScreen
XSET $getComputedStyle=getComputedStyle
XSET $getDefaultComputedStyle=getDefaultComputedStyle
XSET $history=    history
XSET $indexedDB=  indexedDB
XSET $innerHeight=innerHeight
XSET $innerWidth= innerWidth
XSET $length=     length
XSET $localStorage=localStorage
XSET $locationBar=locationBar
XSET $matchMedia= matchMedia
XSET $menubar=    menubar
XSET $moveBy=     moveBy
XSET $moveTo=     moveTo
XSET $mozInnerScreenX=mozInnerScreenX
XSET $mozInnerScreenY=mozInnerScreenY
XSET $mozPaintCount=mozPaintCount
XSET $navigator=  navigator
XSET $onafterprint=onafterprint
XSET $onbeforeprint=onbeforeprint
XSET $onbeforeonload=onbeforeonload
XSET $ondevicelight=ondevicelight
XSET $ondevicemotion=ondevicemotion
XSET $ondeviceorientation=ondeviceorientation
XSET $ondeviceproximity=ondeviceproximity
XSET $onhashchange=onhashchange
XSET $onoffline=  onoffline
XSET $ononline=   ononline
XSET $onpagehide= onpagehide
XSET $onpageshow= onpageshow
XSET $onunload=   onunload
XSET $onuserproximity=onuserproximity
XSET $open=       open
XSET $opener=     opener
XSET $outerHeight=outerHeight
XSET $outerWidth= outerWidth
XSET $pageXOffset=pageXOffset
XSET $pageYOffset=pageYOffset
XSET $parent=     parent
XSET $performance=performance
XSET $personalbar=personalbar
XSET $postMessage=postMessage
XSET $print=      print
XSET $prompt shows a prompt box for input returns the text in input box, null if cancelled=prompt\(`message_str^, `default_val^)
XSET $releaseEvents=releaseEvents
XSET $requestAnimationFrame=requestAnimationFrame
XSET $resizeBy=   resizeBy
XSET $resizeTo=   resizeTo
XSET $screen=     screen
XSET $screenX=    screenX
XSET $screenY=    screenY
XSET $scroll=     scroll
XSET $scrollBy=   scrollBy
XSET $scrollByLines=scrollByLines
XSET $scrollByPages=scrollByPages
XSET $scrollMaxX= scrollMaxX
XSET $scrollMaxY= scrollMaxY
XSET $scrollTo=   scrollTo
XSET $scrollX=    scrollX
XSET $scrollY=    scrollY
XSET $scrollbars= scrollbars
XSET $sessionStorage=sessionStorage
XSET $setInterval=setInterval\(`fun^, `time_ms^)
XSET $setResizable=setResizable
XSET $setTimeout= setTimeout
XSET $showModalDialog=showModalDialog
XSET $sidebar=    sidebar
XSET $sizeToContent=sizeToContent
XSET $status=     status
XSET $statusbar=  statusbar
XSET $stop=       stop
XSET $toolbal=    toolbal
XSET $updateCommands=updateCommands
XSET $window=     window
XSET $AnalyserNode=AnalyserNode
XSET $AnimationEvent=AnimationEvent
XSET $Array=      Array
XSET $ArrayBuffer=ArrayBuffer
XSET $Attr=       Attr
XSET $Audio=      Audio
XSET $AudioBuffer=AudioBuffer
XSET $AudioBufferSourceNode=AudioBufferSourceNode
XSET $AudioContext=AudioContext
XSET $AudioDestinationNode=AudioDestinationNode
XSET $AudioListener=AudioListener
XSET $AudioNode=  AudioNode
XSET $AudioParam= AudioParam
XSET $AudioProcessingEvent=AudioProcessingEvent
XSET $AudioStreamTrack=AudioStreamTrack
XSET $BarProp=    BarProp
XSET $BatteryManager=BatteryManager
XSET $BeforeUnloadEvent=BeforeUnloadEvent
XSET $BiquadFilterNode=BiquadFilterNode
XSET $Blob=       Blob
XSET $BlobEvent=  BlobEvent
XSET $Boolean=    Boolean\(`expr^)
XSET $BroadcastChannel=BroadcastChannel
XSET $decodeURI Decodes a URI which has been encoded with encodeURIComponent google\.com/page\.php?name="al ex"&age=12 \= "google\.com/page\.php?name=%22al%20ex%22&age=12"=decodeURI\(`encodedURI^)
XSET $decodeURIComponent=decodeURIComponent
XSET $encodeURI Computes a new version of a complete URI replacing each instance of certain characters with escape sequences representing the UTF-8 encoding of the characters=encodeURI
XSET $encodeURIComponent same as encodeURI=encodeURIComponent
XSET $escape=     escape
XSET $eval Evaluates a string of JavaScript code without reference to a particular object eval("2+2") \= 4 ; var b \= 10, eval("var a = 20 + b") a \= 30=eval\(`str^)
XSET $isFinite=   isFinite\(`num^)
XSET $isNaN=      isNaN\(`val^)
XSET $netscape=   netscape
XSET $parseFloat Parses a string argument and returns a floating-point number "12" \= 12; "" OR parseFloat() \= NaN= parseFloat\(`str^)
XSET $parseInt Parses a string argument and returns an integer=   parseInt\(`str^`, `radix?^)
XSET $undefined=  undefined
XSET $unescape=   unescape
XSET $uneval=     uneval
XSET $Infinity=   Infinity
XSET $InternalError=InternalError
XSET $Number Converts an object to a number Number(new Date()) \= 1546068911912; Number("23") \= 23; Number("") \= 0=Number\(`obj^)
XSET $String Converts an object to a string=      String\(`obj^)

XPT NamedNodeMap alias=_chooseXSET
XSET $getNamedItem=getNamedItem\()
XSET $getNamedItemNS=getNamedItemNS\()
XSET $item=item\()
XSET $length=length
XSET $removeNamedItem=removeNamedItem\()
XSET $removeNamedItemNS=removeNamedItemNS\()
XSET $setNamedItem=setNamedItem\()
XSET $setNamedItemNS

XPT NodeList alias=_chooseXSET
XSET $item=item\()
XSET $length=length

XPT HTMLCollection alias=Object
XSET $item=item\()
XSET $length=length
XSET $namedItem=namedItem\()

XPT HTMLAllCollection setting=HTMLCollection text=_chooseXSET
XSET $tags=tags\()

XPT DOMTokenList alias=_chooseXSET
XSET $add=add\()
XSET $contains=contains\()
XSET $entries=entries\()
XSET $forEach=forEach\()
XSET $item=item\()
XSET $keys=keys\()
XSET $length=length
XSET $remove=remove\()
XSET $toString=toString\()
XSET $toggle=toggle\()
XSET $values=values\()

XPT Crypto alias=_chooseXSET
XSET $subtle=subtle.Trigger('SubtleCrypto')
XSET $getRandomValues=getRandomValues

XPT SubtleCrypto alias=_chooseXSET
XSET $decrypt=    decrypt
XSET $deriveBits= deriveBits
XSET $deriveKey=  deriveKey
XSET $digest=     digest
XSET $encrypt=    encrypt
XSET $exportKey=  exportKey
XSET $generateKey=generateKey
XSET $importKey=  importKey
XSET $sign=       sign
XSET $unwrap=     unwrap
XSET $verify=     verify
XSET $wrapKey=    wrapKey

XPT AnimationEvent alias=_chooseXSET
XSET $AnimationName=AnimationName
XSET $elapsedTime=elapsedTime
XSET $pseudoElement-pseudoElement

XPT Attr alias=_chooseXSET
XSET $localName=localName
XSET $name=name
XSET $namespaceURI=namespaceURI
XSET $ownerElement=ownerElement
XSET $prefix=prefix
XSET $specified=specified
XSET $value=value

XPT History alias=_chooseXSET
XSET $back=back
XSET $forward=forward
XSET $go=go
XSET $length=length
XSET $pushState=pushState
XSET $replaceState=replaceState
XSET $state=state

XPT Storage alias=_chooseXSET
XSET $clear=clear
XSET $getItem=getItem
XSET $key=key
XSET $length=length
XSET $removeItem=removeItem
XSET $setItem=setItem

XPT Location alias=_chooseXSET
XSET $assign=assign\()
XSET $hash=hash
XSET $host=host
XSET $hostname=hostname
XSET $href \= "file:///D:/alex/mylocalhost/test2/index\.html"=href
XSET $origin \= "file://"=origin
XSET $password=password
XSET $pathname \= "/D:/alex/mylocalhost/test2/index\.html"=pathname
XSET $port=port
XSET $protocol \= "file:"=protocol
XSET $reload=reload\()
XSET $replace=replace\()
XSET $search=search
XSET $toJSON=toJSON
XSET $toString=toString
XSET $username=username
XSET $valueOf=valueOf

XPT StyleSheet alias=_chooseXSET
XPT CSSStyleSheet alias=StyleSheet
XSET $addRule=addRule\()
XSET $deleteRule=deleteRule\()
XSET $insertRule=insertRule\()
XSET $removeRule=removeRule\()
XSET $cssRules=cssRules
XSET $disabled: false=disabled
XSET $href \= "file:///D:/alex/mylocalhost/test2/main\.css"=href
XSET $media=media.Trigger("MediaList")
XSET $ownerNode the HTMLLinkElement of stylesheet=ownerNode.
XSET $ownerRule=ownerRule
XSET $parentStyleSheet=parentStyleSheet
XSET $rules=rules
XSET $title=title
XSET $type \= "text/css"=type

XPT MediaList alias=_chooseXSET
XSET $appendMedium=appendMedium\()
XSET $deleteMedium=deleteMedium\()
XSET $item=item\()
XSET $length=length
XSET $mediaText\= "screen"=mediaText
XSET $[n] String=[0].Trigger("str")

XPT DomStringList alias=_chooseXSET
XSET contains=contains\()
XSET item=item\()

XPT Navigator alias=_chooseXSET
XSET $appCodeName=appCodeName
XSET $appName=appName
XSET $appVersion=appVersion
XSET $battery=battery
XSET $buildID=buildID
XSET $cookieEnabled=cookieEnabled
XSET $doNotTrack=doNotTrack
XSET $geolocation=geolocation
XSET $language=language
XSET $mediaDevices=mediaDevices
XSET $mimeTypes=mimeTypes
XSET $mozApps=mozApps
XSET $mozContacts=mozContacts
XSET $mozPay=mozPay
XSET $mozTCPSocket=mozTCPSocket
XSET $onLine=onLine
XSET $oscpu=oscpu
XSET $platform=platform
XSET $plugins=plugins
XSET $product=product
XSET $productStub=productStub
XSET $serviceWorker=serviceWorker
XSET $userAgent=userAgent
XSET $vendor=vendor
XSET $vendorStub=vendorStub

XPT HTMLAnchorElement alias=_chooseXSET
XSET $charset get and set  Not supported in HTML5 the value of the charset attribute of a link=charset
XSET $coords get and set=coords
XSET $download get and set the value of the download attribute of a link=download
XSET $hash get and set the anchor part of the href attribute value \= "#red"=hash
XSET $host get and set the hostname and port part of the href attribute value=host
XSET $hostname get and set the hostname part of the href attribute value=hostname
XSET $href get and set \= "file:///D:/alex/mylocalhost/test/index\.html#red"=href
XSET $hreflang the value of the hreflang attribute of a link=hreflang
XSET $name get and set Not supported in HTML5 Use id instead.Sets or returns the value ofthe name attribute of a link=name
XSET $origin \= "file://", "null" in moz, the protocol, hostname and port part of the href attribute value=origin
XSET $password get and set the password part of the href attribute value=password
XSET $pathname get and set the pathname part of the href attribute \= "/D:/alex/mylocalhost/test/index\.html"=pathname
XSET $ping get and set=ping
XSET $port get and set the port part of the href attribute value=port
XSET $protocol get and set the protocol part of the href attribute value \= "file:"=protocol
XSET $rel get and set the value of the rel attribute of a link=rel
XSET $relList for moz=relList.Trigger("DOMTokenList")
XSET $rev get and set Not supported in HTML5 Sets or returns the value of the revattribute of a link=rev
XSET $search get and set the querystring part of the href attribute value=search
XSET $searchParams for moz=searchParams.Trigger("URLSearchParams")
XSET $shape get and set=shape
XSET $target get and set the value of the target attribute of a link=target
XSET $text get and set the text content of a link=text
XSET $type get and set the value of the type attribute of a link=type
XSET $username get and set the username part of the href attribute value=username

XPT URLSearchParams alias=_chooseXSET
XSET $append=append\()
XSET $delete=delete\()
XSET $get=get\()
XSET $getAll=getAll\()
XSET $has=has\()
XSET $set=set\()
XSET $toString=toString\()

XPT HTMLHtmlElement alias=_chooseXSET
XSET $version=version

XPT HTMLBRElement alias=_chooseXSET
XSET $clear=clear

XPT HTMLBodyElement alias=_chooseXSET
XSET $aLink get and set Not supported in HTML5 the color of an active link in a document=aLink
XSET $background get and set Not supported in HTML5 Use style\.backgroundImage instead\. the background image for a document=background
XSET $bgColor get and set Not supported in HTML5 Use style\.backgroundColor instead\. the background color of a document=bgColor
XSET $link Not supported in HTML5 Sets or returns the color of unvisited links in a document=link
XSET $onbeforeonload get and set=onbeforeonload
XSET $onblur get and set=onblur
XSET $onerror get and set=onerror
XSET $onfucus get and set=onfucus
XSET $onhashchange get and set=onhashchange
XSET $onlanguagechange get and set=onlanguagechange
XSET $onload get and set=onload
XSET $onmessage get and set=onmessage
XSET $onoffline get and set=onoffline
XSET $ononline get and set=ononline
XSET $onpagehide get and set=onpagehide
XSET $onpageshow get and set=onpageshow
XSET $onpopstate get and set=onpopstate
XSET $onresize get and set=onresize
XSET $onscroll get and set=onscroll
XSET $onstorage get and set=onstorage
XSET $onunload=onunload
XSET $text Not supported in HTML5 Use style\.color instead\. Sets or returns the color of the text in a document=text
XSET $vlink Not supported in HTML5 Sets or returns the color of visited links in a document=vlink

XPT HTMLAreaElement alias=_chooseXSET
XSET $alt Sets or returns the value of the alt attribute of an area=alt
XSET $coords Sets or returns the value of the coords attribute of an area=coords
XSET $hash Sets or returns the anchor part of the href attribute value=hash
XSET $host Sets or returns the hostname and port part of the href attributevalue=host
XSET $hostname Sets or returns the hostname part of the href attribute value=hostname
XSET $href Sets or returns the value of the href attribute of an area=href
XSET $noHref Not supported in HTML5\. Sets or returns the value of the nohrefattribute of an area=noHref
XSET $origin Returns the protocol, hostname and port part of the hrefattribute value=origin
XSET $password Sets or returns the password part of the href attribute value=password
XSET $pathname Sets or returns the pathname part of the href attribute value=pathname
XSET $port Sets or returns the port part of the href attribute value=port
XSET $protocol Sets or returns the protocol part of the href attribute value=protocol
XSET $search Sets or returns the querystring part of the href attribute value=search
XSET $shape Sets or returns the value of the shape attribute of an area=shape
XSET $target Sets or returns the value of the target attribute of an area=target
XSET $username Sets or returns the username part of the href attribute value=username

XPT HTMLAudioElement alias=_chooseXSET
XSET $audioTracks Returns an AudioTrackList object representing available audio tracks=audioTracks
XSET $autoplay Sets or returns whether the audio should start playing as soon as it is ready=autoplay
XSET $buffered Returns a TimeRanges object representing the buffered parts of an audio=buffered
XSET $controller Returns the MediaController object representing the current media controller of an audio=controller
XSET $controls Sets or returns whether an audio should have controls displayed (play/pause etc)=controls
XSET $crossOrigin Sets or returns the CORS settings of an audio=crossOrigin
XSET $currentSrc Returns the URL of the current audio=currentSrc
XSET $currentTime Sets or returns the current playback position in an audio (in seconds)=currentTime
XSET $defaultMuted Sets or returns whether the audio should be muted by default=defaultMuted
XSET $defaultPlaybackRate Sets or returns whether the default playback speed of the audio=defaultPlaybackRate
XSET $duration Returns the length of an audio(in seconds)=duration
XSET $ended Returns whether the playback of the audio has ended=ended
XSET $error Returns a MediaError object representing the error state of the audio=error
XSET $loop Sets or returns whether the audio should start playing over again, every time it is finished=loop
XSET $mediaGroup Sets or returns the name of the media group the audio(s) is a part of=mediaGroup
XSET $muted Sets or returns whether the sound should be turned off=muted
XSET $networkState Returns the current network state of an audio=networkState
XSET $paused Sets or returns whether an audio is paused=paused
XSET $playbackRate Sets or returns the speed of the audio playback=playbackRate
XSET $played Returns a TimeRanges object representing the played parts of the audio=played
XSET $preload Sets or returns the value of the preload attribute of an audio=preload
XSET $readyState Returns the current ready state of an audio=readyState
XSET $seekable Returns a TimeRanges object representing the seekable parts of an audio=seekable
XSET $seeking Returns whether the user is currently seeking in the audio=seeking
XSET $src Sets or returns the value of the src attribute of an audio=src
XSET $textTracks Returns a TextTrackList object representing the available text tracks=textTracks
XSET $volume Sets or returns the audio volume of an audio=volume
XSET $addTextTrack() Adds a new text track to the audio=addTextTrack\()
XSET $canPlayType() Checks whether the browser can play the specified audio type=canPlayType\()
XSET $fastSeek() Seeks to a specified time in the audio player=fastSeek\()
XSET $getStartDate() Returns a new Date object, representing the current timeline offset=getStartDate\()
XSET $load() Re-loads the audio element=load\()
XSET $play() Starts playing the audio=play\()
XSET $pause() Pauses the currently playing audio=pause\() 

XPT CSSStyleDeclaration alias=_chooseXSET
XSET $alignContent Sets or returns the alignment between the lines inside a flexible container when the items do not use all available space=alignContent
XSET $alignItems Sets or returns the alignment for items inside a flexible container=alignItems
XSET $alignSelf Sets or returns the alignment for selected items inside a flexible container=alignSelf
XSET $animation A shorthand property for all the animation properties below, except the animationPlayState property=animation
XSET $animationDelay Sets or returns when the animation will start=animationDelay
XSET $animationDirection Sets or returns whether or not the animation should play in reverse on alternate cycles=animationDirection
XSET $animationDuration Sets or returns how many seconds or milliseconds an animation takes to complete one cycle=animationDuration
XSET $animationFillMode Sets or returns what values are applied by the animation outside the time it is executing=animationFillMode
XSET $animationIterationCount Sets or returns the number of times an animation should be played=animationIterationCount
XSET $animationName Sets or returns a name for the @keyframes animation=animationName
XSET $animationTimingFunction Sets or returns the speed curve of the animation=animationTimingFunction
XSET $animationPlayState Sets or returns whether the animation is running or paused=animationPlayState
XSET $background Sets or returns all the background properties in one declaration=background
XSET $backgroundAttachment Sets or returns whether a background-image is fixed or scrolls with the page=backgroundAttachment
XSET $backgroundColor Sets or returns the background-color of an element=backgroundColor
XSET $backgroundImage Sets or returns the background-image for an element=backgroundImage
XSET $backgroundPosition Sets or returns the starting position of a background-image=backgroundPosition
XSET $backgroundRepeat Sets or returns how to repeat (tile) a background-image=backgroundRepeat
XSET $backgroundClip Sets or returns the painting area of the background=backgroundClip
XSET $backgroundOrigin Sets or returns the positioning area of the background images=backgroundOrigin
XSET $backgroundSize Sets or returns the size of the background image=backgroundSize
XSET $backfaceVisibility Sets or returns whether or not an element should be visible when not facing the screen=backfaceVisibility
XSET $border Sets or returns borderWidth, borderStyle, and borderColor in one declaration=border
XSET $borderBottom Sets or returns all the borderBottom* properties in one declaration=borderBottom
XSET $borderBottomColor Sets or returns the color of the bottom border=borderBottomColor
XSET $borderBottomLeftRadius Sets or returns the shape of the border of the bottom-left corner=borderBottomLeftRadius
XSET $borderBottomRightRadius Sets or returns the shape of the border of the bottom-right corner=borderBottomRightRadius
XSET $borderBottomStyle Sets or returns the style of the bottom border=borderBottomStyle
XSET $borderBottomWidth Sets or returns the width of the bottom border=borderBottomWidth
XSET $borderCollapse Sets or returns whether the table border should be collapsed into a single border, or not=borderCollapse
XSET $borderColor Sets or returns the color of an element"s border (can have up to four values)=borderColor
XSET $borderImage A shorthand property for setting or returning all the borderImage* properties=borderImage
XSET $borderImageOutset Sets or returns the amount by which the border image area extends beyond the border box=borderImageOutset
XSET $borderImageRepeat Sets or returns whether the image-border should be repeated, rounded or stretched=borderImageRepeat
XSET $borderImageSlice Sets or returns the inward offsets of the image-border=borderImageSlice
XSET $borderImageSource Sets or returns the image to be used as a border=borderImageSource
XSET $borderImageWidth Sets or returns the widths of the image-border=borderImageWidth
XSET $borderLeft Sets or returns all the borderLeft* properties in one declaration=borderLeft
XSET $borderLeftColor Sets or returns the color of the left border=borderLeftColor
XSET $borderLeftStyle Sets or returns the style of the left border=borderLeftStyle
XSET $borderLeftWidth Sets or returns the width of the left border=borderLeftWidth
XSET $borderRadius A shorthand property for setting or returning all the four border*Radius properties=borderRadius
XSET $borderRight Sets or returns all the borderRight* properties in one declaration=borderRight
XSET $borderRightColor Sets or returns the color of the right border=borderRightColor
XSET $borderRightStyle Sets or returns the style of the right border=borderRightStyle
XSET $borderRightWidth Sets or returns the width of the right border=borderRightWidth
XSET $borderSpacing Sets or returns the space between cells in a table=borderSpacing
XSET $borderStyle Sets or returns the style of an element"s border (can have up to four values)=borderStyle
XSET $borderTop Sets or returns all the borderTop* properties in one declaration=borderTop
XSET $borderTopColor Sets or returns the color of the top border=borderTopColor
XSET $borderTopLeftRadius Sets or returns the shape of the border of the top-left corner=borderTopLeftRadius
XSET $borderTopRightRadius Sets or returns the shape of the border of the top-right corner=borderTopRightRadius
XSET $borderTopStyle Sets or returns the style of the top border=borderTopStyle
XSET $borderTopWidth Sets or returns the width of the top border=borderTopWidth
XSET $borderWidth Sets or returns the width of an element"s border (can have up to four values)=borderWidth
XSET $bottom Sets or returns the bottom position of a positioned element=bottom
XSET $boxDecorationBreak Sets or returns the behaviour of the background and border of an element at page-break, or, for  in-line elements, at line-break.=boxDecorationBreak
XSET $boxShadow Attaches one or more drop-shadows to the box=boxShadow
XSET $boxSizing Allows you to define certain elements to fit an area in a certain way=boxSizing
XSET $captionSide Sets or returns the position of the table caption=captionSide
XSET $clear Sets or returns the position of the element relative to floating objects=clear
XSET $clip Sets or returns which part of a positioned element is visible=clip
XSET $color Sets or returns the color of the text=color
XSET $columnCount Sets or returns the number of columns an element should be divided into=columnCount
XSET $columnFill Sets or returns how to fill columns=columnFill
XSET $columnGap Sets or returns the gap between the columns=columnGap
XSET $columnRule A shorthand property for setting or returning all the columnRule* properties=columnRule
XSET $columnRuleColor Sets or returns the color of the rule between columns=columnRuleColor
XSET $columnRuleStyle Sets or returns the style of the rule between columns=columnRuleStyle
XSET $columnRuleWidth Sets or returns the width of the rule between columns=columnRuleWidth
XSET $columns A shorthand property for setting or returning columnWidth and columnCount=columns
XSET $columnSpan Sets or returns how many columns an element should span across=columnSpan
XSET $columnWidth Sets or returns the width of the columns=columnWidth
XSET $content Used with the :before and :after pseudo-elements, to insert generated content=content
XSET $counterIncrement Increments one or more counters=counterIncrement
XSET $counterReset Creates or resets one or more counters=counterReset
XSET $cursor Sets or returns the type of cursor to display for the mouse pointer=cursor
XSET $direction Sets or returns the text direction=direction
XSET $display Sets or returns an element"s display type=display
XSET $emptyCells Sets or returns whether to show the border and background of empty cells, or not=emptyCells
XSET $filter Sets or returns image filters (visual effects, like blur and saturation)=filter
XSET $flex Sets or returns the length of the item, relative to the rest=flex
XSET $flexBasis Sets or returns the initial length of a flexible item=flexBasis
XSET $flexDirection Sets or returns the direction of the flexible items=flexDirection
XSET $flexFlow A shorthand property for the flexDirection and the flexWrap properties=flexFlow
XSET $flexGrow Sets or returns how much the item will grow relative to the rest=flexGrow
XSET $flexShrink Sets or returns how the item will shrink relative to the rest=flexShrink
XSET $flexWrap Sets or returns whether the flexible items should wrap or not=flexWrap
XSET $cssFloat Sets or returns the horizontal alignment of an element=cssFloat
XSET $font Sets or returns fontStyle, fontVariant, fontWeight, fontSize, lineHeight, and fontFamily in one declaration=font
XSET $fontFamily Sets or returns the font family for text=fontFamily
XSET $fontSize Sets or returns the font size of the text=fontSize
XSET $fontStyle Sets or returns whether the style of the font is normal, italic or oblique=fontStyle
XSET $fontVariant Sets or returns whether the font should be displayed in small capital letters=fontVariant
XSET $fontWeight Sets or returns the boldness of the font=fontWeight
XSET $fontSizeAdjust Preserves the readability of text when font fallback occurs=fontSizeAdjust
XSET $fontStretch Selects a normal, condensed, or expanded face from a font family=fontStretch
XSET $hangingPunctuation Specifies whether a punctuation character may be placed outside the line box=hangingPunctuation
XSET $height Sets or returns the height of an element=height
XSET $hyphens Sets how to split words to improve the layout of paragraphs=hyphens
XSET $icon Provides the author the ability to style an element with an iconic equivalent=icon
XSET $imageOrientation Specifies a rotation in the right or clockwise direction that a user agent applies to an image=imageOrientation
XSET $justifyContent Sets or returns the alignment between the items inside a flexible container when the items do not use all available space.=justifyContent
XSET $left Sets or returns the left position of a positioned element=left
XSET $letterSpacing Sets or returns the space between characters in a text=letterSpacing
XSET $lineHeight Sets or returns the distance between lines in a text=lineHeight
XSET $listStyle Sets or returns listStyleImage, listStylePosition, and listStyleType in one declaration=listStyle
XSET $listStyleImage Sets or returns an image as the list-item marker=listStyleImage
XSET $listStylePosition Sets or returns the position of the list-item marker=listStylePosition
XSET $listStyleType Sets or returns the list-item marker type=listStyleType
XSET $margin Sets or returns the margins of an element (can have up to four values)=margin
XSET $marginBottom Sets or returns the bottom margin of an element=marginBottom
XSET $marginLeft Sets or returns the left margin of an element=marginLeft
XSET $marginRight Sets or returns the right margin of an element=marginRight
XSET $marginTop Sets or returns the top margin of an element=marginTop
XSET $maxHeight Sets or returns the maximum height of an element=maxHeight
XSET $maxWidth Sets or returns the maximum width of an element=maxWidth
XSET $minHeight Sets or returns the minimum height of an element=minHeight
XSET $minWidth Sets or returns the minimum width of an element=minWidth
XSET $navDown Sets or returns where to navigate when using the arrow-down navigation key=navDown
XSET $navIndex Sets or returns the tabbing order for an element=navIndex
XSET $navLeft Sets or returns where to navigate when using the arrow-left navigation key=navLeft
XSET $navRight Sets or returns where to navigate when using the arrow-right navigation key=navRight
XSET $navUp Sets or returns where to navigate when using the arrow-up navigation key=navUp
XSET $opacity Sets or returns the opacity level for an element=opacity
XSET $order Sets or returns the order of the flexible item, relative to the rest=order
XSET $orphans Sets or returns the minimum number of lines for an element that must be left at the bottom of a page when a page break occurs inside an element=orphans
XSET $outline Sets or returns all the outline properties in one declaration=outline
XSET $outlineColor Sets or returns the color of the outline around a element=outlineColor
XSET $outlineOffset Offsets an outline, and draws it beyond the border edge=outlineOffset
XSET $outlineStyle Sets or returns the style of the outline around an element=outlineStyle
XSET $outlineWidth Sets or returns the width of the outline around an element=outlineWidth
XSET $overflow Sets or returns what to do with content that renders outside the element box=overflow
XSET $overflowX Specifies what to do with the left/right edges of the content, if it overflows the element"s content area=overflowX
XSET $overflowY Specifies what to do with the top/bottom edges of the content, if it overflows the element"s content area=overflowY
XSET $padding Sets or returns the padding of an element (can have up to four values)=padding
XSET $paddingBottom Sets or returns the bottom padding of an element=paddingBottom
XSET $paddingLeft Sets or returns the left padding of an element=paddingLeft
XSET $paddingRight Sets or returns the right padding of an element=paddingRight
XSET $paddingTop Sets or returns the top padding of an element=paddingTop
XSET $pageBreakAfter Sets or returns the page-break behavior after an element=pageBreakAfter
XSET $pageBreakBefore Sets or returns the page-break behavior before an element=pageBreakBefore
XSET $pageBreakInside Sets or returns the page-break behavior inside an element=pageBreakInside
XSET $perspective Sets or returns the perspective on how 3D elements are viewed=perspective
XSET $perspectiveOrigin Sets or returns the bottom position of 3D elements=perspectiveOrigin
XSET $position Sets or returns the type of positioning method used for an element (static, relative, absolute or fixed)=position
XSET $quotes Sets or returns the type of quotation marks for embedded quotations=quotes
XSET $resize Sets or returns whether or not an element is resizable by the user=resize
XSET $right Sets or returns the right position of a positioned element=right
XSET $tableLayout Sets or returns the way to lay out table cells, rows, and columns=tableLayout
XSET $tabSize Sets or returns the length of the tab-character=tabSize
XSET $textAlign Sets or returns the horizontal alignment of text=textAlign
XSET $textAlignLast Sets or returns how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"=textAlignLast
XSET $textDecoration Sets or returns the decoration of a text=textDecoration
XSET $textDecorationColor Sets or returns the color of the text-decoration=textDecorationColor
XSET $textDecorationLine Sets or returns the type of line in a text-decoration=textDecorationLine
XSET $textDecorationStyle Sets or returns the style of the line in a text decoration=textDecorationStyle
XSET $textIndent Sets or returns the indentation of the first line of text=textIndent
XSET $textJustify Sets or returns the justification method used when text-align is "justify"=textJustify
XSET $textOverflow Sets or returns what should happen when text overflows the containing element=textOverflow
XSET $textShadow Sets or returns the shadow effect of a text=textShadow
XSET $textTransform Sets or returns the capitalization of a text=textTransform
XSET $top Sets or returns the top position of a positioned element=top
XSET $transform Applies a 2D or 3D transformation to an element=transform
XSET $transformOrigin Sets or returns the position of transformed elements=transformOrigin
XSET $transformStyle Sets or returns how nested elements are rendered in 3D space=transformStyle
XSET $transition A shorthand property for setting or returning the four transition properties=transition
XSET $transitionProperty Sets or returns the CSS property that the transition effect is for=transitionProperty
XSET $transitionDuration Sets or returns how many seconds or milliseconds a transition effect takes to complete=transitionDuration
XSET $transitionTimingFunction Sets or returns the speed curve of the transition effect=transitionTimingFunction
XSET $transitionDelay Sets or returns when the transition effect will start=transitionDelay
XSET $unicodeBidi Sets or returns whether the text should be overridden to support multiple languages in the same document=unicodeBidi
XSET $verticalAlign Sets or returns the vertical alignment of the content in an element=verticalAlign
XSET $visibility Sets or returns whether an element should be visible=visibility
XSET $whiteSpace Sets or returns how to handle tabs, line breaks and whitespace in a text=whiteSpace
XSET $width Sets or returns the width of an element=width
XSET $wordBreak Sets or returns line breaking rules for non-CJK scripts=wordBreak
XSET $wordSpacing Sets or returns the spacing between words in a text=wordSpacing
XSET $wordWrap Allows long, unbreakable words to be broken and wrap to the next line=wordWrap
XSET $widows Sets or returns the minimum number of lines for an element that must be visible at the top of a page=widows
XSET $zIndex Sets or returns the stack order of a positioned element=zIndex

XPT HTMLBdoElement alias=_chooseXSET
XSET $dir Sets or returns the value of the dir attribute of a <bdo> element=dir

XPT HTMLBlockquoteElement alias=_chooseXSET
XSET $cite Sets or returns the value of the cite attribute of a quotation=cite 

XPT HTMLBrElement alias=_chooseXSET
XSET $clear Not supported in HTML5\. Use style\.clear instead\.Sets or returns the flow of text around floating objects=clear 

XPT HTMLButtonElement alias=_chooseXSET
XSET $autofocus Sets or returns whether an input button should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of an input button=defaultValue
XSET $disabled Sets or returns whether an input button is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the input button=form
XSET $name Sets or returns the value of the name attribute of an input button=name
XSET $type Returns which type of form element the input button is=type
XSET $value Sets or returns the value of the value attribute of an input button=value 
XSET $checkValidity=checkValidity
XSET $formAction=formAction
XSET $formEnctype=formEnctype
XSET $formMethod=formMethod
XSET $formNoValidate=formNoValidate
XSET $formTarget=formTarget
XSET $setCustomValidity=setCustomValidity
XSET $validationMessage=validationMessage
XSET $validity=validity
XSET $willValidate=willValidate

XPT HTMLCanvasElement alias=_chooseXSET
XSET $fillStyle Sets or returns the color, gradient, or pattern used to fill the drawing=fillStyle
XSET $strokeStyle Sets or returns the color, gradient, or pattern used for strokes=strokeStyle
XSET $shadowColor Sets or returns the color to use for shadows=shadowColor
XSET $shadowBlur Sets or returns the blur level for shadows=shadowBlur
XSET $shadowOffsetX Sets or returns the horizontal distance of the shadow from the shape=shadowOffsetX
XSET $shadowOffsetY Sets or returns the vertical distance of the shadow from the shape=shadowOffsetY
XSET $createLinearGradient() Creates a linear gradient (to use on canvas content)=createLinearGradient\()
XSET $createPattern() Repeats a specified element in the specified direction=createPattern\()
XSET $createRadialGradient() Creates a radial/circular gradient (to use on canvas content)=createRadialGradient\()
XSET $addColorStop() Specifies the colors and stop positions in a gradient object=addColorStop\()
XSET $lineCap Sets or returns the style of the end caps for a line=lineCap
XSET $lineJoin Sets or returns the type of corner created, when two lines meet=lineJoin
XSET $lineWidth Sets or returns the current line width=lineWidth
XSET $miterLimit Sets or returns the maximum miter length=miterLimit
XSET $rect() Creates a rectangle=rect\()
XSET $fillRect() Draws a "filled" rectangle=fillRect\()
XSET $strokeRect() Draws a rectangle (no fill)=strokeRect\()
XSET $clearRect() Clears the specified pixels within a given rectangle=clearRect\()
XSET $fill() Fills the current drawing (path)=fill\()
XSET $stroke() Actually draws the path you have defined=stroke\()
XSET $beginPath() Begins a path, or resets the current path=beginPath\()
XSET $moveTo() Moves the path to the specified point in the canvas, without creating a line=moveTo\()
XSET $closePath() Creates a path from the current point back to the starting point=closePath\()
XSET $lineTo() Adds a new point and creates a line from that point to the last specified point in the canvas=lineTo\()
XSET $clip() Clips a region of any shape and size from the original canvas=clip\()
XSET $quadraticCurveTo() Creates a quadratic Bézier curve=quadraticCurveTo\()
XSET $bezierCurveTo() Creates a cubic Bézier curve=bezierCurveTo\()
XSET $arc() Creates an arc/curve (used to create circles, or parts of circles)=arc\()
XSET $arcTo() Creates an arc/curve between two tangents=arcTo\()
XSET $isPointInPath() Returns true if the specified point is in the current path, otherwise false=isPointInPath\()
XSET $scale() Scales the current drawing bigger or smaller=scale\()
XSET $rotate() Rotates the current drawing=rotate\()
XSET $translate() Remaps the (0,0) position on the canvas=translate\()
XSET $transform() Replaces the current transformation matrix for the drawing=transform\()
XSET $setTransform() Resets the current transform to the identity matrix\. Then runs transform()=setTransform\()
XSET $font Sets or returns the current font properties for text content=font
XSET $textAlign Sets or returns the current alignment for text content=textAlign
XSET $textBaseline Sets or returns the current text baseline used when drawing text=textBaseline
XSET $fillText() Draws "filled" text on the canvas=fillText\()
XSET $strokeText() Draws text on the canvas (no fill)=strokeText\()
XSET $measureText() Returns an object that contains the width of the specified text=measureText\()
XSET $drawImage() Draws an image, canvas, or video onto the canvas=drawImage\()
XSET $width Returns the width of an ImageData object=width
XSET $height Returns the height of an ImageData object=height
XSET $data Returns an object that contains image data of a specified ImageData object=data
XSET $createImageData() Creates a new, blank ImageData object=createImageData\()
XSET $getImageData() Returns an ImageData object that copies the pixel data for the specified rectangle on a canvas=getImageData\()
XSET $putImageData() Puts the image data (from a specified ImageData object) back onto the canvas=putImageData\()
XSET $globalAlpha Sets or returns the current alpha or transparency value of the drawing=globalAlpha
XSET $globalCompositeOperation Sets or returns how a new image are drawn onto an existing image=globalCompositeOperation
XSET $save() Saves the state of the current context=save\()
XSET $restore() Returns previously saved path state and attributes=restore\()
XSET $createEvent()=createEvent\()
XSET $getContext()=getContext\()
XSET $toDataURL()=toDataURL\() 

XPT HTMLCaptionElement alias=_chooseXSET
XSET $align Not supported in HTML5\. Use style\.textAlign or style\.captionSide instead\.Sets or returns the alignment of the caption=align 

XPT HTMLCheckboxElement alias=_chooseXSET
XSET $autofocus Sets or returns whether a checkbox should automatically get focus when the page loads=autofocus
XSET $checked Sets or returns the checked state of a checkbox=checked
XSET $defaultChecked Returns the default value of the checked attribute=defaultChecked
XSET $defaultValue Sets or returns the default value of a checkbox=defaultValue
XSET $disabled Sets or returns whether a checkbox is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the checkbox=form
XSET $indeterminate Sets or returns the indeterminate state of the checkbox=indeterminate
XSET $name Sets or returns the value of the name attribute of a checkbox=name
XSET $required Sets or returns whether the checkbox must be checked before submitting a form=required
XSET $type Returns which type of form element the checkbox is=type
XSET $value Sets or returns the value of the value attribute of a checkbox=value

XPT HTMLDateElement synonym=HTMLDatetimeElement|HTMLDatetimelocalElement alias=_chooseXSET
XSET $autocomplete Sets or returns the value of the autocomplete attribute of a date field=autocomplete
XSET $autofocus Sets or returns whether a date field should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of a date field=defaultValue
XSET $disabled Sets or returns whether a date field is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the date field=form
XSET $list Returns a reference to the datalist that contains the date field=list
XSET $max Sets or returns the value of the max attribute of the date field=max
XSET $min Sets or returns the value of the min attribute of the date field=min
XSET $name Sets or returns the value of the name attribute of a date field=name
XSET $readOnly Sets or returns whether the date field is read-only, or not=readOnly
XSET $required Sets or returns whether the date field must be filled out before submitting a form=required
XSET $step Sets or returns the value of the step attribute of the date field=step
XSET $type Returns which type of form element the date field is=type
XSET $value Sets or returns the value of the value attribute of a date field=value
XSET $stepDown() Decrements the value of the date field by a specified number=stepDown\()
XSET $stepUp() Increments the value of the date field by a specified number=stepUp\()

XPT HTMLEmailElement alias=_chooseXSET
XSET $autocomplete Sets or returns the value of the autocomplete attribute of an email field=autocomplete
XSET $autofocus Sets or returns whether an email field should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of an email field=defaultValue
XSET $disabled Sets or returns whether an email field is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the email field=form
XSET $list Returns a reference to the datalist that contains the email field=list
XSET $maxLength Sets or returns the value of the maxlength attribute of an email field=maxLength
XSET $multiple Sets or returns whether a user is allowed to enter more than one email address in the email field=multiple
XSET $name Sets or returns the value of the name attribute of an email field=name
XSET $pattern Sets or returns the value of the pattern attribute of an email field=pattern
XSET $placeholder Sets or returns the value of the placeholder attribute of an email field=placeholder
XSET $readOnly Sets or returns whether the email field is read-only, or not=readOnly
XSET $required Sets or returns whether the email field must be filled out before submitting a form=required
XSET $size Sets or returns the value of the size attribute of the email field=size
XSET $type Returns which type of form element the email field is=type
XSET $value Sets or returns the value of the value attribute of an email field=value 

XPT HTMLEmbed alias=_chooseXSET
XSET $height Sets or returns the value of the height attribute in an embed element=height
XSET $src Sets or returns the value of the src attribute in an embed element=src
XSET $type Sets or returns the value of the type attribute in an embed element=type
XSET $width Sets or returns the value of the width attribute in an embed element=width 

XPT HTMLFormElement alias=_chooseXSET
XSET $elements Returns a collection of all elements in a form=elements
XSET $acceptCharset Sets or returns the value of the accept-charset attribute in a form=acceptCharset
XSET $action Sets or returns the value of the action attribute in a form=action
XSET $autocomplete Sets or returns the value of the autocomplete attribute in a form=autocomplete
XSET $encoding Alias of enctype=encoding
XSET $enctype Sets or returns the value of the enctype attribute in a form=enctype
XSET $length Returns the number of elements in a form=length
XSET $method Sets or returns the value of the method attribute in a form=method
XSET $name Sets or returns the value of the name attribute in a form=name
XSET $noValidate Sets or returns whether the form-data should be validated or not, on submission=noValidate
XSET $target Sets or returns the value of the target attribute in a form=target
XSET $reset() Resets a form=reset\()
XSET $submit() Submits a form=submit\() 

XPT HTMLFrameElement alias=_chooseXSET
XSET $align Not supported in HTML5\. Use style\.cssFloat instead\. Sets or returns the value of the align attribute in an iframe=align
XSET $contentDocument Returns the document object generated by an iframe=contentDocument
XSET $contentWindow Returns the window object generated by an iframe=contentWindow
XSET $frameBorder Not supported in HTML5\. Use style\.border instead\. Sets or returns the value of the frameborder attribute in an iframe=frameBorder
XSET $height Sets or returns the value of the height attribute in an iframe=height
XSET $longDesc Not supported in HTML5\. Sets or returns the value of the longdesc attribute in an iframe=longDesc
XSET $marginHeight Not supported in HTML5\. Use style\.margin instead\. Sets or returns the value of the marginheight attribute in an iframe=marginHeight
XSET $marginWidth Not supported in HTML5\. Use style\.margin  instead\. Sets or returns the value of the marginwidth attribute in an iframe=marginWidth
XSET $name Sets or returns the value of the name attribute in an iframe=name
XSET $sandbox Returns the value of the sandbox attribute in an iframe=sandbox
XSET $scrolling Not supported in HTML5\. Sets or returns the value of the scrolling attribute in an iframe=scrolling
XSET $seamless Sets or returns whether an iframe should look like it is a part of the containing document (no borders or scrollbars), or not=seamless
XSET $src Sets or returns the value of the src attribute in an iframe=src
XSET $srcdoc Sets or returns the value of the srcdoc attribute in an iframe=srcdoc
XSET $width Sets or returns the value of the width attribute in an iframe=width 

XPT HTMLHiddenElement alias=_chooseXSET
XSET $defaultValue Sets or returns the default value of the hidden input field=defaultValue
XSET $form Returns a reference to the form that contains the hidden input field=form
XSET $name Sets or returns the value of the name attribute of the hidden input field=name
XSET $type Returns which type of form element a hidden input field is=type
XSET $value Sets or returns the value of the value attribute of the hidden input field=value 

XPT HTMLHrElement alias=_chooseXSET
XSET $align Not supported in HTML5\. Use style\.textAlign instead\. Sets or returns the alignment of a horizontal line=align
XSET $color Not supported in HTML5\. Use style\.color instead\. Sets or returns the color of a horizontal line=color
XSET $noshade Not supported in HTML5\. Sets or returns whether a horizontal line should render in one solid color (noshaded)=noshade
XSET $size Not supported in HTML5\. Use style\.height instead\. Sets or returns the height of a horizontal line=size
XSET $width Not supported in HTML5\. Use style\.width instead\. Sets or returns the width of a horizontal line=width 

XPT HTMLImageElement alias=_chooseXSET
XSET $align Not supported in HTML5\. Use style\.cssFloat instead\. Sets or returns the value of the align attribute of an image=align
XSET $alt Sets or returns the value of the alt attribute of an image=alt
XSET $border Not supported in HTML5\. Use style\.border instead\.Sets or returns the value of the border attribute of an image=border
XSET $complete Returns whether or not the browser is finished loading an image=complete
XSET $crossOrigin Sets or returns the CORS settings of an image=crossOrigin
XSET $height Sets or returns the value of the height attribute of an image=height
XSET $hspace Not supported in HTML5\. Use style\.margin instead\. Sets or returns the value of the hspace attribute of an image=hspace
XSET $isMap Sets or returns whether an image should be part of a server-side image-map, or not=isMap
XSET $longDesc Not supported in HTML5\. Sets or returns the value of the longdesc attribute of an image=longDesc
XSET $name Not supported in HTML5\. Use id instead\. Sets or returns the value of the name attribute of an image=name
XSET $naturalHeight Returns the original height of an image=naturalHeight
XSET $naturalWidth Returns the original width of an image=naturalWidth
XSET $src Sets or returns the value of the src attribute of an image=src
XSET $useMap Sets or returns the value of the usemap attribute of an image=useMap
XSET $vspace Not supported in HTML5\. Use style\.margin instead\. Sets or returns the value of the vspace attribute of an image=vspace
XSET $width Sets or returns the value of the width attribute of an image=width 

XPT HTMLInput_image alias=_chooseXSET
XSET $alt Sets or returns the value of the alt attribute of an input image=alt
XSET $autofocus Sets or returns whether an input image should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of an input image=defaultValue
XSET $disabled Sets or returns whether an input image is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the input image=form
XSET $formAction Sets or returns the value of the formaction attribute of an input image=formAction
XSET $formEnctype Sets or returns the value of the formenctype attribute of an input image=formEnctype
XSET $formMethod Sets or returns the value of the formmethod attribute of an input image=formMethod
XSET $formNoValidate Sets or returns whether the form-data should be validated or not, on submission=formNoValidate
XSET $formTarget Sets or returns the value of the formtarget attribute an input image=formTarget
XSET $height Sets or returns the value of the height attribute of the input image=height
XSET $name Sets or returns the value of the name attribute of an input image=name
XSET $src Sets or returns the value of the src attribute of the input image=src
XSET $type Returns which type of form element the input image is=type
XSET $value Sets or returns the value of the value attribute of an input image=value
XSET $width Sets or returns the value of the width attribute of the input image=width 

XPT HTMLInput_time alias=_chooseXSET
XSET $autocomplete Sets or returns the value of the autocomplete attribute of a time field=autocomplete
XSET $autofocus Sets or returns whether a time field should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of a time field=defaultValue
XSET $disabled Sets or returns whether a time field is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the time field=form
XSET $list Returns a reference to the datalist that contains the time field=list
XSET $max Sets or returns the value of the max attribute of the time field=max
XSET $min Sets or returns the value of the min attribute of the time field=min
XSET $name Sets or returns the value of the name attribute of a time field=name
XSET $readOnly Sets or returns whether the time field is read-only, or not=readOnly
XSET $required Sets or returns whether the time field must be filled out before submitting a form=required
XSET $step Sets or returns the value of the step attribute of the time field=step
XSET $type Returns which type of form element the time field is=type
XSET $value Sets or returns the value of the value attribute of a time field=value
XSET $stepDown() Decrements the value of the time field by a specified number=stepDown\()
XSET $stepUp() Increments the value of the time field by a specified number=stepUp\() 

XPT HTMLLabelElement alias=_chooseXSET
XSET $control Returns the labeled control=control
XSET $form Returns a reference to the form that contains the label=form
XSET $htmlFor Sets or returns the value of the for attribute of a label=htmlFor 

XPT HTMLLiElement alias=_chooseXSET
XSET $value Sets or returns the value of the value attribute of a list item=value 

XPT HTMLLinkElement alias=_chooseXSET
XSET $charset Not supported in HTML5\. Sets or returns the character encoding of the linked document=charset
XSET $crossOrigin Sets or returns the the CORS settings of the linked document=crossOrigin
XSET $disabled Sets or returns whether the linked document is disabled, or not=disabled
XSET $href Sets or returns the URL of the linked document=href
XSET $hreflang Sets or returns the language code of the linked document=hreflang
XSET $media Sets or returns the media type for the link element=media
XSET $rel Sets or returns the relationship between the current document and the linked document=rel
XSET $rev Not supported in HTML5\. Sets or returns the reverse relationship from the linked document to the current document=rev
XSET $sizes Returns the value of the sizes attribute of the linked resource=sizes
XSET $type Sets or returns the content type of the linked document=type 

XPT HTMLMetaElement alias=_chooseXSET
XSET $content Sets or returns the value of the content attribute of a meta element=content
XSET $httpEquiv Sets or returns an HTTP header for the information in the content attribute=httpEquiv
XSET $name Sets or returns a name for the information in the content attribute=name
XSET $scheme Not supported in HTML5\. Sets or returns how the value of the content attribute should be interpreted=scheme 

XPT HTMLMonthElement alias=_chooseXSET
XSET $autocomplete Sets or returns the value of the autocomplete attribute of a month field=autocomplete
XSET $autofocus Sets or returns whether a month field should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of a month field=defaultValue
XSET $disabled Sets or returns whether a month field is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the month field=form
XSET $list Returns a reference to the datalist that contains the month field=list
XSET $max Sets or returns the value of the max attribute of the month field=max
XSET $min Sets or returns the value of the min attribute of the month field=min
XSET $name Sets or returns the value of the name attribute of a month field=name
XSET $readOnly Sets or returns whether the month field is read-only, or not=readOnly
XSET $required Sets or returns whether the month field must be filled out before submitting a form=required
XSET $step Sets or returns the value of the step attribute of the month field=step
XSET $type Returns which type of form element the month field is=type
XSET $value Sets or returns the value of the value attribute of a month field=value
XSET $stepDown() Decrements the value of the month field by a specified number=stepDown\()
XSET $stepUp() Increments the value of the month field by a specified number=stepUp\() 

XPT HTMLNumberElement alias=_chooseXSET
XSET $autocomplete Sets or returns the value of the autocomplete attribute of a number field=autocomplete
XSET $autofocus Sets or returns whether a number field should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of a number field=defaultValue
XSET $disabled Sets or returns whether a number field is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the number field=form
XSET $list Returns a reference to the datalist that contains the number field=list
XSET $max Sets or returns the value of the max attribute of a number field=max
XSET $min Sets or returns the value of the min attribute of a number field=min
XSET $name Sets or returns the value of the name attribute of a number field=name
XSET $placeholder Sets or returns the value of the placeholder attribute of a number field=placeholder
XSET $readOnly Sets or returns whether the number field is read-only, or not=readOnly
XSET $required Sets or returns whether the number field must be filled out before submitting a form=required
XSET $step Sets or returns the value of the step attribute of a number field=step
XSET $type Returns which type of form element the number field is=type
XSET $value Sets or returns the value of the value attribute of a number field=value
XSET $stepDown() Decrements the value of the input number by a specified number=stepDown\()
XSET $stepUp() Increments the value of the input number by a specified number=stepUp\() 

XPT HTMLOlElement alias=_chooseXSET
XSET $compact Not supported in HTML5\. Use style\.lineHeight instead\. Sets or returns whether the list should render smaller than normal, or not=compact
XSET $reversed Sets or returns whether the list order should be descending or not=reversed
XSET $start Sets or returns the value of the start attribute of an ordered list=start
XSET $type Sets or returns the value of the type attribute of an ordered list=type 

XPT HTMLOptgroupElement alias=_chooseXSET
XSET $disabled Sets or returns whether an option-group is disabled, or not=disabled
XSET $label Sets or returns the value the label attribute of an option-group=label 

XPT HTMLOptionElement alias=_chooseXSET
XSET $defaultSelected Returns the default value of the selected attribute=defaultSelected
XSET $disabled Sets or returns whether an option is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the option=form
XSET $index Sets or returns the index position of an option in a drop-down list=index
XSET $label Sets or returns the value of the label attribute of an option in a drop-down list=label
XSET $selected Sets or returns the selected state of an option=selected
XSET $text Sets or returns the text of an option=text
XSET $value Sets or returns the value of an option to be sent to the server=value 

XPT HTMLQuoteElement alias=_chooseXSET
XSET $cite Sets or returns the value of the cite attribute of a quotation=cite 

XPT HTMLRadioElement alias=_chooseXSET
XSET $autofocus Sets or returns whether a radio button should automatically get focus when the page loads=autofocus
XSET $checked Sets or returns the checked state of a radio button=checked
XSET $defaultChecked Returns the default value of the checked attribute=defaultChecked
XSET $defaultValue Sets or returns the default value of a radio button=defaultValue
XSET $disabled Sets or returns whether the radio button is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the radio button=form
XSET $name Sets or returns the value of the name attribute of a radio button=name
XSET $required Sets or returns whether the radio button must be checked before submitting a form=required
XSET $type Returns which type of form element the radio button is=type
XSET $value Sets or returns the value of the value attribute of the radio button=value 

XPT HTMLScriptElement alias=_chooseXSET
XSET $async Sets or returns whether a script should be executed asynchronously as soon as it is available=async
XSET $charset Sets or returns the value of the charset attribute of a script=charset
XSET $crossOrigin Sets or returns the the CORS settings of a script=crossOrigin
XSET $defer Sets or returns whether a script should be executed when the page has finished parsing=defer
XSET $src Sets or returns the value of the src attribute of a script=src
XSET $text Sets or returns the contents of all the text nodes that are children of a script=text
XSET $type Sets or returns the value of the type attribute of a script=type 

XPT HTMLSearchElement alias=_chooseXSET
XSET $autocomplete Sets or returns the value of the autocomplete attribute of a search field=autocomplete
XSET $autofocus Sets or returns whether a search field should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of a search field=defaultValue
XSET $disabled Sets or returns whether a search field is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the search field=form
XSET $list Returns a reference to the datalist that contains the search field=list
XSET $maxLength Sets or returns the value of the maxlength attribute of a search field=maxLength
XSET $name Sets or returns the value of the name attribute of a search field=name
XSET $pattern Sets or returns the value of the pattern attribute of a search field=pattern
XSET $placeholder Sets or returns the value of the placeholder attribute of a search field=placeholder
XSET $readOnly Sets or returns whether the search field is read-only, or not=readOnly
XSET $required Sets or returns whether the search field must be filled out before submitting a form=required
XSET $size Sets or returns the value of the size attribute of the search field=size
XSET $type Returns which type of form element the search field is=type
XSET $value Sets or returns the value of the value attribute of a search field=value 

XPT HTMLUlElement alias=_chooseXSET
XSET $compact Not supported in HTML5\. Use style\.lineHeight instead\.Sets or returns whether the unordered list should render smaller than normal, or not=compact
XSET $type Not supported in HTML5\. Use style\.listStyleType instead\.Sets or returns the value of the type attribute of an unordered list=type 

XPT HTMLUrlElement alias=_chooseXSET
XSET $autocomplete Sets or returns the value of the autocomplete attribute of a URL field=autocomplete
XSET $autofocus Sets or returns whether a URL field should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of a URL field=defaultValue
XSET $disabled Sets or returns whether a URL field is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the URL field=form
XSET $list Returns a reference to the datalist that contains the URL field=list
XSET $maxLength Sets or returns the value of the maxlength attribute of a URL field=maxLength
XSET $name Sets or returns the value of the name attribute of a URL field=name
XSET $pattern Sets or returns the value of the pattern attribute of a URL field=pattern
XSET $placeholder Sets or returns the value of the placeholder attribute of a URL field=placeholder
XSET $readOnly Sets or returns whether the URL field is read-only, or not=readOnly
XSET $required Sets or returns whether the URL field must be filled out before submitting a form=required
XSET $size Sets or returns the value of the size attribute of the URL field=size
XSET $type Returns which type of form element the URL field is=type
XSET $value Sets or returns the value of the value attribute of a URL field=value 

XPT HTMLVideoElement alias=_chooseXSET
XSET $audioTracks Returns an AudioTrackList object representing available audio tracks=audioTracks
XSET $autoplay Sets or returns whether a video should start playing as soon as it is ready=autoplay
XSET $buffered Returns a TimeRanges object representing the buffered parts of a video=buffered
XSET $controller Returns the MediaController object representing the current media controller of a video=controller
XSET $controls Sets or returns whether a video should have controls displayed (play/pause etc)=controls
XSET $crossOrigin Sets or returns the CORS settings of a video=crossOrigin
XSET $currentSrc Returns the URL of the current video=currentSrc
XSET $currentTime Sets or returns the current playback position in a video (in seconds)=currentTime
XSET $defaultMuted Sets or returns whether the video should be muted by default=defaultMuted
XSET $defaultPlaybackRate Sets or returns whether the default playback speed of the video=defaultPlaybackRate
XSET $duration Returns the length of a video (in seconds)=duration
XSET $ended Returns whether the playback of the video has ended=ended
XSET $error Returns a MediaError object representing the error state of the video=error
XSET $height Sets or returns the value of the height attribute of a video=height
XSET $loop Sets or returns whether the video should start playing over again, every time it is finished=loop
XSET $mediaGroup Sets or returns the name of the media group the video(s) is a part of=mediaGroup
XSET $muted Sets or returns whether the sound of a video should be turned off=muted
XSET $networkState Returns the current network state of a video=networkState
XSET $paused Sets or returns whether a video is paused=paused
XSET $playbackRate Sets or returns the speed of the video playback=playbackRate
XSET $played Returns a TimeRanges object representing the played parts of the video=played
XSET $poster Sets or returns the value of the poster attribute of a video=poster
XSET $preload Sets or returns the value of the preload attribute of a video=preload
XSET $readyState Returns the current ready state of a video=readyState
XSET $seekable Returns a TimeRanges object representing the seekable parts of a video=seekable
XSET $seeking Returns whether the user is currently seeking in the video=seeking
XSET $src Sets or returns the value of the src attribute of a video=src
XSET $startDate Returns a Date object representing the current time offset=startDate
XSET $textTracks Returns a TextTrackList object representing the available text tracks=textTracks
XSET $videoTracks Returns a VideoTrackList object representing the available video tracks=videoTracks
XSET $volume Sets or returns the audio volume of a video=volume
XSET $width Sets or returns the value of the width attribute of a video=width
XSET $addTextTrack() Adds a new text track to the video=addTextTrack\()
XSET $canPlayType() Checks whether the browser can play the specified video type=canPlayType\()
XSET $load() Re-loads the video element=load\()
XSET $play() Starts playing the video=play\()
XSET $pause() Pauses the currently playing video=pause\() 

XPT HTMLWeekElement alias=_chooseXSET
XSET $autocomplete Sets or returns the value of the autocomplete attribute of a week field=autocomplete
XSET $autofocus Sets or returns whether a week field should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of a week field=defaultValue
XSET $disabled Sets or returns whether a week field is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the week field=form
XSET $list Returns a reference to the datalist that contains the week field=list
XSET $max Sets or returns the value of the max attribute of the week field=max
XSET $min Sets or returns the value of the min attribute of the week field=min
XSET $name Sets or returns the value of the name attribute of a week field=name
XSET $readOnly Sets or returns whether the week field is read-only, or not=readOnly
XSET $required Sets or returns whether the week field must be filled out before submitting a form=required
XSET $step Sets or returns the value of the step attribute of the week field=step
XSET $type Returns which type of form element the week field is=type
XSET $value Sets or returns the value of the value attribute of a week field=value
XSET $stepDown() Decrements the value of the week field by a specified number=stepDown\()
XSET $stepUp() Increments the value of the week field by a specified number=stepUp\()

XPT HTMLTableElement alias=_chooseXSET
XSET $rows Returns a collection of all <tr> elements in a table=rows
XSET $tBodies Returns a collection of all <tbody> elements in a table=tBodies
XSET $align Not supported in HTML5\. Use style\.cssFloat instead\.Sets or returns the alignment of a table according to surrounding text=align
XSET $background Not supported in HTML5\. Use style\.background instead\.Sets or returns the background image of a table=background
XSET $bgColor Not supported in HTML5\. Use style\.backgroundColor instead\.Sets or returns the background color of a table=bgColor
XSET $border Deprecated\. Use style\.border instead\.Sets or returns the width of the table border\.=border
XSET $caption Returns the <caption> element of a table=caption
XSET $cellPadding Not supported in HTML5\. Use style\.padding instead\.Sets or returns the amount of space between the cell     border and cell content=cellPadding
XSET $cellSpacing Not supported in HTML5\. Use style\.borderSpacing instead\.Sets or returns the amount of space between the cells in a     table=cellSpacing
XSET $frame Not supported in HTML5\.Sets or returns which outer-borders (of a table) that should be displayed=frame
XSET $height Not supported in HTML5\. Use style\.height instead\.Sets or returns the height of a table=height
XSET $rules Not supported in HTML5\.Sets or returns which inner-borders (between the cells) that should be displayed in a table=rules
XSET $summary Not supported in HTML5\.Sets or returns a description of the data in a table=summary
XSET $tFoot Returns a reference to the <tfoot> element of a table=tFoot
XSET $tHead Returns a reference to the <thead> element of a table=tHead
XSET $width Not supported in HTML5\. Use style\.width instead\.Sets or returns the width of the table=width
XSET $createCaption() Creates an empty <caption> element and adds it to the table=createCaption\()
XSET $createTFoot() Creates an empty <tfoot> element and adds it to the table=createTFoot\()
XSET $createTHead() Creates an empty <thead> element and adds it to the table=createTHead\()
XSET $deleteCaption() Removes the first <caption> element from the table=deleteCaption\()
XSET $deleteRow() Removes a row (<tr>) from the table=deleteRow\()
XSET $deleteTFoot() Removes the <tfoot> element from the table=deleteTFoot\()
XSET $deleteTHead() Removes the <thead> element from the table=deleteTHead\()
XSET $insertRow() Creates an empty <tr> element and adds it to the table=insertRow\() 

XPT HTMLTabledataElement alias=_chooseXSET
XSET $abbr Not supported in HTML5\.Sets or returns the value of the abbr attribute=abbr
XSET $align Not supported in HTML5\. Use style\.textAlign instead\.Sets or returns the horizontal alignment of the content in a data cell=align
XSET $axis Not supported in HTML5\.Sets or returns a comma-separated list of related data cells=axis
XSET $background Not supported in HTML5\. Use style\.background instead\.Sets or returns the background image of a data cell=background
XSET $bgColor Not supported in HTML5\. Use style\.backgroundColor instead\.Sets or returns the background color of a table=bgColor
XSET $cellIndex Returns the position of a cell in the cells collection of     a table row=cellIndex
XSET $ch Not supported in HTML5\.Sets or returns an alignment character for a data cell=ch
XSET $chOff Not supported in HTML5\.Sets or returns the horizontal offset of the ch property=chOff
XSET $colSpan Sets or returns the value of the colspan attribute=colSpan
XSET $headers Sets or returns the value of the headers attribute=headers
XSET $height Not supported in HTML5\. Use style\.height instead\.Sets or returns the height of a data cell=height
XSET $noWrap Not supported in HTML5\. Use style\.whiteSpace instead\.Sets or returns whether the content in a cell can be wrapped=noWrap
XSET $rowSpan Sets or returns the value of the rowspan attribute=rowSpan
XSET $vAlign Not supported in HTML5\. Use style\.verticalAlign instead\.Sets or returns the vertical alignment of the content within a cell=vAlign
XSET $width Not supported in HTML5\. Use style\.width instead\.Sets or returns the width of a data cell=width 

XPT HTMLTableheadElement alias=_chooseXSET
XSET $abbr Sets or returns the value of the abbr attribute=abbr
XSET $align Not supported in HTML5\. Use style\.textAlign instead\.Sets or returns the horizontal alignment of the content in a data cell=align
XSET $axis Not supported in HTML5\.Sets or returns a comma-separated list of related data cells=axis
XSET $background Not supported in HTML5\. Use style\.background instead\.Sets or returns the background image of a data cell=background
XSET $bgColor Not supported in HTML5\. Use style\.backgroundColor instead\.Sets or returns the background color of a table=bgColor
XSET $cellIndex Returns the position of a cell in the cells collection of     a table row=cellIndex
XSET $ch Not supported in HTML5\.Sets or returns an alignment character for a data cell=ch
XSET $chOff Not supported in HTML5\. Sets or returns the horizontal offset of the ch property=chOff
XSET $colSpan Sets or returns the value of the colspan attribute=colSpan
XSET $headers Sets or returns the value of the headers attribute=headers
XSET $height Not supported in HTML5\. Sets or returns the height of a data cellUse style\.height instead=height
XSET $noWrap Not supported in HTML5\. Sets or returns whether the content in a cell can be wrappedUse style\.whiteSpace instead=noWrap
XSET $rowSpan Sets or returns the value of the rowspan attribute=rowSpan
XSET $vAlign Not supported in HTML5\. Sets or returns the vertical alignment of the content within a cellUse style\.verticalAlign instead=vAlign
XSET $width Not supported in HTML5\. Sets or returns the width of a data cellUse style\.width instead=width 

XPT HTMLTablerowElement alias=_chooseXSET
XSET $cells Returns a collection of all <td> or <th> elements in a table row=cells
XSET $align Not supported in HTML5\. Use style\.textAlign instead\.    Sets or returns the horizontal alignment of the content within a table row=align
XSET $bgColor Not supported in HTML5\. Use style\.backgroundColor instead\.Sets or returns the background color of a table row=bgColor
XSET $ch Not supported in HTML5\. Sets or returns an alignment character for cells in a     table row=ch
XSET $chOff Not supported in HTML5\. Sets or returns the horizontal offset of the ch property=chOff
XSET $height Not supported in HTML5\. Use style\.height instead\.    Sets or returns the height of a table row\. =height
XSET $rowIndex Returns the position of a row in the rows     collection of a table=rowIndex
XSET $sectionRowIndex Returns the position of a row in the rows     collection of a tbody,     thead, or tfoot=sectionRowIndex
XSET $vAlign Not supported in HTML5\. Use style\.verticalAlign instead\.Sets or returns the vertical alignment of the content within a table row=vAlign
XSET $deleteCell() Deletes a cell from the current table row=deleteCell\()
XSET $insertCell() Inserts a cell into the current table row=insertCell\() 

XPT HTMLSelectElement alias=_chooseXSET
XSET $options Returns a collection of all the options in a drop-down list=options
XSET $disabled Sets or returns whether the drop-down list is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the drop-down list=form
XSET $length Returns the number of <option> elements in a drop-down list=length
XSET $multiple Sets or returns whether more than one option can be selected from the drop-down list=multiple
XSET $name Sets or returns the value of the name attribute of a drop-down list=name
XSET $selectedIndex Sets or returns the index of the selected option in a drop-down list=selectedIndex
XSET $size Sets or returns the value of the size of a drop-down list=size
XSET $type Returns which type of form element a drop-down list is=type
XSET $value Sets or returns the value of the selected option in a drop-down list=value
XSET $add() Adds an option to a drop-down list=add\()
XSET $remove() Removes an option from a drop-down list=remove\() 

XPT HTMLPasswordElement alias=_chooseXSET
XSET $autocomplete Sets or returns the value of the autocomplete attribute of a password field=autocomplete
XSET $autofocus Sets or returns whether a password field should automatically get focus when the page loads=autofocus
XSET $defaultValue Sets or returns the default value of a password field=defaultValue
XSET $disabled Sets or returns whether the password field is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the password field=form
XSET $maxLength Sets or returns the value of the maxlength attribute of a password field=maxLength
XSET $name Sets or returns the value of the name attribute of a password field=name
XSET $pattern Sets or returns the value of the pattern attribute of a password field=pattern
XSET $placeholder Sets or returns the value of the placeholder attribute of a password field=placeholder
XSET $readOnly Sets or returns whether a password field is read-only, or not=readOnly
XSET $required Sets or returns whether the password field must be filled out before submitting a form=required
XSET $size Sets or returns the value of the size attribute of a password field=size
XSET $type Returns which type of form element a password field is=type
XSET $value Sets or returns the value of the value attribute of the password field=value
XSET $select() Selects the content of a password field=select\() 

XPT HTMLPreElement alias=_chooseXSET
XSET $width Not supported in HTML5\. Use\style\.width instead\.Sets or returns the value of the width attribute of the preformatted text=width 

XPT HTMLFieldsetElement alias=_chooseXSET
XSET $disabled Sets or returns whether a fieldset is disabled, or not=disabled
XSET $form Returns a reference to the form that contains the fieldset=form
XSET $name Sets or returns the value of the name attribute of a fieldset=name
XSET $type Returns which type of form element the fieldset is=type 
