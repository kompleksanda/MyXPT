XPTemplate priority=lang

XPT _des_post hidden
XSET des.post=X('if xfunc.V\()==">()"|retu""|el|retu xfunc.V\()|en')
XPT _singleClass hidden
.`$_xSnipName^
XPT hide alias=_singleClass synonym=navbar-header|navbar-text|nav-divider|caption|text-left|text-right|text-center|text-justify|text-nowrap|text-uppercase|text-lowercase|text-capitalize|text-muted|text-primary|text-success|text-info|text-warning|text-danger|text-hide|bg-primary|page-header|list-unstyled|fade-in|collapse-in|collapsing|center-block|pull-right|pull-left|show|lead|initialism|invisible|hidden|visible-print|visible-print-inline|hidden-print|row|pre-scrollable|sr-only|sr-only-focusable
XPT img synonym=img-rounded|img-circle|img-thumbnail|img-responsive
XSET opt.pre=
XSET ComeLast=opt
XSET opt=ChooseStr(".thumbnail>",".thumbnail>a>",".carousel-inner>.item>",".carousel-inner>.item>a>")
XSET imgType=ChooseStr(".img-responsive",".img-rounded",".img-circle",".img-thumbnail")
XSET imgName=X('if index(["img",xfunc.R\("imgType")[1:]],xfunc._xSnipName\())!=-1|retu ""|el|retu ".".xfunc._xSnipName\()|en')
`opt^img`imgType^`imgName^

"navigation bar
XPT navbar setting=_des_post
XSET des=ChooseStr(".container>.navbar-brand",".container-fluid>.navbar-brand")
.navbar`>(`des`)^
XPT navbar-fixed-bottom setting=_des_post
XSET des=ChooseStr(".dropdown>.caret",".dropdown>.dropdown-menu",".navbar-collapse",".navbar-nav>li>.dropdown-menu")
.navbar-fixed-bottom`>(`des`)^
XPT navbar-fixed-top
.`_xSnipName^`>.navbar-collapse^
XPT navbar-static-top alias=navbar-fixed-top
XPT navbar-collapse
XSET des1=ChooseStr(".in",".collapse")
XSET opt=ChooseStr(".navbar-fixed-top>",".navbar-static-top>",".navbar-fixed-bottom>",".container-fluid>",".navbar-default>",".navbar-inverse>")
`opt^.navbar-collapse`des1^
XPT navbar-brand
XSET opt=ChooseStr(".navbar>.container>",".navbar>.container-fluid>",".navbar-default>",".navbar-inverse>")
`opt^.navbar-brand`>img^
XPT navbar-btn
.navbar-btn`opt^ChooseStr(".btn-sm",".btn-xs")^
XPT navbar-toggle
`opt^ChooseStr(".navbar-default>",".navbar-inverse>")^.navbar-toggle`>.icon-bar^
XPT navbar-nav setting=_des_post
XSET des=ChooseStr("li","li>a","li>.dropdown",".open>(a)+.dropdown-menu",".open>.dropdown-menu",".open>.dropdown-menu>li>a",".open>.dropdown-menu>.dropdown-header",".open>a")
.navbar-nav`>(`des`)^
XPT navbar-form setting=_des_post
XSET $_import_={"form-control":{"postFilters":"_has"}}
XSET des=ChooseStr(".form-group",".form-control",".form-control-static",".input-group",".input-group>.input-group-addon",".input-group>.form-control",".control-label")
`opt^ChooseStr(".navbar-default>",".navbar-inverse")^.navbar-form`>(`des`)^
XPT navbar-text
`opt^ChooseStr(".navbar-default>",".navbar-inverse")^.`$_xSnipName^
XPT navbar-left alias=_singleClass
XPT navbar-right setting=_des_post
XSET des=ChooseStr(".dropdown-menu",".dropdown-menu-left")
.navbar-right`>(`des`)^
XPT navbar-default setting=_des_post
XSET des=NextC(pickL(['.navbar-brand','.navbar-text','`:navbar-nav!!:^','`:navbar-toggle!!:^','.icon-bar','.navbar-collapse','.navbar-form','.navbar-link','.btn-link'],"+"))
.`$_xSnipName^`.navbar-fixed-bottom^`>(`des`)^
XPT navbar-inverse alias=navbar-default
XPT navbar-link alias=navbar-text
..XPT

