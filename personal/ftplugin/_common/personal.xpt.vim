XPTemplate priority=personal
let s:f = g:XPTfuncs()
fun! s:rever( arg )
	if a:arg == []
		return a:arg
	endif
	let ret = a:arg[1:]
	call extend(ret, [a:arg[0]])
	return ret
endfunction
fun! s:chek( arg, desc)
	let desc = a:desc
	let ret = []
	let arg = a:arg
	for [pic,kk] in arg
		let desc .= "->" . kk
		if type(pic) == type({})
			let key = keys(pic)
			let valu = values(pic)
			let ids = tlib#input#List('mi', desc, key)
			if ids == []
				return ret
			endif
			let hold = []
			for id in s:rever(ids)
				call add(hold, [valu[id-1], key[id-1]])
			endfor
			call extend(ret, s:chek(hold,desc))
		elseif type(pic) == type([])
			call extend(ret, s:rever(tlib#input#List("m", desc, pic)))
		else
			call extend(ret, [pic])
		endif
		let desc = a:desc
	endfor
	return ret
endfunction
fun! s:final(arg)
	if type(a:arg) == type('') && a:arg == ""
		return {"nav" : "cancel"}
	else
	return a:arg
endfunction
fun! s:f.pickL(lst, ... )
	if self.Phase() == "rendering"
		return self.ItemInitValue()
	endif
	let mode = 's'
	let desc = ""
	let sep =  ' '
	if type(a:lst) == type('')
		if a:0 >= 1
			if type(a:1) == type('')
				if a:0 >= 2
					if type(a:2) == type('')
						let lst = [a:lst] + a:000
					else
						let mode = a:lst
						let desc = a:1
						if mode == 'm' &&  a:0 == 3
							let sep = a:3
						endif
						let lst = a:2
					endif
				else
					let lst = [a:lst] + a:000
				endif
			else
				let mode = a:lst
				if mode == 'm' &&  a:0 == 2
					let sep = a:2
				endif
				let lst = a:1
			endif
		else
			return s:final(a:lst)
		endif
	else
		if a:0 == 1
			if type(a:1) == type([])
				let desc = a:1[0]
			else
				let mode = 'm'
				let sep = a:1
			endif
		elseif a:0 == 2
			let mode = 'm'
			let sep = a:1
			let desc = a:2
		endif
		let lst =  a:lst
	endif
	if type(lst) == type([])
		if mode == "s"
			return s:final(tlib#input#List('s', desc, lst))
		elseif mode == "m"
			return s:final(join(tlib#input#List('m', 'MUL: ' . desc, lst), sep))
		endif

	else
		let key = keys(lst)
		let valu = values(lst)
		if mode == "s"
			let id = tlib#input#List('si', desc, key)
			if type(id) == type(0)
				if id == 0
					return self.Cancel()
				endif
				let v = valu[id-1]
			else
				let v = lst[id]
			endif
			while type(v) == type({})
			    if (has_key(v, "action") && (has_key(v,"text") || has_key(v,"tmplName") || v.action == "finishTemplate" || v.action == "pum" || has_key(v, "nav"))) || (has_key(v,'nav') && (len(v) == 1 || has_key(v, "text")))
				    return v
			    endif
			    let desc .= "->" . key[id-1]
			    let key = keys(v)
			    let valu = values(v)
			    let id = tlib#input#List('si', desc, key)
			    if type(id) == type(0)
				    if id == 0
					return self.Cancel()
				    endif
				    let v = valu[id-1]
			    else
				    let v = v[id]
			    endif
			endwhile
			if type(v) == type([])
			        let desc .= "->" . key[id-1]
				return s:final(tlib#input#List('s',desc,v))
			else
				return s:final(v)
			endif
		elseif mode == "m"
			let ids = tlib#input#List('mi', 'MUL: ' . desc, key)
			if ids == []
				return self.Cancel()
			endif
			let hold = []
			for id in s:rever(ids)
				call add(hold, [valu[id-1], key[id-1]])
			endfor
			return s:final(join(s:chek(hold, desc), sep))
		endif
	endif
endfunction
fun! s:f.pickLL( modes, lst, ...)
	let lst = a:lst
	let desc = ""
	if type(a:modes) == type([])
		let mode = a:modes[0]
		let desc = a:modes[1]
	else
		let mode = a:modes
	endif
	if type(lst) == type("")
		let lst = [lst] + a:000
	endif
	if type(lst) == type([])
		if mode == "s"
			let	ret = tlib#input#List('s', desc, lst)
			return [ret]
		elseif mode == "m"
			return tlib#input#List('m', 'MUL: ' . desc, lst)
		endif
	elseif
		let key = keys(a:lst)
		let valu = values(a:lst)
		if mode == "s"
			let	id = tlib#input#List('si', desc, key)
			return [valu[id-1]]
		elseif mode == "m"
			let ids = tlib#input#List('mi', 'MUL: ' . desc, key)
			let hold = []
			for id in s:rever(ids)
				call add(hold, valu[id-1])
			endfor
			return hold
		endif
	endif
endfunction
fun! s:f.AC( list, ... )
    if type( a:list ) == type( [] )
        let list = a:list
    elseif type(a:list) == type({})
		let list = keys(a:list)
    else
        let list = [ a:list ] + a:000
    endif
    let v = self.V0()
    let conti = []
    for word in list
        if word =~ '\V\^' . v
	    	call add(conti, word)
        endif
    endfor
    if len(conti) == 1
		let par = {}
		if type(a:list) == type({})
			let par.xset = self.Echo(a:list[conti[0]])
			let par.ph = self.Echo(a:list[conti[0]][len(v):])
		else
			let par.xset =  self.Echo(conti[0])
			let par.ph = self.Echo(conti[0][len(v):])
		endif
		return self.CheckAndResolve(par)
	else
		return self.CheckAndResolve( { 'xset':0, 'ph':"" } )
    endif
endfunction
fun! s:f.ACB( list, ... )
    if type( a:list ) == type("")
        let list = [ a:list ] + a:000
    else
        let list = a:list
    endif
    let result = self.AC(list)
	if type(result) == type({})
		let result.action = "build"
		let result.nav    = "stay"
	endif
	return result
endfunction
fun! s:f.CC()
    return b:xptemplateData.renderContext
endfunction
fun! s:f.PlacePos()
	let clb = b:_xpmark.changeLikelyBetween.start
	let sss = split(clb, '`', 1)
	let sss2 = sss[-2]
	if sss2 == 'tmpl'
		return 0
	endif
	if len(sss) == 3
		let sss[1] = 'k'
	else
		let sss[2] = 'k'
	endif
	if index(b:_xpmark.orderedMarks, join(sss, '`')) >= 0
		if sss2 == 'k'
			return 1
		else
			return matchstr(sss2, '\V\^\d\+\$') + 2
		endif

	else
		return matchstr(sss2, '\V\^\d\+\$') + 1
	endif
endfunction
fun! s:f.StillHasPH()
	if self.CC().item.placeHolders == []
		return 0
	else
		return 1
	endif
endfunction
fun! s:f.CheckAndResolve( param )
    if self.Phase(  ) == 'post'
	    return 0
    elseif self.Phase() ==  'rendering'
	    return ""
    endif
    let poi = self.PlacePos()
    "echom poi . string(a:param) . self.Phase()
    if poi == 1
		" `a^ with |ontype
		return a:param.xset
    else
		" `a^`a^b()^
		return a:param.ph
    endif
endfunction
fun! s:f.ACM( list )
    let list = keys(a:list)
    let v = self.V0()
	echom "******" . v
    let conti = []
    for word in list
		let idx = matchstrpos(v, word)
		if idx[0] != ""
	    	call add(conti, [word, idx[1], idx[2], idx[0]])
        endif
    endfor
    if len(conti) == 1
		if type(a:list[conti[0][0]]) == type({})
			return a:list[conti[0][0]]
		endif
	    let par = {}
		"let nonEscaped = '\%(' .     '\%(\[^\\]\|\^\)' .     '\%(\\\\\)\*' . '\)' . '\@<='
		"echom string(conti)
		let texta = (a:list[conti[0][0]] =~ "`") ? (a:list[conti[0][0]]) : a:list[conti[0][0]][len(conti[0][3]):]
	    let par.ph =  {'action':'text','text':texta}
		" texta = v[:conti[0][2]-1] . a:list[conti[0][0]] . v[conti[0][2]:]
	    let texta = ((conti[0][1] == 0) ? "" : v[:conti[0][1]-1]) . a:list[conti[0][0]] . v[conti[0][2]:]
	    let par.xset =  {'action':'text','text':texta}
	    return self.CheckAndResolve( par )
    else
	    return self.CheckAndResolve( { 'xset':0, 'ph':"" } )
    endif
endfunction
fun! s:f.ACMB( list )
	let result = self.ACM(a:list)
	if type(result) == type({})
		let result.action = 'build'
		if has_key(result, "text")
			let result.nav = (result.text =~ '`') ? "next" : "stay"
		endif
	endif
	return result
endfunction
fun! s:f.IsChanged()
	let initFull = self.ItemInitValueWithEdge()
	let v = self.ItemValue()
	return initFull !=# v
endfunction
fun! s:f.MergeSSetting( arg, ... )
	let xptObj = b:xptemplateData
	let xt = xptObj.filetypes[g:GetSnipFileFT()].allTemplates
	let rSetting = xptObj.renderContext.snipObject.setting
	let supers = [a:arg]
	if a:0 >= 1
		let supers += a:000
	endif
	let setting = {}
	call xpt#util#DeepExtend(setting,rSetting)
	for super in supers
		let toSnip = get(xt,super)
		if toSnip is 0
			continue
		endif
		let setting2 = deepcopy(toSnip.setting)
		call xpt#util#DeepExtend(setting,setting2)
	endfor
	let xptObj.renderContext.snipObject.setting = setting
	let xptObj.renderContext.snipSetting = setting
endfunction
fun! s:f.ZS(arg, ...)
	let rctx = b:xptemplateData.renderContext
	"echom "----->" . string(a:arg)
	let useri = has_key(rctx.leadingPlaceHolder, "mark") ? xpt#util#TextBetween(XPMposStartEnd(rctx.leadingPlaceHolder.mark)) : ""
	let ret = xpt#eval#Eval(a:arg, [rctx.ftScope.funcs, rctx.snipSetting.variables, {"$UserInput":useri}])
	if type(ret) != type('')
		return ret
	endif
	if ret =~ '\V\^->import<-{\.\+}\$'
		let rctx = b:xptemplateData.renderContext

		call g:MyMergeSSetting(rctx.snipObject.setting, json_decode(ret[10:]))
		let rctx.snipSetting = rctx.snipObject.setting
		let ret = a:0 == 1 ? a:1 :  rctx.item.initValue
	elseif ret =~ '\V\^->change<-{\.\+}\$'
		let rctx = b:xptemplateData.renderContext
		call xpt#util#DeepExtend(rctx.snipObject.setting, json_decode(ret[10:]))
		let rctx.snipSetting = rctx.snipObject.setting
		let ret = a:0 == 1 ? a:1 :  rctx.item.initValue
	else
		if a:0 == 1
			let ret = a:1
		endif
	endif
	return ret
endfunction
fun! s:f.XS(arg, ...)
	let rctx = b:xptemplateData.renderContext
	"echom "----->" . string(a:arg)
	let useri = has_key(rctx.leadingPlaceHolder, "mark") ? xpt#util#TextBetween(XPMposStartEnd(rctx.leadingPlaceHolder.mark)) : ""
	if !has_key(rctx.ftScope, "funcs")
		"return ""
	endif
	let ret = xpt#eval#Exec(a:arg, [rctx.ftScope.funcs, rctx.snipSetting.variables, {"$UserInput": useri}])
	if type(ret) != type('')
		return ret
	endif
	if ret =~ '\V\^->import<-{\.\+}\$'
		let rctx = b:xptemplateData.renderContext
		call g:MyMergeSSetting(rctx.snipObject.setting, json_decode(ret[10:]))
		let rctx.snipSetting = copy(rctx.snipObject.setting)
		let ret = a:0 == 1 ? a:1 :  rctx.item.initValue
	elseif ret =~ '\V\^->change<-{\.\+}\$'
		let rctx = b:xptemplateData.renderContext
		call xpt#util#DeepExtend(rctx.snipObject.setting, json_decode(ret[10:]))
		let rctx.snipSetting = copy(rctx.snipObject.setting)
		let ret = a:0 == 1 ? a:1 :  rctx.item.initValue
	else
		if a:0 == 1
			let ret = a:1
		endif
	endif
	return ret
endfunction
fun! s:f.Z(arg, ...)
	if a:0 >= 1
		return self.NextC(self.ZS(a:arg), a:1)
	else
		return self.NextC(self.ZS(a:arg))
	endif
endfunction
fun! s:f.X(arg, ...)
	if a:0 >= 1
		return self.NextC(self.XS(a:arg, a:1))
	else
		return self.NextC(self.XS(a:arg))
	endif
endfunction
fun! s:f.T(arg)
	return string(a:arg)
endfunction
fun! s:f.ExpandInsideEdge2( newLeftEdge, newRightEdge )
    let v = self.V()
    let fullname = self.ItemFullname()

    let [ el, er ] = self.ItemEdges()

    if v ==# fullname || v == ''
        return ''
    endif
    return substitute( v, '\V' . er . '\$' , '' , '' )
                \. self.ItemCreate( self.ItemName(), { 'left' : a:newLeftEdge, 'right' : a:newRightEdge }, {'post':'ExpandInsideEdge2("'.a:newLeftEdge.'","'.a:newRightEdge.'")'} )
                \. er
endfunction
fun! s:f.execut( arg )
	return execute(a:arg)[1:]
endfunction
fun! s:f.Pre( arg )
	return a:arg
endfunction
fun! s:f.sCat( ... )
	if index(a:000, self.Cancel()) != -1
		return self.Cancel()
	endif
	return join(a:000, "")
endfunction
fun! s:f.Cancel()
	return {"nav" : "cancel"}
endfunction
fun! s:f.NextC( ... )
  if a:0 == 0
    return { 'nav' : 'next', 'fromNext':1 }
  else
	  if type(a:1) == type({})
		  if a:1 == self.Cancel()
			  return a:1
		  endif
		  return extend(a:1,{'nav':'next', 'fromNext':1})
	  else
    		  return { 'nav' : 'next', 'fromNext':1, 'text' : join( a:000, '' ) }
	  endif
  endif
endfunction
fun! s:f.snipGS( query, ...)
	if a:0 == 1|echom string(a:1)|endif
	let xptObj = b:xptemplateData
	let xt = xptObj.filetypes[g:GetSnipFileFT()].allTemplates
	let [super, sett] = items(a:query)[0]
	if super == ""
		if a:0 == 1 | let snipObject = deepcopy(xptObj.renderContext.snipObject)
		else | let snipObject = xptObj.renderContext.snipObject | endif
		"else | let snipObject = {"setting" : xptObj.renderContext.snipSetting} | endif
		let toSnip = {"setting": snipObject.setting}
	else
		let toSnip = get(xt,super)
		if toSnip is 0
			if a:0 == 1 | return 'let _1Aa5_Tw2 = 0'
			else | return "" | endif
		endif
	endif
	try
		if type(sett) != type({})
			let curr = toSnip.setting
			if type(sett) == type(0)
				if a:0 == 1
					if type(a:1) == type("") && a:1 == "_unlet_" | unlet toSnip.setting
					else | let curr = a:1 | endif
				else | return curr | endif
			endif
			if type(sett) == type([])
				let sett = sett[0]
			endif
			if sett =~ '\V\^$\w\+'
				if a:0 == 1
					if type(a:1) == type("") && a:1 == "_unlet_" | unlet toSnip.setting.variables[sett]
					else | let curr.variables[sett] = a:1 | endif
				else | return curr.variables[sett] | endif
			else
				if a:0 == 1
					if type(a:1) == type("") && a:1 == "_unlet_" | unlet toSnip.setting[curr]
					else | let curr[sett] = a:1 | endif
				else | return curr[sett] | endif
			endif
		else
			let [namee, listt] = items(sett)[0]
			let curr = toSnip.setting[namee]
			while type(listt) == type({})
				let [namee, listt] = items(listt)[0]
				let curr = curr[namee]
			endwhile
			if type(listt) == type(0)
				if a:0 == 1
					if type(a:1) == type("") && a:1 == "_unlet_" | unlet toSnip.setting[namee]
					else | let curr = a:1 | endif
				else | return curr | endif
			else
				if a:0 == 1
					if type(a:1) == type("") && a:1 == "_unlet_" | unlet toSnip.setting[namee][listt]
					else | let curr[listt] = a:1 | endif
				else | return curr[listt] | endif
			endif
		endif
	catch /.*/
	endtry
	if super == "" && a:0 == 1
		let xptObj.renderContext.snipObject = snipObject
		let xptObj.renderContext.snipSetting = copy(xptObj.renderContext.snipObject.setting)
	endif
	return 'let _1Aa5_Tw2 = 0'
endfunction
fun! s:f.xset(str, ...)
	echom "**********" . string(a:str)
	if type(a:str) != type("") && type(a:str) != type([])
		return a:str
	endif
	let xptObj = b:xptemplateData
	if xptObj.renderContext.snipSetting == {} && xptObj.renderContext.phase == "uninit"
		return a:str
	endif
	if a:0 == 1
		let xt = xptObj.filetypes[g:GetSnipFileFT()].allTemplates
		toSnip = get(xt, a:1)
		if toSnip is 0
			return ""
		endif
	else
		let snipObject = deepcopy(xptObj.renderContext.snipObject)
		let toSnip = {"setting":snipObject.setting}
	endif
	let res = g:MyXSEThandler(toSnip.setting, a:str)
	if a:0 == 0
		let xptObj.renderContext.snipObject = snipObject
		let xptObj.renderContext.snipSetting = copy(xptObj.renderContext.snipObject.setting)
	endif
	return res
endfunction
fun! s:f.Setting(query)
	let query = type(a:query) == type("") ? {a:query : 1} : a:query
	let xptObj = b:xptemplateData
	let rSo = deepcopy(xptObj.renderContext.snipObject)
	call g:MyMergeSSetting(rSo.setting, query)
	let xptObj.renderContext.snipObject = rSo
	let xptObj.renderContext.snipSetting = copy(xptObj.renderContext.snipObject.setting)
endfunction
fun! s:f.SettingK(name)
	let xptObj = b:xptemplateData
	let xt = xptObj.filetypes[g:GetSnipFileFT()].allTemplates
	let toSnip = get(xt, a:name)
	if toSnip is 0
		return
	endif
	echom string(toSnip.setting)
	let rSo = deepcopy(xptObj.renderContext.snipObject)
	call g:MyMergeSetting(rSo.setting, toSnip.setting)
	let xptObj.renderContext.snipObject = rSo
	let xptObj.renderContext.snipSetting = copy(xptObj.renderContext.snipObject.setting)
endfunction
fun! s:f.getVariables(...)
	let a1 = [""]
	let a = []
	let variables = {}
	if a:0 > 0
		if type(a:1) == type("")
			if a:1[0] != "$"
				let a1 = [a:1]
			else
				let a = [a:1]
			endif
		else
			if a:1[0][0] != "$"
				let a1 = a:1
			else
				let a = a:1
			endif
		endif
		if (a:0 == 2) && type(a:2) == type("")
			let a = [a:2]
		else
			let a = a:2
		endif
	endif
	for snip in a1
		call extend(variables, self.snipGS({snip : "variables"}), "force")
	endfor
	let variables = xpt#util#RemoveDuplicateFrom(keys(variables), a)
	let newv = []
	for a in variables
		if a[0] == "$" && !(a =~ '\V\^$_\.\*_\$')
				call add(newv, a[1:])
		endif
	endfor
	"return self.Choose(newv)
	return self.NextC(self.pickL(newv))
endfunction
fun! s:f.getVariablesPost(var, ...)
	let vars = {}
	if a:0 == 1
		let snips =  (type(a:1) == type("")) ? [a:1] : a:1
		for snip in snips
			if snip == ""
				call extend(vars, b:xptemplateData.renderContext.snipObject.setting.variables, "force")
			else
				let toSnip = get(b:xptemplateData.filetypes[g:GetSnipFileFT()].allTemplates, snip)
				if toSnip is 0
					continue
				else
					call extend(vars, toSnip.setting.variables, "force")
				endif
			endif
		endfor
	else
		let vars = b:xptemplateData.renderContext.snipObject.setting.variables
	endif
	return (has_key(vars, a:var)) ? vars[a:var] : self.V()
endfunction
fun! s:f.ReturnIfEq( expected, retval, ...)
	let v = self.V0()
	let expected = (type(a:expected) == type("")) ? [a:expected] : a:expected
	if a:0 == 1
		return index(expected, v) != -1 ? a:retval : a:1
	else
		return index(expected, v) != -1 ? a:retval : self.V()
	endif		
endfunction
fun! s:f.ReturnIfNotEq( expected, retval, ... )
	let v = self.V0()
	let expected = (type(a:expected) == type("")) ? [a:expected] : a:expected
	if a:0 == 1
		return index(expected, v) == -1 ? a:retval : a:1
	endif 
		return index(expected, v) == -1 ? a:retval : self.V()
	endif
endfunction
fun! s:f.ChainX(...)
	if a:0 != 0
		let codes = (type(a:1) == type([])) ? a:1 : a:000
		for code in codes
			let result = (type(code) == type("")) ? self.XS(code) : code
		endfor
		return result
	endif
endfunction
fun! s:f.ChainZ(...)
	if a:0 != 0
		let codes = (type(a:1) == type([])) ? a:1 : a:000
		for code in codes
			let result = (type(code) == type("")) ? self.ZS(code) : code
		endfor
		return result
	endif
endfunction


XPT _chooseXSET hidden
XSET function.pre=function
XSET function.def=getVariables()
XSET function.post=getVariablesPost("$".V())
`function^

XPT pre
XSET $want=1
XSET $dont want=2

XPT test alias=_chooseXSET
XSET $myown=dfg
XSET $pick not=dfgd
XSET $pick more=dfgsdd
XSET function.def=getVariables(["pre", ""], ["$dont want","$pick not"])
XSET function.post=getVariablesPost("$".V(), ["pre", ""])