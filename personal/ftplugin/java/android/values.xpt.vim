XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.values_snip = {
\  "Convert a format string which you have its HTML tags escaped to a styled character sequence." : "String rString = getString\\\(R.string.stop_message);\nString fString = String.format\\\(rString, \"Collaborate and listen.\");\nCharSequence styledString = Html.fromHtml\\\(fString);",
\  "Access the correct plural in code" : "Resources resources = getResources\\\();\nString unicornStr = resources.getQuantityString\\\(R.plurals.unicornCount, unicornCount, unicornCount);",
\}

XPT resources
XSET resNodes.def=Trigger("resources_nodes")
`:xml_head:^
<resources>
    `resNodes^
    `...^`resNodes^
`...^
</resources>

XPT resources_nodes alias=_chooseXSET
XSET $string=<string name="`app_name^">`To Do List^</string>
XSETm $plurals
<plurals name="`androidPlural^">
    <item quantity="one">`One android^</item>
    <item quantity="other">`%d androids^</item>
</plurals>
XSETm END
XSET $color=<color name="`app_background^">`#FF0000FF^</color>
XSET $dimension=<dimen name="`default_border^">`5px^</dimen>
XSETm $string-array
<string-array name="`string_array^">
    <item>`Item^</item>
    `item...^<item>`Item^</item>
`item...^
</string-array>
XSETm END
XSETm $array
<array name="`integer_array^">
    <item>`Item^</item>
    `item...^<item>`Item^</item>
`item...^
</string-array>
XSETm END
XSETm $create style
<style name="`base_text^"` `INHERITS ANOTHER STYLE?...{{^ parent="`base_text^"`}}^>
    <item name="android:textSize">14sp</item>
    <item name="android:textColor">#111</item>
</style>
XSETm END

XPT values_snip alias=_snip