"navigation
XPT nav setting=_des_post
XSET des=ChooseStr("li","li>a","li>a>img","li.disabled>a",".open>a","nav-divider")
.nav`>(`des`)^
XPT nav-tabs setting=_des_post
XSET des=ChooseStr("li","li>a","li.active>a",".dropdown>.dropdown-menu",".dropdown-menu",".active>a")
.nav-tabs`.nav-justified^`>(`des`)^
XPT nav-pills setting=_des_post
XSET des=ChooseStr("li","li>a","li.active>a","li>a>.badge")
.`_xSnipName^`>(`des`)^
XPT nav-tabs-justified alias=nav-pills
XPT nav-stacked
.nav-stacked`>li^
XPT nav-justified setting=_des_post
XSET des=ChooseStr("li","li>a",".dropdown>.dropdown-menu")
`.nav-tabs^.nav-justified`>(`des`)^
..XPT

"tab content
XPT tab-content setting=_des_post
XSET des=ChooseStr(".tab-pane",".active")
.tab-content`>(`des`)^
XPT tab-pane
.tab-content>.tab-pane
..XPT

"label
XPT _has hidden
`_has^ChooseStr(".has-success",".has-warning",".has-error",".has-feedback")^
XPT _radio/checkbox hidden
`_rad/check^ChooseStr(".radio",".checkbox")^
XPT _radio/checkbox-inline hidden
`_rad/check-inl^ChooseStr(".radio-inline",".checkbox-inline")^
XPT label
XSET opt2.pre=
XSET $opt=if index([".radio",".checkbox"],V\()) != -1
XSET $opt+=| return '`optional^'.string(V\()).'`:_has:^`.disabled^>'
XSET $opt+=|elseif index([".radio-inline",".checkbox-inline"],V\()) != -1
XSET $opt+=| return string(V\()).'`:_has:^>'
XSET $opt+=|else | return string(V\()) | endif
XSET $label=if index(['a','.btn>'],R\('opt'))!=-1|ec".label"|el|ec"label"|en
XSET optional=ChooseStr(".form-inline>",".navbar-form>","fieldset[disabled]>")
XSET opt=ChooseStr("a",".btn>",".radio",".checkbox",".radio-inline",".checkbox-inline")
XSET opt2=ChooseStr(".label-success",".label-primary",".label-info",".label-default",".label-danger",".label-warning")
`opt^XS($opt)^^`label^X($label)^`opt2^
XPT label-default
`:label:^.`$_xSnipName^
XPT label-primary alias=label-default
XPT label-success alias=label-default
XPT label-info alias=label-default
XPT label-warning alias=label-default
XPT label-danger alias=label-default
..XPT

"table
XPT table "table
XSET opt=ChooseStr(".table-responsive>",".panel>.panel-collapse>",".panel>",".panel>.table-responsive>",".panel>.panel-body+")
`opt^table.table
XPT table-bordered synonym=table-condensed|table-striped|table-hover|table-responsive
`:table:^.`$_xSnipName^
..XPT

"background
XPT bg-success alias=bg-primary synonym=bg-info|bg-warning|bg-danger
..XPT

