XPTemplate priority=sub

XPT view_list alias=_view dyn
XSET name=ListView
XSETm viewAttr
XSETm END

XPT view_stub alias=_view dyn
XSET name=ViewStub
XSETm viewAttr
android:layout="@layout/`progress_overlay_panel^"
android:inflatedId="@+id/`download_progress_panel^"
XSETm END

XPT view_fragment alias=_view dyn
XSET name=fragment
XSETm viewAttr
android:name="`com.paad.weatherstation.MyListFragment^"
XSETm END

XPT _frame_view_set alias=_chooseXSET hidden
XSET $visibilty hide this fragment for this orientation=android:visibility="gone"
XSET $dummy=text

XPT view_frameLayout dyn alias=_view
XSET FRAGMENT_SETTING\.\..post=Trigger("_frame_view_set")
XSET name=FrameLayout
XSETm viewAttr
`FRAGMENT_SETTING..^
XSETm END