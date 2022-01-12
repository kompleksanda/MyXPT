XPTemplate priority=sub

let s:f = g:XPTfuncs()
let s:f.animator_snip = {
\ "Changes the opacity"   : "$anim_opac",
\ "example shows an animation set that spins the target 360 degrees while it shrinks and fades out" : "$anim_sh_fd",
\}
let s:f.anim_frameByFrame_snip = {
\ "A simple animation that cycles through a series of bitmap resources, displaying each one for half a second."   : "$anim_fbf",
\ "Play it!": "$fbf_play",
\}

XPT _animator hidden
<`name^ xmlns:android="http://schemas.android.com/apk/res/android"
    `anmtAttr^
/>

XPT animator alias=_chooseXSET
XSET $objectAnimator=Trigger("animator_object")

XPT animator_object alias=_animator
XSET name=Next("objectAnimator")
XSETm anmtAttr
android:propertyName="`alpha^"
android:duration="`1000^"
android:valueFrom="`0.0^"
android:valueTo="`1.0^"
XSETm END

XPT animation_list
<animation-list
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:oneshot="false">
    <item android:drawable="@drawable/`android1^" android:duration="`500^" />
    `item...^<item android:drawable="@drawable/`android2^" android:duration="`500^" />
`item...^
</animation-list>


XPT animator_snip alias=_snip
XSETm $anim_opac
<objectAnimator xmlns:android="http://schemas.android.com/apk/res/android"
	android:propertyName="alpha"
	android:duration="1000"
	android:valueFrom="0.0"
	android:valueTo="1.0"
/>
XSETm END
XSETm $anim_sh_fd
<set xmlns:android="http://schemas.android.com/apk/res/android"
	android:interpolator="@android:anim/accelerate_interpolator">
	<rotate
		android:fromDegrees="0"
		android:toDegrees="360"
		android:pivotX="50%"
		android:pivotY="50%"
		android:startOffset="500"
		android:duration="1000" />
	<scale
		android:fromXScale="1.0"
		android:toXScale="0.0"
		android:fromYScale="1.0"
		android:toYScale="0.0"
		android:pivotX="50%"
		android:pivotY="50%"
		android:startOffset="500"
		android:duration="500" />
	<alpha
		android:fromAlpha="1.0"
		android:toAlpha="0.0"
		android:startOffset="500"
		android:duration="500" />
</set>
XSETm END

XPT anim_frameByFrame_snip alias=_snip
XSETm $anim_fbf
<animation-list
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:oneshot="false">
    <item android:drawable="@drawable/android1" android:duration="500" />
    <item android:drawable="@drawable/android2" android:duration="500" />
    <item android:drawable="@drawable/android3" android:duration="500" />
</animation-list>
XSETm END
XSETm $fbf_play
//Assign the resource to the background should be done within the onCreate handler.
ImageView androidIV = (ImageView)findViewById(R.id.iv_android);
androidIV.setBackgroundResource(R.drawable.android_anim);
AnimationDrawable androidAnimation = (AnimationDrawable) androidIV.getBackground();
/*Within this handler the animation is not fully attached to the window, so the animations can’t be
started; instead, this is usually done as a result to user action (such as a button press) or within the
onWindowFocusChanged handler.*/
androidAnimation.start();
XSETm END