"list
XPT list-inline
.list-inline`>li^
..XPT

"list group
XPT list-group
XSET opt=ChooseStr(".panel",".panel>.panel-collapse",".panel-group>.panel-heading+.panel-collapse>")
`opt^.list-group
XPT list-group-item setting=_des_post
XSET des=ChooseStr(".list-group-item-heading","small",".list-group-item-text",".badge")
XSET opt=ChooseStr(".panel>.list-group>",".panel>.panel-collapse>.list-group>","a")
`opt^`opt1^ChooseStr(".disabled",".active")^.list-group-item`>(`des`)^
XPT list-group-item-success synonym=list-group-item-info|list-group-item-warning|list-group-item-danger setting=_des_post
XSET des=ChooseStr(".list-group-item-heading","")
`a^.`$_xSnipName^`.active^`>(`des`)^
XPT list-group-item-heading
XSET list=ChooseStr(".list-group-item-success",".list-group-item-info",".list-group-item-warning",".list-group-item-danger")
XSET opt=ChooseStr(".list-group-item.disabled>",".list-group-item.active>","a>")
XSET opt.post=X('if xfunc.V\()=="a>"|retu "a`list^>"|el|retu xfunc.V\()|en')
`opt^.`$_xSnipName^
XPT list-group-item-text
XSET opt=ChooseStr(".list-group-item.disabled>",".list-group-item.active>")
`opt^.`$_xSnipName^
XPT list-group-text-info alias=list-group-item-success
..XPT

