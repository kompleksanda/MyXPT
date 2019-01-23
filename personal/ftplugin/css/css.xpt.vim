XPTemplate priority=lang
let s:f = g:XPTfuncs()
XPTinclude
	  \ _common/common

XPT prop
XSET $_preValues_={"name":1,"prop":1}
`name^NextC($_xCssName)^: `prop^NextC(_xCssProp(R('name')))^;
XPT color
XSET color=Choose(["red","green","blue","orange","yellow","brown","pink","grey","white","indigo","violet","aqua","slate","purple","black","rose","azure","chocolate","crimson","magenta","salmon","fuchsia","gold","khaki"])
XSET color.post=Build(V())
`color^

" background
XPT bg_attachment setting=_chooseXSET hidden " background attachment
XSET $scroll=scroll
XSET $fixed=fixed
background-attachment: `function^;
XPT bg_attachment_ setting=bg_attachment text=_chooseXSET
XPT bg_clip setting=_chooseXSET hidden " background clip
XSET $length=`^px
XSET $%=`percent^%
XSET $border-box=border-box
XSET $padding-box=padding-box
XSET $content-box=content-box
XSET $no-clip=no-clip
XSET $text=text
background-clip: `function^;
XPT bg_clip_ setting=bg_clip text=_chooseXSET
XPT bg_col setting=_chooseXSET hidden " background color
XSET $color=Trigger("color")
XSET $transparent=transparent
background-color: `function^;
XPT bg_col_ setting=bg_col text=_chooseXSET
XPT bg_image setting=_chooseXSET hidden " background image
XSET $url=`url^
XSET $none=none
background-image: `function^;
XPT bg_image_ setting=bg_image text=_chooseXSET
XPT bg_origin setting=_chooseXSET hidden " background origin
XSET $border-box the border contains part of the background=border-box
XSET $padding-box the background is only contained in the padding box=padding-box
XSET $content-box the background is where it is supposed to be inside the padding and border box=content-box
background-origin: `function^;
XPT bg_origin_ setting=bg_origin text=_chooseXSET
XPT bg_position setting=_chooseXSET hidden " background position
XSET $top left=top left
XSET $top center=top center
XSET $top right=top right
XSET $center left=center left
XSET $center center=center center
XSET $center right=center right
XSET $bottom left=bottom left
XSET $bottom center=bottom center
XSET $bottom right=bottom right
XSET $x% y%=`x^% `y^%
XSET $xPos yPos=`xPos^ `yPos^
background-position: `function^;
XPT bg_position_ setting=bg_position text=_chooseXSET
XPT bg_repeat setting=_chooseXSET hidden " background repeat
XSET $repeat=repeat
XSET $repeat-x=repeat-x
XSET $repeat-y=repeat-y
XSET $no-repeat=no-repeat
background-repeat: `function^;
XPT bg_repeat_ setting=bg_repeat text=_chooseXSET
XPT bg_size setting=_chooseXSET hidden " background size
XSET $length reduces the whole picture to size an repeat until it contains the box=`^px
XSET $% reduces the picture to the percent of the box=`percent^%
XSET $auto=auto
XSET $cover covers the picture as much as possible in the box=cover
XSET $contain tries to contain whole picture in the box width and height and repeated=contain
background-size: `function^;
XPT bg_size_ setting=bg_size text=_chooseXSET
XPT bg hidden " background
XSET bg_repeat=Trigger("bg_repeat_")
XSET bg_attachment=Trigger("bg_attachment_")
XSET bg_position=Trigger("bg_position_")
XSET color=Trigger("color")
background: `color^ `url^  `bg_repeat^ `bg_attachment^ `bg_position^;
XPT back alias=_chooseXSET
XSET $attachment=Trigger("bg_attachment")
XSET $clip {Read About}=Trigger("bg_clip")
XSET $color=Trigger("bg_col")
XSET $image=Trigger("bg_image")
XSET $origin specify which box(border, padding, content) will contain the background=Trigger("bg_origin")
XSET $position=Trigger("bg_position")
XSET $repeat=Trigger("bg_repeat")
XSET $size=Trigger("bg_size")
XSET $background=Trigger("bg")
XPT back_snip alias=_chooseXSET
XSETm $1 centers the background image into the padding box then repeat the image outside it, creates square effect=
background-image: url('`^');
background-size: cover;
background-origin: content-box;
background-position: center center;
padding: 50px;
XSETm END
..XPT

