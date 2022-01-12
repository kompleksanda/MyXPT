XPTemplate priority=sub

XPT manifest
XSET maniAttr.def=Next("")
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="`com.paad.myapp^"
    android:versionCode="`1^"
    android:versionName="`0.9 Beta^"
    android:installLocation="`preferExternal^">
    `maniAttr^ >
    `maniNode^Trigger("manifest_nodes")^
</manifest>

XPT _uses_configuration setting=_cx hidden
XSET $reqFiveWayNavSpecify true for this attribute if you require an input device capable of navigating up, down, left, and right and of clicking the current selection Thisincludes both trackballs and directional pads (D-pads)=android:reqFiveWayNav="true"
XSET $reqHardKeyboard — If your application requires a hardware keyboard, specify true=android:reqHardKeyboard="true"
XSET $reqKeyboardType — Lets you specify the keyboard type as one of nokeys, qwerty,twelvekey, or undefined.=android:reqKeyboardType="`reqKeyboardType^ChooseStr("nokeys","qwerty","twelvekey","undefined")^"
XSET $reqNavigation — Specify the attribute value as one of nonav, dpad, trackball,wheel, or undefined as a required navigation device=android:reqNavigation="`reqNavigation^ChooseStr("nonav","dpad","trackball","wheel","undefined")^"
XSET $reqTouchScreen — Select one of notouch, stylus, finger, or undefined to specifythe required touchscreen input=android:reqTouchScreen="`reqTouchScreen^ChooseStr("notouch","stylus","finger","undefined")^"
XSET uses_conf=Snippet("_chooseXSET")
<uses-configuration
    `uses_conf^
/>

XPT _supports-screen hidden alias=_cx
XSET $smallScreens=android:smallScreens="false"
XSET $normalScreens=android:normalScreens="false"
XSET $largeScreens=android:largeScreens="false"
XSET $xlargeScreens=android:xlargeScreens="false"
XSET $requiresSmallestWidthDp=android:requiresSmallestWidthDp="`480^"
XSET $compatibleWidthLimitDp=android:compatibleWidthLimitDp="`600^"
XSET $largestWidthLimitDp=android:largestWidthLimitDp="`720^"
XSET supports_screen=Snippet("_chooseXSET")
<supports-screens
    `supports_screen^ />

XPT application_manifest hidden
XSET appAttr=Next("")
<application android:icon="`@drawable/icon^"
    android:logo="`@drawable/logo^"
    android:theme="`@android:style/Theme.Light^"
    android:name="`.MyApplicationClass^"
    android:debuggable="`true^"
    `appAttr^ >
    `appNodes^Trigger("applicaion_nodes")^
</application>

XPT uses_feature
XSET nfc=ChooseStr("nfc","telephony")
<uses-feature android:name="android.hardware.`nfc^"` `NOT REQUIRED?...{{^
    android:required="false"`}}^/>
`more^BuildSnippet("uses_feature")^^

XPT manifest_nodes alias=_chooseXSET
XSETm $uses sdk
<uses-sdk android:minSdkVersion="`6^"
    android:targetSdkVersion="`15^"/>
XSETm END
XSET $uses-configuration specifies each combination of input mechanisms supported by your application.=Trigger("_uses_configuration")
XSET $uses-feature=Trigger("uses_feature")
XSET $supports-screens=Trigger("_supports-screen")
XSETm $supports-gl-texture
<supports-gl-texture android:name="`GL_OES_compressed_ETC1_RGB8_texture^" />
XSETm END
XSET $uses-permission
<uses-permission android:name="android.permission.`ACCESS_FINE_LOCATION^/>
`more^GetVar("$uses-permission")^^
XSETm END
XSETm $permission
<permission android:name="`com.paad.DETONATE_DEVICE^"
    android:protectionLevel="`dangerous^"
    android:label="`Self Destruct^"
    android:description="`@string/detonate_description^">
</permission>
XSETm END
XSETm $instrumentation Instrumentation classes provide a test framework for your application components at run time
<instrumentation android:label="`My Test^"
    android:name="`.MyTestClass^"
    android:targetPackage="`com.paad.apackage^">
</instrumentation>
XSETm END
XSET $application A manifest can contain only one application node=Trigger("application_manifest")

XPT _intent_fil hidden
XSETm $data!!
scheme=android:scheme="`http/content^"
host=android:host="`blog.radioactiveyak.com^"
mimeType=android:mimeType="`vnd.earthquake.cursor.item/*^"
XSETm END
XSET LAUNCHER=ChooseStr("ALTERNATIVE","SELECTED_ALTERNATIVE","BROWSABLE","DEFAULT","HOME","LAUNCHER")
XSETm $body
<action android:name="`android.intent.action.MAIN^" />
`action...^<action android:name="`android.intent.action.MAIN^" />
`action...^
<category android:name="android.intent.category.`LAUNCHER^" />
`category...^<category android:name="android.intent.category.`LAUNCHER^" />
`category...^
`data...^<data `data!!^
`dataNodes...^`data!!^
`dataNodes...^/>
`data...^
XSETm END
XSET intFilBody=Next($body)
<intent-filter` `LABEL...{{^ android:label="`@string/Nuke_From_Orbit^"`}}^>
    `intFilBody^
</intent-filter>
`Next^NextC(BuildSnippet("_intent_fil"))^^

XPT activity_manifest setting=_cx
XSET $_preValues_={"configoption":""}
XSET configoption=pickL("m",{"A SIM has been detected and the mobile country has changed":"mcc","A SIM has been detected and the mobile network code has changed":"mnc","The user has changed the device’s language settings.":"locale","The keyboard, d-pad, or other input mechanism has been exposed or hidden.":"keyboardHidden","The type of keyboard has changed":"keyboard","The user has changed the preferred font size":"fontScale","The global UI mode has changed":"uiMode","The screen has been rotated between portrait and landscape":"orientation","The screen layout has changed; typically occurs if a different screen has been activated.":"screenLayout","the available screen size has changed":"screenSize","occurs when the physical screen size has changed":"smallestScreenSize"},"|")
XSET $configChanges=android:configChanges="`configoption^"
XSET $dummy=text
<activity
    android:name="`.MyActivity^"
    android:label="`@string/app_name^"
    `Snippet("_chooseXSET")^>
    `intent^Trigger("_intent_fil")^
</activity>

XPT applicaion_nodes alias=_chooseXSET
XSET $activity=Trigger("activity_manifest")
XSETm $service
<service android:name="`.MyService^">
</service>
XSETm END
XSETm $provider
<provider android:name="`.MyContentProvider^"
    android:authorities="`com.paad.myapp.MyContentProvider^"/>
XSETm END
XSET $receiver=Trigger("receiver_manifest")
XSETm $uses-library
<uses-library android:name="`com.google.android.maps^"
    android:required="`false^"/>
XSETm END

XPT receiver_manifest
<receiver android:name="`.MyIntentReceiver^"` `EXPLICITY SPECIFY PERMISSION...{{^
    android:permission="`com.paad.MY_BROADCAST_PERMISSION^"`}}^>
    <intent-filter` `INCLUDE A PRIORITY...{{^
android:priority="`100^"`}}^>
        <action android:name="`com.paad.mybroadcastaction^" />
    </intent-filter>
</receiver>