"container
XPT container setting=_des_post
XSET des=ChooseStr(".navbar-header",".navbar-collapse",".jumbotron")
`.jumbotron>^.`$_xSnipName^`>(`des`)^
XPT container-fluid alias=container
..XPT

"form
XPT form-control
XSET ComeFirst=opt
XSET opt=ChooseStr("fieldset[disabled]>","textarea",".form-group-sm>",".form-group-lg>",".form-inline>",".input-group>",".input-group-lg",".navbar-form")
XSET opt1=X('if xfunc.R\("opt") =~ "^\\.form-group-.\\+$"|retu xfunc.ChooseStr\("select","select[multiple]", "textarea")|el|retu ""|en')
XSET _has.post=XS('if xfunc.V\()==""|retu""|el|retu xfunc.V\() . ">"|en')
`:_has:^`opt1^`opt^.form-control
XPT form-control-static
XSET size=ChooseStr("input-lg","input-sm")
`opt^ChooseStr(".navbar-form>",".form-inline>")^.form-control-static` `INPUT SIZE...`{{^.`size^`}}^
XPT form-control-feedback
XSET ComeFirst=opt _has
XSET opt=ChooseStr(".input-lg+",".input-sm+")
XSET opt1=X('if xfunc.R\("_has")==".has-feedback>"|retu xfunc.ChooseStr\(".form-inline>",".form-horizontal>",".navbar-form>")|el|retu ""|en')
XSET $_import_={"form-control":{"postFilters":"_has"}}
`opt1^`:_has:^`opt^.form-control-feedback
XPT form-inline
XSET der=ChooseStr(".form-group",".form-control",".form-control-static",".control-label",".input-group",".input-group>.input-group-addon",".input-group>.input-group-btn",".input-group>.form-control",".radio",".checkbox")
.form-inline`>(`der`)^
XPT form-horizontal
XSET der=ChooseStr(".form-group",".form-group-lg",".form-group-sm",".control-label","checkbox","radio",".checkbox-inline","radio-inline",".has-feedback>.form-control-feedback")
.form-horizontal`>(`der`)^
XPT form-group
XSET opt=ChooseStr(".form-inline>",".form-horizontal>",".navbar-form>")
`opt^.form-group
XPT form-group-sm
XSET tag=ChooseStr("select","textarea")
`tag^.`$_xSnipName^`>.form-control^
XPT form-group-lg alias=form-group-sm
..XPT

"radio checkbox button
XPT radio setting=_des_post
XSET des=ChooseStr(".label","input[type=\"radio\"]")
XSET opt=ChooseStr(".form-inline>",".form-horizontal>",".navbar-form>",".disabled")
XSET $_import_={"form-control":{"postFilters":"_has"}}
`:_has:^`opt^.`$_xSnipName^`>(`des`)^
XPT radio-inline
XSET opt=ChooseStr("fieldset[disabled]",".form-horizontal>",".disabled")
XSET $_import_={"form-control":{"postFilters":"_has"}}
`:_has:^`opt^.`$_xSnipName^>`input[type="radio"]^
XPT checkbox alias=radio
XSET des=ChooseStr(".label","input[type=\"checkbox\"]")
XPT checkbox-inline setting=radio-inline
`:_has:^`opt^.`$_xSnipName^>`input[type="checkbox"]^
..XPT

"button
XPT btn setting=_des_post
XSET ComeFirst=optional1
XSET optional2.pre=
XSET $optional_common=["fieldset[disabled]>",".open>.dropdown-toggle>",".disabled"]
XSET $optional_Common=[".carousel-caption>"]
XSET $optional_btn=string(extend(eval($optional_common), [".btn-group-lg>",".btn-group-sm>",".btn-group-xs>",".btn-group>"]))
XSET $optional_input=string(extend(eval($optional_common), [".input-group-btn>"]))
XSET $cCode=let optional1 = string(R\("optional1"))|
XSET $optional_=$cCode if optional1 =~ '\V\^.btn-group\.\*' || optional1 == ".input-group-btn>"
XSET $optional_+=|  retu string($optional_btn)
XSET $optional_+=|elseif optional1 =~ '\V\^.input-group\.\*'
XSET $optional_+=|  retu string($optional_input)
XSET $optional_+=|else
XSET $optional_+=|  retu string(string(extend(eval($optional_Common),extend(eval($optional_btn), eval($optional_input)))))
XSET $optional_+=|endif
XSET optional0=Choose(eval(XS($optional_)))
XSET optional1=NextC(pickL([".btn-toolbar>",".btn-group-vertical>",".btn-group-justified>",".input-group-lg>",".input-group-sm>",".input-group-btn>",".modal-footer>"],"","optional1"))
XSET $optional2=$cCode if optional1 =~ '\V\^.input-group\.\*'
XSET $optional2+=| return ["select","select[multiple]","textarea"]
XSET $optional2+=|else | return xfunc.Next\\("") | endif
XSET des=ChooseStr(".caret",".label")
`optional2^XS($optional2)^`optional1^`optional0^.btn`>(`des`)^
XPT btn-default synonym=btn-sm|btn-lg|btn-xs
`:btn:^.`$_xSnipName^`.active^`>.badge^
XPT btn-primary alias=btn-default
XPT btn-success alias=btn-default
XPT btn-info alias=btn-default
XPT btn-warning alias=btn-default
XPT btn-danger alias=btn-default
XPT btn-link
XSET opt=ChooseStr(".btn-group.open>.dropdown-toggle",".navbar-default",".navbar-inverse")
`opt^.btn-link
XPT btn-block alias=btn-default
XSET $_import_={"btn":"$optional_common"}
XSET $optional_common=string(extend(eval($optional_common),[]))
XPT btn-toolbar setting=_des_post
XSET des=ChooseStr(".btn-group",".input-group",".btn")
`:btn:^`>(`des`)^
XPT btn-group-sm synonym=btn-group-lg|btn-group-xs
.`$_xSnipName^`>.btn^
XPT btn-group setting=_des_post
XSET des=ChooseStr(".btn.active",".dropdown-toggle",".dropdown-toggle.btn-link",".btn+.dropdown-toggle",".btn-lg+.dropdown-toggle")
`$_xSnipName^`.open^`>(`des`)^
XPT btn-group-vertical text=btn-group
XSET des=ChooseStr(".btn.active",".dropdown-toggle",".dropdown-toggle.btn-link",".btn+.dropdown-toggle",".btn-lg+.dropdown-toggle","btn.group")
XPT btn-group-justified alias=btn-group
XSET des=ChooseStr(".btn",".btn-group",".btn-group>.btn",".btn-group>.dropdown-menu")
.button-group-justified`>(`des`)^
..XPT

"fade
XPT fade
`.modal-backdrop^.fade`.in^
XPT collapse
`tr^`tbody^.collapse`.in^
XPT caret
XSET opt=ChooseStr(".dropup>.btn>",".dropup>",".btn>",".btn-lg>","dropup>.btn-lg>",".navbar-fixed-bottom>.dropdown>")
`opt^.caret
..XPT

