XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.text_snip = {
\ "get text"     : 'String newItem myEditText.getText\().toString\()',
\ "Set text"     : 'myEditText.setText\("`^");',
\}

XPT view_text dyn alias=_view
XSET name=TextView
XSETm viewAttr
android:text="@string/`hello^"
XSETm END
XSET $color=android:textColor="`@color/opaque_blue^"
XSET $background color=android:background="`@color/notepad_paper^"
XSET $text size=android:textSize="`16dp^"

XPT view_edittext dyn alias=view_text
XSET name=EditText
XSETm viewAttr
android:hint="@string/`addItemHint^"
XSETm END
XSET $text=android:text="@string/`hello^"
XSET $contentDescription=android:contentDescription="@string/`addItemContentDescription^"

XPT text_snip alias=_snip