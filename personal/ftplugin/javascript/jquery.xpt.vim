" finish " not finished
if !g:XPTloadBundle( 'javascript', 'jquery' )
    finish
endif

XPTemplate priority=lang-2

XPT jobj alias=_chooseXSET "JQuery Object
XSET $_preValues_={"events":1, "ajaxOptions":1,"opacity":1}
XSET $_selector_=ACMB\({"\\V\\^\\zs'\\\\$":"'`selector^'",
XSET $_selector_+=})
XSET selector=Trigger("selector")
XSET selector?.ontype=ZS($_selector_)
XSET selectorr.ontype=ZS($_selector_)
XSET selectorOrDom.ontype=ZS($_selector_)
XSET $_trigEvent_=ACMB\({'\V\^\zs{\\$':'{\n    type:"`event^",\n    `data^:`value^,\n    }',     "\\V\\^\\zs'\\\\$":"'`^'",
XSET $_trigEvent_+=})
XSET trigEvent.ontype=ZS($_trigEvent_)
XSET speed=ChooseStr('"slow"','"normal"','"fast"')
XSET $_toggle_callback_=if index\(["true","false"],R\("speed")) != -1 | return "" |else| return "`, `callback?^"|endif
XSET opacity=ChooseStr("'toogle'","")
XSET events=NextC(pickL({'blur Occurs when the element loses focus.':'blur','change Occurs when the element changes.':'change','click Occurs when a mouse click.':'click','dblclick Occurs when a mouse double-click.':'dblclick','error Occurs when there is an error in loading or unloading etc.':'error','Focus Occurs when the element gets focus.':'focus','keydown Occurs when key is pressed.':'keydown','keypress Occurs when key is pressed and released.':'keypress','keyup Occurs when key is released.':'keyup','Load Occurs when document is loaded.':'load','mousedown Occurs when mouse button is pressed.':'mousedown','mouseenter Occurs when mouse enters in an element region.':'mouseenter','mouseleave Occurs when mouse leaves an element region.':'mouseleave','Mousemove Occurs when mouse pointer moves':'mousemove','Mouseout Occurs when mouse pointer moves out of an element':'mouseout','Mouseover Occurs when mouse pointer moves over an element':'mouseover','Mouseup Occurs when mouse button is released.':'mouseup','Resize Occurs when window is resized.':'resize','Scroll Occurs when window is scrolled.':'scroll','Select Occurs when a text is selected.':'select','Submit Occurs when form is submitted.':'submit','Unload Occurs when documents is unloaded':'unload'}, " "))
XSET $add Adds more elements, matched by the given selector, to the set of matched elements -- $("\.top")\.add("\.middle")\.addClass("selected")=add\('`selector^')
XSET $addBack=  addBack\(`a^)
XSET $addClass= addClass\(`className^)
XSET $andSelf() add previous wrapper set to current one -- jQuery('div')\.find('p')\.andSelf()\.css('border','1px solid #993300');=andSelf\()
XSET $after insert content after each of the matched elements=after\(`htmlCode^)
XSET $ajaxComplete=ajaxComplete\(function (e, request, setting) {\n    `^\n})
XSET $ajaxError method attaches a function to be executed whenever an AJAX request fails=ajaxError\(function (e, request, setting) {\n    `^\n})
XSET $ajaxSend method attaches a function to be executed whenever an AJAX request is sent= ajaxSend\(function (e, request, setting) {\n    `^\n})
XSET $ajaxStart method attaches a function to be executed whenever an AJAX request begins and there is none already active=ajaxStart\(function (){\n    `^\n})
XSET $ajaxStop method attaches a function to be executed whenever all AJAX requests have ended=ajaxStop\(function (e, request, setting) {\n    `^\n})
XSET $ajaxSuccess=ajaxSuccess\(function (e, request, setting) {\n    `^\n})
XSET $animate=  Trigger("_jo_animate")
XSET $append=   append\(`htmlCode^)
XSET $appendTo= appendTo\(`selectorr^)
XSET $attr set or get attributes=attr\(`attrName^`, `attrValue?^)
XSET $before inserts content before each of the matched elements=before\(`htmlCode^)
XSET $bind=     bind\('`events^'`, `{}_?^, function (e){\n    `cursor^\n})
XSET $blur bind a function to or trigger a blur event=     blur\(`function?^)
XSET $change bind a function to or trigger a change event=   change\(`function?^)
XSET $children() select all children element= children\(`selectorr?^)
XSET $clearQueue=clearQueue\(`a^)
XSET $click bind a function to or trigger a click event=    click\(`function?^)
XSET $clone() copy this wrapper set -- jQuery('ul')\.clone()\.appendTo('body');=    clone\(`true?^)
XSET $closest Get a set of elements containing the closest parent element that matches the specified selector, the starting element included -- jQuery(e\.target)\.closest('tr');=closest\('`:selector:^')
XSET $contents method finds all the child nodes inside the matched elements (including text nodes), or the content document, if the element is an iframe -- $("iframe")\.contents()\.find("body")=contents\()
XSET $context gets the jquery context for the wrapper, to clone events attached to element pass true as argument -- alert("$(\""+ $(this)\.selector + "\", " + $(this)\.context +")");=context
XSET $contextmenu=contextmenu\(`a^, `c^)
XSET $css() set and get css properties =      Trigger('_css')
XSET $data() get or attach data to dom element -- $('#myId')\.data('myObject', {label: $('#myLabel')[0]});=data\(`name^`, `val?^)
XSET $dblclick= dblclick\(`fun^)
XSET $delay=    delay\(`b^, `c^)
XSET $delegate= delegate\(`a^, `b^, `c^, `d^)
XSET $dequeue=  dequeue\(`a^)
XSET $detach=   detach\(`a^)
XSET $each for loop --\.each(function(i) {urls[i] \= $(this)\.attr('href');});=each\(function (index) {\n    `cursor^\n});
XSET $empty clear content of element=empty\()
XSET $end() go back to previous wrapper set -- alert(jQuery('p')\.filter('\.middle')\.end()\.length);=      end\()
XSET $error() bind a function to or trigger a error event=error\(`function?^)
XSET $eq equals --\.eq(7)\.css("border-bottom", "1px solid #000000");=       eq\(`n^)
XSET $extend() jQuery method extends multiple objects true if recursive=extend\(``true?`, ^`obj1^, `obj2^)
XSET $fadeIn=   fadeIn\(`speed^`, `callback?^)
XSET $fadeOut=  fadeOut\(`speed^`, `callback?^)
XSET $fadeTo fades the opacity of all matched elements to a specified opacity and firing an optional callback after completion=   fadeTo\(`speed^, `opacity^`, `callback?^)
XSET $fadeToggle=fadeToggle\(`a^, `c^, `d^)
XSET $filter() out obj from wrapper set -- \.filter(function(index){ return $(this)\.hasClass('external');})=Trigger('_jo_filter')
XSET $find -- \.find('em')\.length=     find\('`selector^')
XSET $finish=   finish\(`a^)
XSET $first=first\()
XSET $focus bind a function to or trigger a focus event -- dialog\.find('#username')\.focus();=focus\(`function?^)
XSET $focusin=  focusin\(`a^, `c^)
XSET $focusout= focusout\(`a^, `c^)
XSET $grep jQuery method filter an array-- $\.grep(months, function(value, i) {return ( value\.indexOf('J') \=\= 0 );=grep\(`objarrray^, function (index, item){\n    `cursor^\n})
XSET $get() turn a jquery object to dom object -- var lis \= $("ol li")\.get()\.reverse();=get\(`index?^)
XSET $getJSON jQuery object, gets JSON data from server parses it as first parameter to callback, status is the sencond parameter of function=getJSON\(`URL^`, `data?^`, `callback?^)
XSET $has=      has\(`a^)
XSET $hasClass= hasClass\(`className^)
XSET $height get or set height of the element=   height\(`newHeight?^)
XSET $hide=hide\(`speed^`, `callback?^)
XSET $hover=    hover\(function () {\n    `curso^\n}, function () {\n    `cursor^\n})
XSET $html set and get html code contents=html\(`content?^)
XSET $index() get the index of element in wrapper -- $("div")\.index(this));=index\(`jobj^)
XSET $init=     init\(`a^, `b^, `c^)
XSET $innerHeight will return NaN on window and document objects=innerHeight\()
XSET $innerWidth will return NaN on window and document objects=innerWidth\()
XSET $insertAfter Insert all of the matched elements after another, specified, set of elements=insertAfter\(`selector^)
XSET $insertBefore Insert all of the matched elements before another, specified, set of elements=insertBefore\(`selector^)
XSET $is() check if wrapper meets a selectorString=is\('`:selector:^')
XSET $isFunction a jQuery object=isFunction\(`funcname^)
XSET $keydown bind a function to or trigger a keydown event=  keydown\(`function^)
XSET $keypress bind a function to or trigger a keypress event= keypress\(`function^)
XSET $keyup bind a function to or trigger a keyup event=    keyup\(`function^)
XSET $last=     last\()
XSET $length=   length
XSET $load bind a funtion to load event OR loads an external html code -- content \= $('<div/>')\.load('add\.html');=Trigger("_jo_load")
XSET $map run a function on wrapper and returns new array, if function ruturns null,no value will be stored at that position in the new array returned -- var arr \= $\.map($("LI"), function(item, index){while (index < 3){ return $(item)\.html();}return null;});=map\(function (item, index) {\n    `cursor^\n})
XSET $merge() two arrays together, a jQuery object=merge\(`array1^, `array2^)
XSET $mousedown=mousedown\(function (e){\n    `^\n})
XSET $mouseenter=mouseenter\(function (e){\n    `^\n})
XSET $mouseleave=mouseleave\(function (e){\n    `^\n})
XSET $mousemove=mousemove\(function (e){\n    `^\n})
XSET $mouseout= mouseout\(function (e){\n    `^\n})
XSET $mouseover=mouseover\(function (e){\n    `^\n})
XSET $mouseup=  mouseup\(function (e){\n    `^\n})
XSET $next() pick next element, if arg specified, picks all next elements that match=next\(`selector?^)
XSET $nextAll() pick all next elements=nextAll\(`selector?^)
XSET $nextUntil=nextUntil\(`filterSelectorString?^, `d^)
XSET $not() exclude an element from the wrapper pool=not\(`selectorOrDom^)
XSET $off This method does the opposite of on() method, it removes a bound live event=off\('`events^'`, `selector?^,`function^)
XSET $offset returns the position of element relative to document's top and left corners returns {top: n, left:n}=   offset\()
XSET $offsetParent=offsetParent\()
XSET $on binds a handler to an event (like click) for all current − and future − matched element=on\('`events^'`, `selector?^`, `{}_?^, `function^)
XSET $one method binds a handler to one or more events to be executed once for each matched element=one\('`events^'`, `{}_?^, `function^)
XSET $outerHeight, true if to include margin in calculation will return NaN on window and document objects=outerHeight\(`true?^)
XSET $outerWidth, true if to include margin in calculation will return NaN on window and document objects=outerWidth\(`true?^)
XSET $parent() pick parent element=   parent\()
XSET $parents pick all parent ancestors=  parents\()
XSET $parentsUntil=parentsUntil\(`e^, `f^)
XSET $position return the position of element relative to the top-left corner of the first positioned parent of the element(the offsetParent) return {top: n, left: n}= position\()
XSET $prepend=  prepend\(`htmlCode^)
XSET $prependTo=prependTo\(`selector^)
XSET $prev() pick previous element if arg specified pick all prev that matches=     prev\(`selector?^)
XSET $prevAll pick all previous elements=prevAll\(`selector?^)
XSET $prevUntil=prevUntil\(`filterSelectorString?^, `f^)
XSET $promise=  promise\(`e^, `f^)
XSET $prop=     prop\(`e^, `f^)
XSET $push=     push\()
XSET $pushStack=pushStack\(`a^)
XSET $queue=    queue\(`e^, `f^)
XSET $ready=    ready\(`a^)
XSET $remove() remove [matched] dom elements=   remove\(`selector?^)
XSET $removeAttr=removeAttr\(`attrName^)
XSET $removeClass=removeClass\(`className^)
XSET $removeData=removeData\(`a^)
XSET $removeProp=removeProp\(`a^)
XSET $replaceAll Replaces the elements matched by the specified selector with the matched elements=replaceAll\(`selector^)
XSET $replaceWith=replaceWith\(`htmlCode^)
XSET $resize calls a function everytime an element is resized -- $(window)\.resize(checkWidth);=resize\(function () {\n    `^\n})
XSET $scroll=   scroll\(function (e){\n    `^\n})
XSET $scrollLeft set or get number of pixels scrolled from left screen -- $(document)\.scrollLeft()=scrollLeft\(`width?^)
XSET $scrollTop set or get number of pixels scrolled from top screen -- $(document)\.scrollTop()=scrollTop\(`height?^)
XSET $select bind a function to or trigger a select event=select\(`function?^)
XSET $selector returns the seletor of an object -- $("div")\.find("a")\.selector; RETURNS "div a"=selector
XSET $serialize method serializes a set of input elements into a string of data -- $("#testform")\.serialize()=serialize\()
XSET $serializeArray method serializes all forms and form elements like the \.serialize() method but returns a JSON data structure for you to work with=serializeArray\()
XSET $show=show\(`speed^`, `callback?^)
XSET $siblings get set of elements matching [unique] siblings= siblings\(`selector?^)
XSET $slice picks a range of objects from wrapper -- $("p")\.slice(1,3)=    slice\(`startIndex^`, `stopIndex?^)
XSET $slideDown=slideDown\(`speed^`, `callback?^)
XSET $slideToggle=slideToggle\(`speed^`, `callback?^)
XSET $slideUp=  slideUp\(`speed^`, `callback?^)
XSET $sort=     sort\()
XSET $splice=   splice\()
XSET $stop stops the current animation, pass true as first parameter to clear all queued animation, true as second parameter to go to end of current animation-- jQuery(this)\.stop()\.animate({opacity:0\.8}, 1000);=stop\(`true^`, `true^)
XSET $submit bind a function to or trigger a submit event=   submit\(`function?^)
XSET $text set and get text=text\(`string?^)
XSET $toArray=  toArray\()
XSET $toggle element from visible to hidden=toggle\(`speed^`callback^XS\(\$_toggle_callback_)^)
XSET $toggleClass=toggleClass\(`className^, `b^)
XSET $trigger -- jQuery('div\.panels')\.trigger('click!'); -- jQuery('form')\.trigger('submit', ['John','Doe', 28, {gender:'M'}]);= trigger\(`trigEvent^`, `extraValue?^)
XSET $triggerHandler method triggers all bound event handlers on the first element within the jQuery collection (for a specific event type) WITHOUT executing the browser's default actions, bubbling, or live events=triggerHandler\('`events^'`, `{}_?^)
XSET $unbind you may specify a function that will unbind from the event on each of the set of matched elements=   unbind\('`events^'`, `function?^)
XSET $undelegate=undelegate\(`a^, `b^, `c^)
XSET $unload=unload\(function (e){\n    `^\n})
XSET $unwrap=   unwrap\(`a^)
XSET $val=      val\(`a^)
XSET $width get and set the width of the element=width\(`newWidth^)
XSET $wrap() wraps each element in the wrapper with an html code -- $("p")\.slice(1,3)\.wrap("<i></i>");=     wrap\(`htmlCode^)
XSET $wrapAll wraps all matched set in html code=  wrapAll\(`a^)
XSET $wrapInner wraps the inner child contents of each matched element (including text nodes) with a DOM element=wrapInner\(`a^)
XSET ajaxOptions=NextC(pickL({'async A Boolean indicating whether to perform the request asynchronously. The default value is true.':'async : true','beforeSend A callback function that is executed before the request is sent.':'beforeSend : function (){`^}','complete A callback function that executes whenever the request finishes':'complete  : function (){`^}','contentType A string containing a MIME content type to set for the request. The default value is application/x-www-form-urlencoded':'contentType = "application/x-www-form-urlencoded"','data A map or string that is sent to the server with the request.':'data = {}','dataFilter A function to be used to handle the raw responsed data of XMLHttpRequest. This is a pre-filtering function to sanitize the response.':'dataFilter : function () {}','dataType A string defining the type of data expected back from the server (xml, html, json, or script)':'dataType : ""','error A callback function that is executed if the request fails.':'error : function (){}','Global A Boolean indicating whether global AJAX event handlers will be triggered by this request. The default value is true':'global = true','ifModified A Boolean indicating whether the server should check if the page is modified before responding to the request':'ifModified : ','Jsonp Override the callback function name in a jsonp request':'Jsonp : ','Password A password to be used in response to an HTTP access authentication request':'password : ""','processData A Boolean indicating whether to convert the submitted data from an object form into a query-string form. The default value is true':'processData : true','success A callback function that is executed if the request succeeds':'success : function (data){\n    `code^\n}','Timeout Number of milliseconds after which the request will time out in failure':'Timeout : ','timeout Set a local timeout (in milliseconds) for the request':'timeout : ','type A string defining the HTTP method to use for the request (GET or POST). The default value is GET.':'type : "GET"','url A string containing the URL to which the request is sent':'url : "`^"','username A username to be used in response to an HTTP access authentication request':'username : ""','xhr Callback for creating the XMLHttpRequest object. Defaults to the ActiveXObject when available (IE), the XMLHttpRequest otherwise':'xhr : function (){}'}, ",\n    "))
XSET $ajax jQuery Object method loads a remote page using an HTTP request\. $\.ajax() returns the XMLHttpRequest that it creates\. In most cases you won't need that object to manipulate directly, but it is available if you need to abort the request manually\. [options] A set of key/value pairs that configure the Ajax request\. All options are optional=ajax\({`ajaxOptions^})
XSET $ajaxSetup jQuery Object method sets global settings for future AJAX requests=ajaxSetup\({`ajaxOptions^})
XSET $get jQuery Object method loads data from the server using a GET HTTP request\. The method returns XMLHttpRequest object [type] optional parameter represents type of data to be returned to callback function: "xml", "html", "script", "json", "jsonp", or "text"=get\(`url^`, `data?^`, `callback?^`, `type?^)
XSET $getScript jQuery Object method loads and executes a JavaScript file using an HTTP GET request\. The method returns XMLHttpRequest object [callback] optional parameter represents a function to be executed whenever the data is loaded successfully=getScript\(`url^`, `callback?^)
XSET $post jQuery Object method loads data from the server using a POST HTTP request\. The method returns XMLHttpRequest object [type] optional parameter represents type of data to be returned to callback function: "xml", "html", "script", "json", "jsonp", or "text"=post\(`url^`, `data?^`, `callback?^`, `type?^)

XPT _jo_load setting=_chooseXSET hidden
XSET $bind a function to the load event of each matched element=function (e){\n    `^\n}
XSET $load an external data from the server using AJAX,  [URL] : the url of the server-side resource to which the request is sent\. [data] This optional parameter represents an object whose properties are serialized into properly encoded parameters to be passed to the request\. [callback] A callback function invoked after the response data has been loaded into the elements of the matched set\. \|\|\|\|\|\| [URL] It could be a CGI, ASP, JSP, or PHP script which generates data dynamically or out of a database data\. [data] If specified, the request is made using the POST method\. If omitted, the GET method is used\. [callback] The first parameter passed to this function is the response text received from the server and second parameter is the status code=`URL^
load(`Snippet("_chooseXSET")^)

XPT _css_attr_choose
XSET attr.pre=attr
XSET attr.def=getVariables("CSSStyleDeclaration")
XSET attr.post=getVariablesPost("$".V(), "CSSStyleDeclaration")

XPT _css setting=_chooseXSET|_css_attr_choose hidden
XSET $get css attribute value css(a)="`attr^"
XSET $set single attribute css(a, v)="`attr^", `val^
XSET $set multiple values css({v : a, \.\.})={"`attr^" : `val^`, `MORE...{{^, "`attr^" : `val^`, `MORE...^`}}^}
css(`Snippet("_chooseXSET")^)

XPT _jo_filter setting=_chooseXSET hidden
XSET $selector string ""='`:selector:^'
XSET $function() must return true to keep else false=function (index) {\n    `cursor^\n    return false;\n}
filter(`Snippet("_chooseXSET")^)

XPT _jo_animate setting=_css_attr_choose hidden
XSET $_import_={"jobj":{"allValues":"speed","allValues|val":"opacity"}}
animate({"`attr^" : `val^`, `MORE...{{^,
"`attr^" : `val^`, `MORE...^`}}^}`, `speed^`, `easing?^`, `callback?^)

XPT jevent alias=_chooseXSET
XSET $pageX=pageX
XSET $pageY=pageY
XSET $offsetX=offsetX
XSET $offsetY=offsetY
XSET $screenX=screenX
XSET $screenY=screenY
XSET $clientY=clientY
XSET $clientX=clientX
XSET $currentTarget=currentTarget
XSET $data The value, if any, passed as the second parameter to the bind() command when the handler was established=data.
XSET $delegateTarget=delegateTarget
XSET $handleObject=handleObject
XSET $isDefaultPrevented=isDefaultPrevented\()
XSET $originalEvent=originalEvent
XSET $relatedTarget For some mouse events, identifies the element that the cursor left or entered when the event was triggered=relatedTarget
XSET $target Identifies the element for which the event was triggered=target.
XSET $timeStamp \= 1545699288440=timeStamp
XSET $type \= "click"=type
XSET $altKey Set to true if the Alt key was pressed when the event was triggered, false if not=altKey
XSET $bubbles=bubbles
XSET $button=button
XSET $buttons=buttons
XSET $cancelable=cancelable
XSET $changedTouches=changedTouches
XSET $char=char
XSET $charCode=charCode
XSET $ctrlKey Set to true if the Ctrl key was pressed when the event was triggered, false if not=ctrlKey
XSET $detail=detail
XSET $eventPhase=eventPhase
XSET $isImmediatePropagationStopped=isImmediatePropagationStopped\()
XSET $isPropagationStopped=isPropagationStopped\()
XSET $isSimulated=isSimulated
XSET $key=key
XSET $keyCode the key pressed -- if (event\.keyCode \=\=  27) {close();}=keyCode
XSET $metaKey Set to true if the Meta key was pressed when the event was triggered, false if not\. The Meta key is the Ctrl key on PCs and the Command key on Macs=metaKe
XSET $pointerId=pointerId
XSET $pointerType=pointerType
XSET $preventDefault=preventDefault\()
XSET $shiftKey Set to true if the Shift key was pressed when the event was triggered, false if not=shiftKey
XSET $stopImmediatePropagation Stops the rest of the handlers from being executed\. This method also stops the bubbling by calling event\.stopPropagation()=stopImmediatePropagation\()
XSET $stopPropagation Stops the bubbling of an event to parent elements, preventing any parent handlers from being notified of the event=stopPropagation\()
XSET $targetTouches=targetTouches
XSET $toElement=toElement
XSET $touches=touches
XSET $view=view
XSET $which For keyboard events, specifies the numeric code for the key that caused the event, and for mouse events, specifies which button was pressed (1 for left, 2 for middle, 3 for right)=which

XPT sel_filter alias=_chooseXSET
XSET $:first=first
XSET $:last=last
XSET $:even=even
XSET $:odd=odd
XSET $:eq(n)=eq\(`n^)
XSET $:lt(n)=lt\(`n^)
XSET $:gt(n)=gt\(`n^)
XSET $:animated gets animating elements=animated
XSET $:not()=not\(`query^)
XSET $:contains() select elements that contains a text of html code=contains\("`Text^")
XSET $:has() select elements that contains a particular nexted elements=has\(`query^)
XSET $:hidden=hidden
XSET $:visible=visible
XSET $:empty element with no children=empty
XSET $:text=text
XSET $:checked=checked
XSET $:checkbox=checkbox

XPT selector dyn
XSET $_preValues_={"selector":" ","tagAttr?":" "}
XSET $_attr_=ACMB\({'\V\^\zsh\\$':'href',     '\V\^\zsi\\$':'id',
XSET $_attr_+=      '\V\^\w\+\zs!\\$':'!="',    '\V\^\w\+\zs=\\$':'="',
XSET $_attr_+=      '\V\^\w\+\zs^\\$':'^="',    '\V\^\w\+\zs$\\$':'$="',
XSET $_attr_+=      '\V\^\w\+\zs~\\$':'~="',
XSET $_attr_+=})
XSET attr.ontype=ZS($_attr_)
XSET $_tag_=ACMB\({'\V\^\w\+\zs \\$': '` `tagAttr?^'})
XSET tag.ontype=ZS($_tag_)
XSET $_tagAttr_=ACMB\({'\V\^\zsi\\$':'id="`text^"` `tagAttr?^',        '\V\^\zsc\\$':'class="`text^"` `tagAttr?^',
XSET $_tagAttr_+=       '\V\^\zsn\\$':'name="`text^"` `tagAttr?^',        '\V\^\zsv\\$':'value="`text^"` `tagAttr?^',
XSET $_tagAttr_+=})
XSET tagAttr?.ontype=ZS($_tagAttr_)
XSET $_selector_=ACMB\({'\V\.\*\zs:f\\$':":first",     '\V\.\*\zs:la\\$':":last",
XSET $_selector_+=     '\V\.\*\zs:ev\\$':":even",        '\V\.\*\zs:o\\$':":odd",
XSET $_selector_+=     '\V\.\*\zs:eq\\$':":eq(`n^)`selector^",  '\V\.\*\zs:lt\\$':":lt(`n^)`selector^",
XSET $_selector_+=     '\V\.\*\zs:g\\$':":gt(`n^)`selector^",  '\V\.\*\zs:a\\$':":animated",
XSET $_selector_+=     '\V\.\*\zs:n\\$':":not(`selector^)`selector?^", '\V\.\*\zs:checkb\\$':":checkbox",'\V\.\*\zs:checke\\$':":checked", '\V\.\*\zs:co\\$':":contains(`string^)`selector^",
XSET $_selector_+=     '\V\.\*\zs:ha\\$':":has(`selector^)`selector?^",  '\V\.\*\zs:hi\\$':":hidden",
XSET $_selector_+=     '\V\.\*\zs:v\\$':":visible",   '\V\.\*\zs:em\\$':":empty",  '\V\.\*\zs:t\\$':":text",  '\V\.\*\zs:s\\$':":selected",
XSET $_selector_+=     '\V\.\*\zs[\\$':"[`attr^]`selector^",       '\V\.\*\zs>\\$':"> ",
XSET $_selector_+=     '\V\.\*\zs+\\$':"+ ",       '\V\.\*\zs~\\$':"~ ",
XSET $_selector_+=     '\V\.\*\zs,\\$':", ",       '\V\.\*\zs<\\$':"<`tag^></`tag^VMS('\\^\\w\\+')^>",
XSET $_selector_+=})
XSET selector.ontype=ZS($_selector_)
XSET selector?.ontype=ZS($_selector_)
`selector^

XPT $ dyn
XSET obj.ontype=ACMB({"\\V\\^\\zs'\\$":"'`selector^'"})
XSET selector=Trigger("selector")
XSET method\.\..post=.RIE("method..", Trigger("jobj"))
$(`obj^)`.`method..^

XPT createCustomSelector
jQuery.extend(jQuery.expr[':'], {
    `name^ : function(`elem^`, `index?^) {
        `cursor^
        return false
    },
});

XPT createCustomPlugin
jQuery.fn.`funcName^ = funcName(`arg^) {
    `cursor^
};