"drop
XPT dropdown alias=_singleClass
XPT dropdown-toggle
XSET opt=ChooseStr(".open>",".input-group-btn",".panel-heading>.dropdown>",".btn-group>",".btn-group.open>",".btn-group>.btn+",".btn-group>.btn-lg+",".btn-group-vertical>.btn-group>")
XSET sib=ChooseStr(".btn",".btn-default",".btn-primary",".btn-success",".btn-warning",".btn-info",".btn-danger")
`opt^.dropdown-toggle`sib^
XPT dropdown-menu setting=_des_post
XSET ComeFirst=opt
XSET opt=ChooseStr(".open>",".pull-right",".dropup>",".dropdown>",".pull-right>",".navbar-right>",".btn-group>",".navbar-nav>.open>",".navbar-nav>li>",".navbar-fixed-bottom>.navbar-nav>li>")
XSET opt1=X('if xfunc.R\("opt")==".dropdown>"|retu[".nav-justified>",".nav-tabs>",".nav-tabs.nav-justified>",".navbar-fixed-bottom>"]|elseif xfunc.R\("opt")==".btn-group>"|retu"`.btn-group-justified>^"|el|retu""|en')
XSET des=ChooseStr(".divider","li>a",".active>a",".disabled>a")
`opt1^`opt^.dropdown-menu`>(`des`)^
XPT dropdown-menu-right alias=_singleClass
XPT dropdown-menu-left alias=_singleClass
XPT dropdown-header
XSET opt=ChooseStr(".navbar-inverse>.navbar-nav>.open>.dropdown-menu>",".navbar-nav>.open>.dropdown-menu>")
`opt^.dropdown-header
XPT dropdown-backdrop alias=_singleClass
XPT dropup setting=_des_post
XSET des=ChooseStr(".dropdown-menu",".caret",".btn-lg>.caret",".btn>.caret")
`.navbar-fixed-bottom>^.dropup`>(`des`)^
..XPT

"input
XPT input-sm 
XSET tag=ChooseStr("select", "textarea")
`tag^.`$_xSnipName^
XPT input-lg alias=input-sm
XPT input-group setting=_des_post
XSET opt=ChooseStr(".navbar-form>",".form-inline",".btn-toolbar")
XSET des=ChooseStr(".input-group-addon",".input-group-btn",".form-control")
`opt^.input-group`>(`des`)^
XPT input-group-addon setting=_des_post
XSET ComeFirst=opt
XSET opt=ChooseStr(".input-group>",".input-group-lg>",".input-group-sm>")
XSET opt1.pre=
XSET opt1=ChooseStr(".form-inline>",".navbar-form>","select","textarea","select[multiple]")
XSET $_import_={"form-control":{"postFilters":"_has"}}
XSET des=ChooseStr("input[type=\"radio\"]","input[type=\"checkbox\"]")
`:_has:^`opt1^`opt^.input-group-addon`>(`des`)^
XPT input-group-btn setting=_des_post
XSET opt=ChooseStr(".form-inline>.input-group>",".navbar-form>.input-group>")
XSET des=ChooseStr(".btn",".btn-group>.btn",".dropdown-toggle")
`opt^.input-group-addon`>(`des`)^
XPT input-group-lg setting=_des_post
XSET des=ChooseStr(".input-group-addon",".input-group-btn",".input-group-addon>.btn",".form-control")
`select>^`textarea>^.`_xSnipName^`>(`des`)^
XPT input-group-sm alias=input-group-lg
..XPT

