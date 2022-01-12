XPTemplate priority=sub

XPT view_button alias=_view dyn
XSET name=Button
XSETm viewAttr
android:text="@string/`cancel_button_text^"
XSETm END
XSET $layout_weight=android:layout_weight="`1^"
XSET $sdf=dfsa