" border
XPT bd_width_ alias=_chooseXSET
XSET $thin=thin
XSET $medium=medium
XSET $thick=thick
XSET $length=`length^
XPT bd_style_ alias=_chooseXSET
XSET $none=none
XSET $hidden=hidden
XSET $dotted=dotted
XSET $dashed=dashed
XSET $solid=solid
XSET $double=double
XSET $groove=groove
XSET $ridge=ridge
XSET $inset=inset
XSET $outset=outset
XPT bd hidden " border
XSET border_width=Trigger("bd_width_")
XSET border_style=Trigger("bd_style_")
XSET color=Trigger("color")
border: `border_width^ `border_style^ `color^;
XPT bd_bottom setting=bd hidden " border bottom
border-bottom: `border_width^ `border_style^ `color^;
XPT bd_bottom_color hidden " border bottom color
XSET color=Trigger("color")
border-bottom-color: `color^;
XPT bd_bottom_style hidden " border bottom style
XSET border_style=Trigger("bd_style_")
border_bottom_style: `border_style^;
XPT bd_bottom_width hidden " border bottom width
XSET border_width=Trigger("bd_width_")
border-bottom-width: `border_width^;
XPT bd_collaspe setting=_chooseXSET hidden " border collapse
XSET $collapse=collapse
XSET $separate=separate
border-collapse: `function^;
XPT bd_collaspe_ setting=bd_collaspe text=_chooseXSET
XPT bd_color setting=bd_bottom_color hidden " border color
border-color: `color^;
XPT bd_image hidden " border image
border-image: `url^ 5 5 5 5 stretch;
XPT bd_left setting=bd hidden " border left
border-left: `border_width^ `border_style^ `color^;
XPT bd_left_color setting=bd_bottom_color hidden " border left color
border-left-color: `color^;
XPT bd_left_style setting=bd_bottom_style hidden " border left style
border_left_style: `border_style^;
XPT bd_left_width setting=bd_bottom_width hidden " border left width
border-left-width: `border_width^;
XPT bd_right setting=bd hidden " border right
border-right: `border_width^ `border_style^ `color^;
XPT bd_right_color setting=bd_bottom_color hidden " border right color
border-right-color: `color^;
XPT bd_right_style setting=bd_bottom_style hidden " border right style
border_right_style: `border_style^;
XPT bd_right_width setting=bd_bottom_width hidden " border right width
border-right-width: `border_width^;
XPT bd_top setting=bd hidden " border top
border-top: `border_width^ `border_style^ `color^;
XPT bd_top_color setting=bd_bottom_color hidden " border top color
border-top-color: `color^;
XPT bd_top_style setting=bd_bottom_style hidden " border top style
border_top_style: `border_style^;
XPT bd_top_width setting=bd_bottom_width hidden " border top width
border-top-width: `border_width^;
XPT bd_width setting=bd_bottom_width hidden " border width
border-width: `border_width^;
XPT bd_radius hidden " border radius
border-radius: `tr_radius^ `br_radius^ `bl_radius^ `tl_radius^;
XPT bd_top_right_raduis hidden " border top-right radius
border-top-right-radius: `^px;
XPT bd_bottom_right_radius hidden " border bottom-right radius
border-bottom-right-radius: `^px;
XPT bd_bottom_left_radius hidden " border bottom-left radius
border-bottom-left-radius: `^px;
XPT bd_top_left_radius hidden " border top-left radius
border-top-left-radius: `^px;
XPT bd_shadow hidden " box shadow
XSET color=Trigger("color")
box-shadow: `^`inset?^` `horizontal?`px^` `vertical?`px^` `blurradius?`px^ `color^;
XPT bd_style hidden " border style
border-style: `:bd_style_:^;
XPT bd_spacing hidden " border spacing
border-spacing: `length1^ `length2^;
XPT bord_top alias=_chooseXSET
XSET $width=Trigger("bd_top_width")
XSET $style=Trigger("bd_top_style")
XSET $color=Trigger("bd_top_color")
XSET $border-top=Trigger("bd_top")
XSET $right radius=Trigger("bd_top_right_raduis")
XSET $left radius=Trigger("bd_top_left_radius")
XPT bord_right alias=_chooseXSET
XSET $width=Trigger("bd_right_width")
XSET $style=Trigger("bd_right_style")
XSET $color=Trigger("bd_right_color")
XSET $border-right=Trigger("bd_right")
XPT bord_bottom alias=_chooseXSET
XSET $width=Trigger("bd_bottom_width")
XSET $style=Trigger("bd_bottom_style")
XSET $color=Trigger("bd_bottom_color")
XSET $border-bottom=Trigger("bd_bottom")
XSET $right radius=Trigger("bd_bottom_right_radius")
XSET $left radius=Trigger("bd_bottom_left_radius")
XPT bord_left alias=_chooseXSET
XSET $width=Trigger("bd_left_width")
XSET $style=Trigger("bd_left_style")
XSET $color=Trigger("bd_left_color")
XSET $border-left=Trigger("bd_left")
XPT bord alias=_chooseXSET
XSET $left=Trigger("bord_left")
XSET $right=Trigger("bord_right")
XSET $bottom=Trigger("bord_bottom")
XSET $top=Trigger("bord_top")
XSET $width=Trigger("bd_width")
XSET $style=Trigger("bd_style")
XSET $color=Trigger("bd_color")
XSET $collapse {no effect}=Trigger("bd_collaspe")
XSET $image=Trigger("bd_image")
XSET $radius=Trigger("bd_radius")
XSET $shadow=Trigger("bd_shadow")
XSET $spacing {no effect}=Trigger("bd_spacing")
XSET $border=Trigger("bd")
..XPT

" font
XPT font_family " font family
font-family: `family_name^ `generic_name^ inherit;
XPT font_size setting=_chooseXSET " font size
XSET $xx-small=xx-small
XSET $x-small=x-small
XSET $small=small
XSET $medium=medium
XSET $large=large
XSET $x-large=x-large
XSET $xx-large=xx-large
XSET $smaller=smaller
XSET $larger=larger
XSET $inherit=inherit
XSET $`length^=`length^px
font-size: `function^;
XPT font_size_adjust setting=_chooseXSET " font size adjust
XSET $none=none
XSET $inherit=inherit
XSET $`number^=`number^
font-size-adjust: `function^
XPT font_stretch setting=_chooseXSET " font stretch
XSET $normal=normal
XSET $wider=wider
XSET $narrower=narrower
XSET $ultra-condensed=ultra-condensed
XSET $extra-condensed=extra-condensed
XSET $condensed=condensed
XSET $semi-condensed=semi-condensed
XSET $semi-expanded=semi-expanded
XSET $expanded=expanded
XSET $extra-expanded=extra-expanded
XSET $ultra-expanded=ultra-expanded
XSET $inherit=inherit
font-stretch: `function^;
XPT font_style setting=_chooseXSET " font style
XSET $normal=normal
XSET $italic=italic
XSET $oblique=oblique
XSET $inherit=inherit
font-style: `function^;
XPT font_variant setting=_chooseXSET " font variant
XSET $normal=normal
XSET $small-caps=small-caps
XSET $inherit=inherit
font-variant: `function^;
XPT font_weight setting=_chooseXSET " font weight
XSET $normal=normal
XSET $bold=bold
XSET $bolder=bolder
XSET $lighter=lighter
XSET $100=100
XSET $200=200
XSET $300=300
XSET $400=400
XSET $500=500
XSET $600=600
XSET $700=700
XSET $800=800
XSET $900=900
XSET $inherit=inherit
font-weight: `function^;
XPT fon alias=_chooseXSET
XSET $font=Trigger("font")
XSET $family=Trigger("font_family")
XSET $size=Trigger("font_size")
XSET $size adjust=Trigger("font_size_adjust")
XSET $stretch=Trigger("font_stretch")
XSET $style=Trigger("font_style")
XSET $variant=Trigger("font_variant")
XSET $weight=Trigger("font_weight")
..XPT

" Box model
XPT bm_clear " clear
XSET clear=Embed(pickL("s", ["left", "right", "both", "none"]))
clear: `clear^;
XPT bm_display " display
XSET display=Embed(pickL("s", ["none", "inline", "block", "inline-block", "list-item", "run-in", "compact", "table", "inline-table", "table-row-group", table-header-group", "table-footer-group", "table-row", "table-column-group", "table-column", "table-cell", "table-caption", "ruby", "ruby-base", "ruby-text", "ruby-base-group", "ruby-text-group"]))
display: `display^;
XPT bm_float " float
XSET float=Embed(pickL("s", ["left", "right", "none"]))
float: `float^;
XPT bm_height " height
XSET height=Embed(pickL("s", ["`length^", "auto", "`%^"]))
height: `height^;
XPT bm_max_height synonym=bm_height_max " max height
XSET max-height=Embed(pickL("s", ["`length^", "none", "`%^"]))
max-height: `max-height^;
XPT bm_max_width synonym=bm_width_max " max width
XSET max-width=Embed(pickL("s", ["`length^", "none", "`%^"]))
max-width: `max-width^;
XPT bm_min_height synonym=bm_height_min " min height
XSET min-height=Embed(pickL("s", ["`length^", "none", "`%^", "inherit"]))
min-height: `min-height^;
XPT bm_min_width synonym=bm_width_min " min width
XSET min-width=Embed(pickL("s", ["`length^", "none", "`%^", "inherit"]))
min-width: `min-width^;
XPT bm_width " width
XSET width=Embed(pickL("s", ["`length^", "auto", "`%^"]))
width: `width^;
XPT bm_margin_bottom " margin bottom
XSET margin-bottom=Embed(pickL("s", ["auto","`length^", "`%^"]))
margin-bottom: `margin-bottom^;
XPT bm_margin_left  setting=bm_margin_bottom " margin left
margin-left: `margin-bottom^;
XPT bm_margin_right setting=bm_margin_bottom " margin right
margin-right: `margin-bottom^;
XPT bm_margin_top setting=bm_margin_bottom " margin top
margin-top: `margin-bottom^;
XPT bm_margin " margin
margin: `m_top^ `m_right^ `m_bot^ `m_lef^;
XPT bm_padding_bottom " padding bottom
XSET opt=Embed(pickL("s", ["`length^", "`%^"]))
padding-bottom: `opt^;
XPT bm_padding_left alias=bm_padding_bottom " padding left
padding-left: `opt^;
XPT bm_padding_right alias=bm_padding_bottom " padding right
padding-right: `opt^;
XPT bm_padding_top alias=bm_padding_bottom " padding top
padding-top: `opt^;
XPT bm_padding " padding
padding: `pad_top^ `pad_right^ `pad_bottom^ `pad_left^;
XPT bm_marquee_direction " marquee direction
XSET opt=Embed(pickL("s", ["forward", "reverse"]))
marquee-direction: `opt^;
XPT bm_marquee_loop " marquee loop
XSET opt=Embed(pickL("s", ["infinite", "`integer^"]))
marquee-loop: `opt^;
XPT bm_marquee_play_count " marquee play count
XSET opt=Embed(pickL("s", ["infinite", "`integer^"]))
marquee-play-count: `opt^;
XPT bm_marquee_speed " marquee speed
XSET opt=Embed(pickL("s", ["slow", "normal", "fast"]))
marquee-speed: `opt^;
XPT bm_marquee_style " marquee style
XSET opt=Embed(pickL("s", ["scroll", "slide", "alternate"]))
marquee-style: `opt^;
XPT bm_overflow " overflow
XSET opt=Embed(pickL("s", ["visible", "hidden", "scroll", "auto", "no-display", "no-content"]))
overflow: `opt^ `overflowX^ `overflowY^;
XPT bm_overflow_style " overflow style
XSET opt=Embed(pickL("s", ["auto", "marquee-line", "marquee-block"]))
overflow-style: `opt^;
XPT bm_overflow_x " overflow x
XSET opt=Embed(pickL("s", ["visible", "hidden", "scroll", "auto", "no-display", "no-content"]))
overflow-x: `opt^;
XPT bm_overflow_y alias=bm_overflow_x " overflow y
overflow-y: `opt^;
XPT bm_rot " rotation
rotation: `angle^;
XPT bm_rotation_point " rotation point
rotation-point: `position^;
XPT bm_visibility " visibility
XSET opt=Embed(pickL("s", ["visible", "hidden", "collapse"]))
visibility: `opt^;
XPT bm_box_flex " box flex
box-flex: `num^;
XPT bm_box_orient " box orient
XSET opt=Embed(pickL("s", ["horizontal", "vertical"]))
box-orient: `opt^;
XPT bm_box_direction " box direction
XSET opt=Embed(pickL("s", ["normal", "reverse"]))
box-direction: `opt^;
XPT bm_flex_box " flex box
flex-box: `num^;
..XPT

" text
XPT text_direction " direction
XSET opt=Embed(pickL("s", ["ltr", "rtl", "inherit"]))
direction: `opt^;
XPT text_hanging_puntuation " hanging punctuation
XSET opt=Embed(pickL("s", ["none", "`start^ `end^ `endEdge^"]))
hanging-punctuation: `opt^;
XPT text_letter_spacing " letter spacing
XSET opt=Embed(pickL("s", ["normal", "`length^", "`%^"]))
letter-spacing: `opt^;
XPT text_punctuation_trim " punctuation trim
XSET opt=Embed(pickL("s", ["none", "`start^ `end^ `adjacent^"]))
punctuation-trim: `opt^;
XPT text_align " text align
XSET opt=Embed(pickL("s", ["start", "end", "left", "right", "center", "justify"]))
text-align: `opt^;
XPT text_align_last alias=text_align " text align last
text-align-last: `opt^;
XPT text_decoration " text decoration

XSET opt=Embed(pickL("s", ["none", "underline", "overline", "line-through", "blink"]))
text-decoration: `opt^;
XPT _s1 hidden
XSET op|pre=Echo("op")
XSET op2|pre=Echo("op2")
XSET op=Embed(pickL("s", ["accent", "dot", "circle", "disc"]))
XSET op2=Embed(pickL("s", ["before", "after"]))
`op^ `op2^
XPT text_emphasis " text emphasis
XSET text_emphasis=Embed(pickL("s", ["none", "`:_s1:^"]))
text-emphasis: `text_emphasis^;
XPT text_indent " text indent
XSET opt=Embed(pickL("s", ["`length^", "`%^"]))
text-indent: `opt^;
XPT text_justify " text justify
XSET text_justify=Embed(pickL("s", ["auto", "inter-word", "inter-ideograph", "inter-cluster", "distribute", "kashida", "tibetan"]))
text-justify: `text_justify^;
XPT text_outline " text outline
XSET text_outline=Embed(pickL("s", ["none", "`color^ `length^"]))
text-outline: `text_outline^;
XPT text_shadow " text shadow
text-shadow: `horizontal^px `vertical^px ``blur?`px ^`color^;
XPT text_trans " text transform
XSET text_trans=Embed(pickL("s", ["none", "capitalize", "uppercase", "lowercase"]))
text-transform: `text_trans^;
XPT text_wrap " text wrap
XSET text_wrap=Embed(pickL("s", ["normal", "unrestricted", "none", "suppress"]))
text-wrap: `text_wrap^;
XPT text_unicode_bidi " unicode bidi
XSET text_unicode_bidi=Embed(pickL("s", ["normal", "embed", "bidi-override"]))
unicode-bidi: `text_unicode_bidi^;
XPT text_white_space setting=_chooseXSET " whitespace
XSET $normal collapse whitespace and wraps=normal
XSET $pre does not collapse whitespace nor wraps=pre
XSET $nowrap collapse whitespace but does not wrap=nowrap
XSET $pre-wrap does not collapse whitespace but wraps=pre-wrap
XSET $pre-line collapse all whitespace except breaks then wraps=pre-line
white-space: `function^;
XPT text_whit_space_collapse " whitespace collapse
XSET text_whit_space_collapse=Embed(pickL("s", ["preserve", "collapse", "preserve-breaks", "discard"]))
white-space-collapse: `text_whit_space_collapse^;
XPT text_word_break " word break
XSET text_word_break=Embed(pickL("s", ["normal", "keep-all", "loose", "break-strict", "break-all"]))
word-break: `text_word_break^;
XPT text_word_spacing " word spacing
XSET text_word_spacing=Embed(pickL("s", ["normal", "`length^", "`%^"]))
word-spacing: `text_word_spacing^;
XPT text_word_wrap " word wrap
XSET text_word_wrap=Embed(pickL("s", ["normal", "break-word"]))
word-wrap: `text_word_wrap^;
..XPT

" column
XPT col_count " column count
XSET opt=Embed(pickL("s", ["auto", "`number^"]))
column-count: `opt^;
XPT col_fill " column fill
XSET opt=Embed(pickL("s", ["auto", "balance"]))
column-fill: `opt^;
XPT col_gap " column gap
XSET opt=Embed(pickL("s", ["normal", "`length^"]))
column-gap: `opt^;
XPT col_rule_width " column rule width
XSET opt=Embed(pickL("s", ["thin", "medium", "thick", "`length^"]))
column-rul-width: `opt^;
XPT col_rule_style " column rule style
column-rule-style: `:bd_style:^;
XPT col_rule_color " column rule color
column-rule-color: `color^;
XPT col_rule " column rule
column-rule: `:col_rul_w:^ `:col_rul_s:^ `:col_rul_c:^;
XPT col_width " column width
XSET opt=Embed(pickL("s", ["auto", "`length^"]))
column-width: `opt^;
XPT col " columns
columns: `:col_w:^ `:col_count:^;
XPT col_span " column span
XSET opt=Embed(pickL("s", ["1", "all"]))
column-span: `opt^;
..XPT

" color
XPT co " color
XSET opt=Embed(pickL("s", ["inherit", "`color^"]))
color: `opt^;
XPT co_opacity " opacity
XSET opt=Embed(pickL("s", ["inherit", "`number^"]))
opacity: `opt^;
XPT rgba "specify color using rgba function
rgba(`red^, `green^, `blue^, `opacity^)
..XPT

" template layout
XPT tmp_box_align " box align
XSET opt=Embed(pickL("s", ["start", "end", "center", "baseline", "stretch"]))
box-align: `opt^;
XPT tmp_box_direction " box direction
XSET opt=Embed(pickL("s", ["normal", "reverse"]))
box-direction: `opt^;
XPT tmp_box_flex " box flex
box-flex: `number^;
XPT tmp_box_flex_group " box flex group
box-flex-group: `integer^;
XPT tmp_box_lines " box lines
XSET opt=Embed(pickL("s", ["single", "multiple"]))
box-lines: `opt^;
XPT tmp_box_orient " box orient
XSET opt=Embed(pickL("s", ["horizontal", "vertical", "inline-axis", "block-axis"]))
box-orient: `opt^;
XPT tmp_box_pack " box pack
XSET opt=Embed(pickL("s", ["start", "end", "center", "justify"]))
box-pack: `opt^;
XPT tmp_box_sizing " box sizing
XSET opt=Embed(pickL("s", ["content-box", "padding-box", "border-box", "margin-box"]))
box-sizing: `opt^;
XPT tmp_tab_side " tab side
XSET opt=Embed(pickL("s", ["top", "bottom", "left", "right"]))
tab-side: `opt^;
..XPT

" table
XPT tab_caption_side " caption side
XSET opt=Embed(pickL("s", ["top", "bottom", "left", "right"]))
caption-side: `opt^;
XPT tab_empty_cells " empty cells
XSET opt=Embed(pickL("s", ["show", "hide"]))
empty-cells: `opt^;
XPT tab_layout " table layout
XSET opt=Embed(pickL("s", ["auto", "fixed"]))
table-layout: `opt^;
..XPT

" list and markers
XPT list_style_type " list style type
XSET opt=Embed(pickL("s", ["none", "astericks", "box", "check", "circle", "diamond", "disc", "hyphen", "square", "decimal", "decimal-leading-zero", "lower-roman", "upper-roman", "lower-alpha", "upper-alpha", "lower-greek", "lower-latin", "upper-latin", "hebrew", "armenian", "georgian", "cjk-ideographic", "hiragana", "katakana", "hiragana-iroha", "katakana-iroha", "footnotes"]))
list-style-type: `opt^;
XPT list_style_position " list style position
XSET opt=Embed(pickL("s", ["inside", "outside"]))
list-style-position: `opt^;
XPT list_style_image " list style image
XSET opt=Embed(pickL("s", ["none", "`url^"]))
list-style-image: `opt^;
XPT list_style " list style
list-style: `:list_style_type:^ `:list_style_position:^ `:list_style_image:^;
XPT list_marker_offset " marker offset
XSET opt=Embed(pickL("s", ["auto", "`length^"]))
marker-offset: `opt^;
..XPT

" animation
XPT anim_name " animation name
XSET opt=Embed(pickL("s", ["none", "IDENT"]))
-webkit-animation-name: `opt^;
animation-name: `opt^;
XPT anim_duration " animation duration
-webkit-animation-duration: `time^;
animation-duration: `time^;
XPT anim_delay " animation delay
animation-delay: `time^;
XPT anim_direction " animation direction
XSET opt=Embed(pickL("s", ["normal", "alternate"]))
animation-direction: `opt^;
XPT anim_iteration_count " animation iteration count
XSET opt=Embed(pickL("s", ["inherit", "`number^"]))
-webkit-animation-iteration-count: `opt^;
animation-iteration-count: `opt^;
XPT anim_play_state " animation play state
XSET opt=Embed(pickL("s", ["running", "paused"]))
animation-play-state: `opt^;
XPT anim_timing_function " animation timing function
XSET opt=Embed(pickL("s", ["ease", "linear", "ease-in", "ease-out", "ease-in-out", "cubic-bezier (0, 0, 0.35, 1)"]))
animation-timing-function: `opt^;
XPT anim " animation
animation: `anim_name^ `anim_dur^ `anim_tim_f^ `anim_del^ `anim_iter_c^ `anim_dir^;
..XPT

" transition
XPT trans_delay " transition delay
transition-delay: `time^;
XPT trans_duration " transition duration
-webkit-transition-duration: `time^;
transition-duration: `time^;
XPT trans_property " transition property
XSET opt=Embed(pickL("s", ["none", "all","color", "border", "-webkit-transform", "width"]))
-webkit-transition-property: `opt^;
transition-property: `opt^;
XPT trans_timing_fuction " transition timing function
XSET opt=Embed(pickL("s", ["ease", "linear", "ease-in", "ease-out", "ease-in-out", "cubic-bezier (0, 0, 0.35, 1)"]))
-webkit-transition-timing: `opt^;
transition-timing-function: `opt^;
XPT trans " transition
XSET transition_property|pre=Echo("transition_property")
XSET transition_property=Embed(pickL("s", ["none", "all","color", "border", "-webkit-transform", "width"]))
XSET transition_timing_function|pre=Echo("transition_timing_function")
XSET transition_timing_function=Embed(pickL("s", ["ease", "linear", "ease-in", "ease-out", "ease-in-out", "cubic-bezier (0, 0, 0.35, 1)"]))
-webkit-transition: `transition_property^ `transition_duration^ `transition_timing_function^;
-o-transition: `transition_property^ `transition_duration^ `transition_timing_function^;
-moz-transition: `transition_property^ `transition_duration^ `transition_timing_function^;
transition: `transition_property^ `transition_duration^ `transition_timing_function^;
..XPT

" grid positioning
XPT grid_colunns " grid columns
XSET opt=Embed(pickL("s", ["none", "inherit"]))
grid-columns: `opt^;
XPT grid_rows " grid rows
XSET opt=Embed(pickL("s", ["none", "inherit"]))
grid-rows: `opt^;
..XPT

" outline
XPT out_color " outline color
XSET opt=Embed(pickL("s", ["`color^", "invert"]))
outline-color: `opt^;
XPT out_style " outline style
XSET opt=Embed(pickL("s", ["none", "dotted", "dashed", "solid", "double", "groove", "ridge", "inset", "outset"]))
outline-style: `opt^;
XPT out_width " outline width
XSET opt=Embed(pickL("s", ["thin", "medium", "thick", "`length^"]))
outline-width: `opt^;
XPT out_offset " outline offset
XSET opt=Embed(pickL("s", ["inherit", "`length^"]))
outline-color: `opt^;
XPT out " outline
outline: `:out_col:^ `:out_sty:^ `:out_wid:^;
..XPT

" generated content
XPT gc_bookmark_label " bookmark label
XSET opt=Embed(pickL("s", ["content", "`attr^", "`string^"]))
bookmark-label: `opt^;
XPT gc_bookmark_lavel " bookmark level
XSET opt=Embed(pickL("s", ["none", "`integer^"]))
bookmark-level: `opt^;
XPT gc_bookmark_target " bookmark target
XSET opt=Embed(pickL("s", ["self", "`attr^", "`uri^"]))
bookmark-target: `opt^;
XPT gc_content " content
XSET opt=Embed(pickL("s", ["normal", "none", "inhibit", "`uri^"]))
content: `opt^;
XPT gc_content_increment " content increment
XSET opt=Embed(pickL("s", ["none", "`id_number^"]))
content-increment: `opt^;
XPT gc_counter_reset alias=gc_content_increment " counter reset
counter-reset: `opt^;
XPT gc_crop " crop
XSET opt=Embed(pickL("s", ["auto", "`shape^"]))
crop: `opt^;
XPT gc_display " display
XSET opt=Embed(pickL("s", ["normal", "none","initial","inherit","unset","run-in","list-item","inline-list-item", "-webkit-box, -moz-box, -o-box, box","flexbox", "block","inline","inline-block","table","inline-tabel","table-row-group","table-header-group","table-footer-group","table-row","table-column-group","table-column","table-cell","table-caption","flex","inline-flex",]))
display: `opt^;
XPT gc_float_offset " float offset
float-offset: `length1^ `length2^;
XPT gc_hyphenate_after " hyphenate after
XSET opt=Embed(pickL("s", ["auto", "`integer^"]))
hyphenate-after: `opt^;
XPT gc_hyphenate_before alias=gc_hyphenate_after " hyphenate before
hyphenate-before: `opt^;
XPT gc_hyphenate_character " hyphenate character
XSET opt=Embed(pickL("s", ["auto", "`string^"]))
hyphenate-character: `opt^;
XPT gc_hyphenate_lines " hyphenate lines
XSET opt=Embed(pickL("s", ["no-limit", "`integer^"]))
hyphenate-lines: `opt^;
XPT gc_hyphenate_resource " hyphenate resource
XSET opt=Embed(pickL("s", ["none", "`uri^"]))
hyphenate-resource: `opt^;
XPT gc_hyphes " hyphens
XSET opt=Embed(pickL("s", ["auto", "none", "manual"]))
hyphens: `opt^;
XPT gc_image_resolution " image resolution
XSET opt=Embed(pickL("s", ["normal", "auto", "`dpi^"]))
image-resolution: `opt^;
XPT gc_marks " marks
XSET opt=Embed(pickL("s", ["crop or cross", "none"]))
marks: `opt^;
XPT gc_move_to " move to
XSET opt=Embed(pickL("s", ["normal", "here"]))
hyphenate-after: `opt^ `id^;
XPT gc_page_policy " page policy
XSET opt=Embed(pickL("s", ["start", "first", "last"]))
page-policy: `opt^;
XPT gc_quotes " quotes
XSET opt=Embed(pickL("s", ["none", "`string1^ `string2^ `string3^ `string4^"]))
quotes: `opt^;
XPT gc_string_set " string set
string-set: `id^ `content_list^;
XPT gc_text_replace " text replace
string-set: none `str^ `str_rep^;

" positioning
XPT pos_bottom " bottom
XSET opt=Embed(pickL("s", ["auto", "`%^", "`length^"]))
bottom: `opt^;
XPT pos_clip " clip
XSET opt=Embed(pickL("s", ["auto", "`shape^"]))
clip: `opt^;
XPT pos_left alias=pos_bottom " left
left: `opt^;
XPT pos_pos " position
XSET opt=Embed(pickL("s", ["static", "relative", "absolute", "fixed"]))
position: `opt^;
XPT pos_right alias=pos_bottom " right
right: `opt^;
XPT pos_top alias=pos_bottom " top
top: `opt^;
XPT pos_z_index " z index
XSET opt=Embed(pickL("s", ["auto", "`number^"]))
z-index: `opt^;
..XPT

XPT @ "at rule
XSET mediatype=ChooseStr("all", "braille", "embossed", "tty", "print", "screen", "projection", "tv", "aural", "handheld")
XSET mediatypes\.\..post=ReturnIfEq("mediatypes..", ' ' . '`mediatype^` `MORE_mediaType...{{^, `mediatype^` `MORE_mediaType...^`}}^')
XSET $_url_=ACMB\({'\V\^\zsu\\$':"url('`^')` `mediatypes..^",    "\\V\\^\\zs'\\\\$":"'`^'` `mediatypes..^",
XSET $_url_+=      '\V\^\zs"\\$':'"`^"` `mediatypes..^'})
XSET url.ontype=ZS($_url_)
XSET $_atRule_=ACMB\({'\V\^\zsi\\$':'import `url^',    '\V\^\zsm\\$':'media `mediatype^ {\n    `cursor^\n}',
XSET $_atRule_+=})
XSET rule.ontype=ZS($_atRule_)
@`rule^