"breadcrumb
XPT breadcrumb setting=_des_post
.breadcrumb`>(`des`)^ChooseStr("li",".active")^
XPT pagination setting=_des_post
XSET des=ChooseStr("li","li>a","li>span")
.`$_xSnipName^`>(`des`)^
XPT pagination-lg alias=pagination
XPT pagination-sm alias=pagination
XPT pager setting=_des_post
XSET des=ChooseStr("li>a","li>span",".next>a",".previous>span")
.pager`>(`des`)^
XPT badge
XSET pan=ChooseStr(".panel-info",".panel-success",".panel-primary",".panel-default",".panel-warning",".panel-danger")
XSET but=ChooseStr(".btn-info",".btn-success",".btn-primary",".btn-default",".btn-warning",".btn-danger")
XSET opt=ChooseStr(".list-group-item>",".list-group-item.active>",".nav-pills>.active>a>",".nav-pills>li>a>",".panel-default>.panel-heading>",".btn>")
XSET opt.post=X('if xfunc.V\()==".panel-default>.panel-heading>"|retu ".panel-default`pan^>.panel-heading>"|elseif xfunc.V\()==".btn>"|retu ".btn`but^>"|el|retu xfunc.V\()|en')
`opt^.badge
XPT jumbotron setting=_des_post
`opt^ChooseStr(".container>",".container-fluid>")^.jumbotron`>(`des`)^ChooseStr("h1",".h1","p","hr")^
XPT thumbnail setting=_des_post
XSET des=ChooseStr("img","a>img",".caption")
.thumbnail`>(`des`)^
..XPT

"alert
XPT alert setting=_des_post
.alert`>(`des`)^ChooseStr("p","ul","h4",".alert-link")^
XPT alert-link
XSET opt=ChooseStr(".alert-success",".alert-info",".alert-warning",".alert-danger")
.alert`opt^>.alert-link
XPT alert-dismissable setting=alert-link
.alert`opt^.alert-dismissable`>.close^
XPT alert-success synonym=alert-info|alert-warning|alert-danger setting=_des_post
.alert.`$_xSnipName^`>(`des`)^ChooseStr("hr",".alert-link")^
XPT progress setting=_des_post
.progress`.active^`>(`des`)^ChooseStr(".progress-bar","")^
XPT progress-striped setting=_des_post
.progress-striped`>(`des`)^ChooseStr(".progress-bar","")^
XPT progress-bar
XSET opt=ChooseStr(".progress-striped>",".progress.active>")
`opt^.progress-bar`.active^
XPT progress-bar-striped setting=_des_post
XSET des=ChooseStr(".progress-bar-success",".progress-bar-info",".progress-bar-danger",".progress-bar-warning",
.progress-bar-striped`>(`des`)^
XPT progress-bar-success
`.progress-striped>^.`$_xSnipName^
XPT progress-bar-info alias=progress-bar-success
XPT progress-bar-warning alias=progress-bar-success
XPT progress-bar-danger alias=progress-bar-success
..XPT

