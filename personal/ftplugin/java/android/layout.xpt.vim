XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.layout_snip = {
\ "Implement layout in code and assign views to it"     : "$lay_in_code"
\}

XPT _layout hidden setting=_cx
XSET $padding=android:padding="`@dimen/standard_border^"
XSET $dummy=text
XSET layNodes=Trigger("view")
XSET layAttr=Next("")
<`name^ xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="`layout_width^"
    android:layout_height="`layout_height^"
    `layAttr^` `RELATIVELAYOUT NODE ALIGNMENT SETTINGS{{^
`rel_set^Trigger("_rel_lay_node_set")^`}}^` `GRIDLAYOUT NODE GRAVITY SETTINGS{{^
`rel_set^Trigger("_grid_lay_node_set")^`}}^
    `Snippet("_chooseXSET")^>
    `layNodes^
</`name^>

XPT merge alias=_layout dyn
XSET name=merge

XPT layout_include
<include android:id="@+id/`my_action_bar^" layout="@layout/`actionbar^"/>

XPT layout alias=_chooseXSET
XSET $LinearLayout=Trigger("layout_linear")
XSET $RelativeLayout=Trigger("layout_relative")
XSET $GridLayout=Trigger("layout_grid")
XSET $FrameLayout=Trigger("layout_frame")
XSET $include=Trigger("layout_include")

XPT layout_frame alias=_layout dyn
XSET name=FrameLayout
XSETm layAttr
android:id="@+id/`ui_container^"
XSETm END

XPT layout_grid dyn alias=_layout
XSET name=GridLayout
XSETm layAttr
android:orientation="`orientation^"
XSETm END

XPT layout_linear dyn alias=_layout
XSET name=LinearLayout
XSETm layAttr
android:orientation="`orientation^"
XSETm END

XPT layout_relative dyn alias=_layout
XSET name=RelativeLayout

XPT layout_snip alias=_snip
XSETm $lay_in_code
LinearLayout ll = new LinearLayout(this);
ll.setOrientation(LinearLayout.VERTICAL);
TextView myTextView = new TextView(this);
EditText myEditText = new EditText(this);
myTextView.setText("Enter Text Below");
myEditText.setText("Text Goes Here!");
int lHeight = LinearLayout.LayoutParams.MATCH_PARENT;
int lWidth = LinearLayout.LayoutParams.WRAP_CONTENT;
ll.addView(myTextView, new LinearLayout.LayoutParams(lHeight, lWidth));
ll.addView(myEditText, new LinearLayout.LayoutParams(lHeight, lWidth));
setContentView(ll);
XSETm END