"media
XPT media
.media`>(`des`)^ChooseStr(".pull-right","pull-left")^
XPT media-right synonym=media-left|media-middle|media-bottom
.media.`$_xSnipName^
XPT media-heading synonym=media-list|media-body
.media.>`$_xSnipName^
XPT panel setting=_des_post
XSET des=ChooseStr(".list-group",".panel-collapse>.list-group",".panel-collapse>.list-group.list-group-item",".list-group.list-group-item",".table caption",".table-responsive.table caption",".panel-collapse>.table caption",".table-bordered")
`.panel-group>^.panel`>(`des`)^
XPT panel-body
XSET panel=ChooseStr(".panel-group",".panel-default",".panel-primary",".panel-success",".panel-info",".panel-warning",".panel-danger")
XSET opt=ChooseStr(".panel>",".panel>.table+",".panel>.table-responsive+",".panel-**>.panel-heading/footer+.panel-collapse>")
XSET opt.post=X('if xfunc.V\()==".panel-**>.panel-heading/footer+.panel-collapse>"|retu "`panel^>`hORf^ChooseStr(\".panel-heading\",\".panel-footer\")^+.panel-collapse"|el|retu xfunc.V\()|en')
`opt^.panel-body
XPT panel-heading setting=_des_post
XSET panel=NextC(pickL(ZS(ZS(snipGS({"panel-body":{"defaultValues":{"panel":"text"}}})).pum)))
`panel`>^.panel-heading`>(`des`)^ChooseStr(".dropdown>.dropdown-toggle","")^
XPT panel-title
.panel-title`>a^
XPT panel-footer alias=_singleClass
XPT panel-collapse alias=_singleClass
XPT panel-group setting=_des_post
XSET des=ChooseStr(".panel",".panel-heading",".panel-heading+.panel-collapse>panel-body",".panel-heading+.panel-collapse>.list-group","panel-footer","panel-footer+.panel-collapse>.panel-body")
.panel-group`>(`des`)^
XPT panel-default synonym=panel-primary|panel-success|panel-info|panel-warning|panel-danger setting=_des_post
XSET des=ChooseStr(".panel-heading+.panel-collapse>panel-body",".panel-heading.badge+.panel-collapse>.panel-body",".panel-footer+.panel-collapse>.panel-body","panel-footer")
.`$_xSnipName^`>(`des`)^
..XPT

"embed
XPT embed-responsive setting=_des_post
XSET des=ChooseStr(".embed-responsive-item","iframe","embed","object","video")
.embed-responsive`opt^ChooseStr(".embed-responsive-16by9",".embed-responsive-4by3")^`>(`des`)^
XPT embed-responsive-item
.embed-responsive>.embed-responsive-item
XPT embed-responsive-16by9
.embed-responsive.`_xSnipName^
XPT embed-responsive-4by3 alias=embed-responsive-16by9
..XPT

"well
XPT well
.well`>blockquote^
XPT well-sm alias=_singleClass
XPT well-lg alias=_singleClass
..XPT

"modal
XPT modal
`.modal-open>^.modal`opt^ChooseStr(".fade",".in")^`>(.modal-dialog)^
XPT modal-open
.modal-open`>.modal^
XPT modal-dialog
XSET opt=ChooseStr(".modal.fade>",".modal.in>")
`opt^.modal-dialog
XPT modal-content alias=_singleClass
XPT modal-backdrop
.modal-backdrop`opt^ChooseStr(".fade",".in")^
XPT modal-header
.modal-header`>(.close)^
XPT modal-body alias=_singleClass
XPT modal-footer setting=_des_post
XSET des=ChooseStr(".btn-group.btn",".btn","btn-block")
.modal-footer`>(`des`)^
XPT modal-scrollable-measure alias=_singleClass
XPT modal-sm alias=_singleClass
XPT modal-lg alias=_singleClass
..XPT

"tooltip
XPT tooltip
XSET sib=ChooseStr(".in",".top",".right",".bottom",".left",".top-left",".top-right",".bottom-left",".bottom-right")
.tooltip`sib^`>(.tooltip-arrow)^
XPT tooltip-inner alias=_singleClass
XPT tooltip-arrow setting=tooltip
`.tooltip>{{^.tooltip`sib^>`}}^.tooltip-arrow
..XPT

"popover
XPT popover
XSET sib=ChooseStr(".left",".right",".bottom",".top")
.popover`sib^`>(.arrow)^
XPT popover-title alias=_singleClass
XPT popover-content alias=_singleClass
..XPT

"carousel
XPT carousel alias=_singleClass
XPT carousel-inner setting=_des_post
XSET des=ChooseStr(".item",".item>img",".item>a>img","img","a>img",".next",".active.right",".prev",".active.left",".active.right",".next.left",".prev.right",".active")
XSET des.post=X('let v = xfunc.V\()|if v =~"^>(\\.item"|let ind = matchend\(v,"^>(\\.item")|retu v[:ind-1]."`itemOpt^".v[ind:]|elseif v==">()"|retu""|el|retu v|en')
XSET itemOpt=ChooseStr(".next",".active.right",".prev",".active.left",".active.right",".next.left",".prev.right",".active")
.carousel-inner`>(`des`)^
XPT carousel-control setting=_des_post
XSET des=ChooseStr(".icon-prev",".icon-next",".glyphicon-chevron-left",".glyphicon-chevron-right")
.carousel-control`opt^ChooseStr(".left",".right")^`>(`des`)^
XPT carousel-indicators setting=_des_post
.carousel-indicators`>(`des`)^ChooseStr("li",".active")^
XPT carousel-caption
.carousel-caption`>(.btn)^
..XPT

"others
XPT close
`button^.close
XPT dl-horizontal setting=_des_post
.dl-horizontal`>(`des`)^ChooseStr("dt","dd")^
XPT blockquote setting=_des_post
XSET des=ChooseStr("footer","small","p","ul","ol")
blockquote`.pull-right^`>(`des`)^
XPT item
.carousel-inner>.item
XPT blockquote-reverse setting=blockquote
.blockquote-reverse`>(`des`)^
XPT help-block
XSET $_import_={"form-control":{"postFilters":"_has"}}
`:_has:^.`$_xSnipName^
XPT control-label
XSET ComeFirst=opt
XSET $_import_={"form-control":{"postFilters":"_has"}}
XSET opt=ChooseStr(".form-inline>",".form-horizontal>",".navbar-form>")
XSET opt1=X('if xfunc.R\("opt")==".form-horizontal>"|retu [".form-group-lg>",".form-group-sm>"]|el|retu ""|en')
`:_has:^`opt^`opt1^.control-label
XPT icon-bar
XSET opt=ChooseStr(".navbar-default>.navbar-toggle>",".navbar-toggle>")
`opt^.icon-bar
XPT icon-prev
`.carousel-control>^.`$_xSnipName^
XPT icon-next alias=icon-prev
XPT glyphicon
XSET ComeFirst=glyph
XSET opt.pre=
XSET $glyphicons=asterisk plus euro minus cloud envelope pencil glass music search heart star star-empty user film th-large th th-list ok remove zoom-in zoom-out off signal cog trash home file time road download-alt download upload inbox play-circle repeat refresh list-alt lock flag headphones volume-off volume-down volume-up qrcode barcode tag tags book bookmark print camera font bold italic text-height text-width align-left align-center align-right align-justify list indent-left indent-right facetime-video picture map-marker adjust tint edit share check move step-backward fast-backward backward play pause stop forward fast-forward step-forward eject chevron-left chevron-right plus-sign minus-sign remove-sign ok-sign question-sign info-sign screenshot remove-circle ok-circle ban-circle arrow-left arrow-right arrow-up arrow-down share-alt resize-full resize-small exclamation-sign gift leaf fire eye-open eye-close warning-sign plane calendar random comment magnet chevron-up chevron-down retweet shopping-cart folder-close folder-open resize-vertical resize-horizontal hdd bullhorn bell certificate thumbs-up thumbs-down hand-right hand-left hand-up hand-down circle-arrow-right circle-arrow-left circle-arrow-up circle-arrow-down globe wrench tasks filterbriefcase fullscreen dashboard paperclip heart-empty link phone pushpin usd gbp sort sort-by-alphabet sort-by-alphabet-alt sort-by-order sort-by-order-alt sort-by-attributes sort-by-attributes-alt unchecked expand collapse-down collapse-up log-in flash log-out new-window record save open saved import export send floppy-disk floppy-saved floppy-remove floppy-save floppy-open credit-card transfer cutlery header compressed earphone phone-alt tower stats sd-video hd-video subtitles sound-stereo sound-dolby sound-5-1 sound-6-1 sound-7-1 copyright-mark registration-mark cloud-download cloud-upload tree-conifer tree-deciduous 
XSET glyph=NextC(sCat(".glyphicon-", pickL(split($glyphicons, " "))))
XSET $opt=if string(R\("glyph"))=~'\V\^.glyphicon-chevron-\.\+\\\\$'|retu"`.carousel-control>^"|el|retu""|en
`opt^X($opt)^.glyphicon`glyph^
..XPT
