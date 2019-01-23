XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.AndroidTemplatesDict = {
\"PERMISSION"  :
\   { "DECLARING/ENFORCING" :
\     { "Declare a custom permission"   :  "$permission_custom",
\       "Enforce a custom permission"   :  "$permission_enforce"
\     }
\   },
\ "TELEPHONY"  :
\   {"MAKE IT REQUIRED HARDWARE FEATURE":"<uses-feature android:name=\"android.hardware.telephony\"\n\t\tandroid:required=\"true\"/>",
\   "Check for device support"          :  "$telephony_devSupport",
\   "Initiate phone call"               :  "$telephony_initCall",
\   "replace native dialer"             :  "$telephony_nativeDialer",
\   "TELPHONY PROP/PHONE STATE"   :
\      {"Read phone device details"    : "$telephony_propDevDetails",
\       "Read network details"         : "$telephony_propNetDetails",
\       "Read sim details"             : "$telephony_propSimDetails",
\       "Read conn & transfer state details":"$telephony_propConn"
\      }
\   },
\  "BLUETOOTH"  :
\       {"Read details/state"          : "$bluetooth_propDetails",
\        "Enabling bluetooth"          : "$bluetooth_enable",
\        "DISCOVERY"    :
\           {"Make device discoverable": "startActivityForResult\\(new Intent\\(BluetoothAdapter.ACTION_REQUEST_DISCOVERABLE), DISCOVERY_REQUEST);",
\            "Monitor discoverable request approval" : "$bluetooth_monDiscReq",
\            "Initiate Discovery process" : "{$bluetooth_prop}if (bluetooth.isEnabled\\())\n\tif (!bluetooth.isDiscovering\\()){ bluetooth.startDiscovery\\();}",
\           "Monitor changes in discovery process" : "$bluetooth_monDisc",
\            "Get Discoverd Devices in a list" : "$bluetooth_getDisc"
\           }
\       },
\ "AUDIO"   :
\    {"initialize audio for playback" : "$audio_initAudio"
\    },     
\ "VIDEO"   :
\    {"Video playback using VideoView" : "$video_pbVV"
\    },     
\ "LAYOUT"   :
\    {"Linear Layout"                  : "$layout_lin"
\    },     
\ "VIEW"   :
\    {"Text"                  : "$view_text"
\    },     
\ "MANIFEST"   :
\    {"Sample Manifest"                  : "$manifest"
\    }     
\}

XPT TEMPLATE
XSET content.pre=content
XSETm $permission_custom
<permission
	android:name="com.paad.DETONATE_DEVICE"
	android:protectionLevel="dangerous"
	android:label="Self Destruct"
	android:description="@string/detonate_description">
</permission>
XSETm END
XSETm $permission_enforce
<`tag^ChooseStr("activity","service","receiver")^>
	`content^X('
	if xfunc.R\("tag") == "activity"
		return ''android:name=".MyActivity"
android:label="@string/app_name"
android:permission="com.paad.DETONATE_DEVICE">''
	elseif xfunc.R\("tag") == "service"
		return ''android:name=".MyService"
android:permission="com.paad.DETONATE_DEVICE">''
	elseif xfunc.R\("tag") == "receiver"
		return ''android:name=".MyReceiver"
android:permission="com.paad.DETONATE_DEVICE">
<intent-filter>
	<action android:name="com.paad.ACTION_DETONATE_DEVICE"/>
</intent-filter>''
	else
		return ""
	endif')^
</`tag^>
XSETm END
XSETm $telephony_devSupport
PackageManager pm = getPackageManager();
boolean telephonySupported = pm.hasSystemFeature(PackageManager.FEATURE_TELEPHONY);
boolean gsmSupported = pm.hasSystemFeature(PackageManager.FEATURE_TELEPHONY_CDMA);
boolean cdmaSupported = pm.hasSystemFeature(PackageManager.FEATURE_TELEPHONY_GSM);
XSETm END
XSETm $telephony_initCall
//To use this action, your application must request the CALL_PHONE uses-permission:
//<uses-permission android:name="android.permission.CALL_PHONE"/>
Intent whoyougonnacall = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:555-2368"));
startActivity(whoyougonnacall);
XSETm END
XSETm $telephony_nativeDialer
<activity
	android:name=".MyDialerActivity"
	android:label="@string/app_name">
	<intent-filter>
		<action android:name="android.intent.action.CALL_BUTTON" />
		<category android:name="android.intent.category.DEFAULT" />
	</intent-filter>
	<intent-filter>
		<action android:name="android.intent.action.VIEW" />
		<action android:name="android.intent.action.DIAL" />
		<category android:name="android.intent.category.DEFAULT" />
		<category android:name="android.intent.category.BROWSABLE" />
		<data android:scheme="tel" />
	</intent-filter>
</activity>
XSETm END
XSETm $telephony_prop
String srvcName = Context.TELEPHONY_SERVICE;
TelephonyManager telephonyManager =(TelephonyManager)getSystemService(srvcName);


XSETm END
XSETm $telephony_propDevDetails+$telephony_prop
String phoneTypeStr = "unknown";
int phoneType = telephonyManager.getPhoneType();
switch (phoneType) {
	case (TelephonyManager.PHONE_TYPE_CDMA):
		phoneTypeStr = "CDMA";
		break;
	case (TelephonyManager.PHONE_TYPE_GSM) :
		phoneTypeStr = "GSM";
		break;
	case (TelephonyManager.PHONE_TYPE_SIP):
		phoneTypeStr = "SIP";
		break;
	case (TelephonyManager.PHONE_TYPE_NONE):
		phoneTypeStr = "None";
		break;
	default: break;
}
// -- These require READ_PHONE_STATE uses-permission --
//<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
// Read the IMEI for GSM or MEID for CDMA
String deviceId = telephonyManager.getDeviceId();
// Read the software version on the phone (note -- not the SDK version)
String softwareVersion = telephonyManager.getDeviceSoftwareVersion();
// Get the phone’s number (if available)
String phoneNumber = telephonyManager.getLine1Number();
XSETm END
XSETm $telephony_propNetDetails+$telephony_prop
// Get connected network country ISO code
String networkCountry = telephonyManager.getNetworkCountryIso();
// Get the connected network operator ID (MCC + MNC)
String networkOperatorId = telephonyManager.getNetworkOperator();
// Get the connected network operator name
String networkName = telephonyManager.getNetworkOperatorName();
// Get the type of network you are connected to
int networkType = telephonyManager.getNetworkType();
switch (networkType) {
	//code
}
XSETm END
XSETm $telephony_propSimDetails+$telephony_prop
int simState = telephonyManager.getSimState();
switch (simState) {
	case (TelephonyManager.SIM_STATE_ABSENT): break;
	case (TelephonyManager.SIM_STATE_NETWORK_LOCKED): break;
	case (TelephonyManager.SIM_STATE_PIN_REQUIRED): break;
	case (TelephonyManager.SIM_STATE_PUK_REQUIRED): break;
	case (TelephonyManager.SIM_STATE_UNKNOWN): break;
	case (TelephonyManager.SIM_STATE_READY): {
	// Get the SIM country ISO code
	String simCountry = telephonyManager.getSimCountryIso();
	// Get the operator code of the active SIM (MCC + MNC)
	String simOperatorCode = telephonyManager.getSimOperator();
	// Get the name of the SIM operator
	String simOperatorName = telephonyManager.getSimOperatorName();
	// -- Requires READ_PHONE_STATE uses-permission --
	// Get the SIM’s serial number
	String simSerial = telephonyManager.getSimSerialNumber();
	break;
	}
	default: break;
}
XSETm END
XSETm $telephony_propConn+$telephony_prop
int dataActivity = telephonyManager.getDataActivity();
int dataState = telephonyManager.getDataState();
switch (dataActivity) {
	case TelephonyManager.DATA_ACTIVITY_IN : break;
	case TelephonyManager.DATA_ACTIVITY_OUT : break;
	case TelephonyManager.DATA_ACTIVITY_INOUT : break;
	case TelephonyManager.DATA_ACTIVITY_NONE : break;
}
switch (dataState) {
	case TelephonyManager.DATA_CONNECTED : break;
	case TelephonyManager.DATA_CONNECTING : break;
	case TelephonyManager.DATA_DISCONNECTED : break;
	case TelephonyManager.DATA_SUSPENDED : break;
}
XSETm END
XSETm $bluetooth_prop
BluetoothAdapter bluetooth = BluetoothAdapter.getDefaultAdapter();
//To read any of the local Bluetooth Adapter properties, initiate discovery, or fi nd bonded devices, you
//need to include the BLUETOOTH permission in your application manifest
//<uses-permission android:name="android.permission.BLUETOOTH"/>
//<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>


XSETm END
XSETm $bluetooth_propDetails+$bluetooth_prop
if (bluetooth.isEnabled()) {
	String address = bluetooth.getAddress();
	String name = bluetooth.getName();
	//If you have the BLUETOOTH_ADMIN permission, you can change the friendly name of the Bluetooth
	//Adapter using the setName method:
	bluetooth.setName("Blackfang");
	//To find a more detailed description of the current Bluetooth Adapter state, use the getState
	//method, which will return one of the following BluetoothAdapter constants:
	//‰ STATE_TURNING_ON
	//‰ STATE_ON
	//‰ STATE_TURNING_OFF
	//‰ STATE_OFF
}
XSETm END
XSETm $bluetooth_enable
`content^X('
let opt = tlib#input#List\("si","",["By Querying Bluetooth Adapter","By Using BroadCast Reciever that monitors Bluetooth State change"])
if opt == 1
	return xfunc.GetVar\("$bluetooth_prop") . "private static final int ENABLE_BLUETOOTH = 1;
private void initBluetooth() {
	if (!bluetooth.isEnabled()) {
		// Bluetooth isn’t enabled, prompt the user to turn it on.
		Intent intent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
		startActivityForResult(intent, ENABLE_BLUETOOTH);
	} else {
		// Bluetooth is enabled, initialize the UI.
		initBluetoothUI();
	}
}
protected void onActivityResult(int requestCode, int resultCode, Intent data) {
	if (requestCode == ENABLE_BLUETOOTH)
		if (resultCode == RESULT_OK) {
		// Bluetooth has been enabled, initialize the UI.
		initBluetoothUI();
		}
	}
}"
elseif opt == 2
	return ''BroadcastReceiver bluetoothState = new BroadcastReceiver() {
	@Override
	public void onReceive(Context context, Intent intent) {
		String prevStateExtra = BluetoothAdapter.EXTRA_PREVIOUS_STATE;
		String stateExtra = BluetoothAdapter.EXTRA_STATE;
		int state = intent.getIntExtra(stateExtra, −1);
		int previousState = intent.getIntExtra(prevStateExtra, −1);
		String tt = "";
		switch (state) {
			case (BluetoothAdapter.STATE_TURNING_ON) :
				tt = "Bluetooth turning on"; break;
			case (BluetoothAdapter.STATE_ON) :
				tt = "Bluetooth on"; break;
			case (BluetoothAdapter.STATE_TURNING_OFF) :
				tt = "Bluetooth turning off"; break;
			case (BluetoothAdapter.STATE_OFF) :
				tt = "Bluetooth off"; break;
			default: break;
		}
		Log.d(TAG, tt);
	}
};
String actionStateChanged = BluetoothAdapter.ACTION_STATE_CHANGED;
registerReceiver(bluetoothState, new IntentFilter(actionStateChanged));''
else
	return ""
endif
')^
XSETm END
XSETm $bluetooth_monDiscReq
`content^X('
let opt = tlib#input#List\("si","", ["By Overridding onActivityResult()","By Using BroadCast receiver over intent"])
if opt == 1
	return ''@Override
protected void onActivityResult(int requestCode, int resultCode, Intent data) {
	if (requestCode == DISCOVERY_REQUEST) {
		if (resultCode == RESULT_CANCELED) {
			Log.d(TAG, "Discovery canceled by user");
		}
	}
}''
elseif opt == 2
	return ''registerReceiver(new BroadcastReceiver() {
	@Override
	public void onReceive(Context context, Intent intent) {
		String prevScanMode = BluetoothAdapter.EXTRA_PREVIOUS_SCAN_MODE;
		String scanMode = BluetoothAdapter.EXTRA_SCAN_MODE;
		int currentScanMode = intent.getIntExtra(scanMode, −1);
		int prevMode = intent.getIntExtra(prevScanMode, −1);
		Log.d(TAG, "Scan Mode: " + currentScanMode + ". Previous: " + prevMode);
		}
	}, new IntentFilter(BluetoothAdapter.ACTION_SCAN_MODE_CHANGED));''
else
	return ""
endif')^
XSETm END
XSETm $bluetooth_monDisc
BroadcastReceiver discoveryMonitor = new BroadcastReceiver() {
	String dStarted = BluetoothAdapter.ACTION_DISCOVERY_STARTED;
	String dFinished = BluetoothAdapter.ACTION_DISCOVERY_FINISHED;
	@Override
	public void onReceive(Context context, Intent intent) {
		if (dStarted.equals(intent.getAction())) {
			// Discovery has started.
			Log.d(TAG, "Discovery Started...");
		}
		else if (dFinished.equals(intent.getAction())) {
			// Discovery has completed.
			Log.d(TAG, "Discovery Complete.");
		}
	}
	};
registerReceiver(discoveryMonitor, new IntentFilter(dStarted));
registerReceiver(discoveryMonitor, new IntentFilter(dFinished));
XSETm END
XSETm $bluetooth_getDisc
private ArrayList<BluetoothDevice> deviceList = new ArrayList<BluetoothDevice>();
private void startDiscovery() {
	registerReceiver(discoveryResult, new IntentFilter(BluetoothDevice.ACTION_FOUND));
	if (bluetooth.isEnabled() && !bluetooth.isDiscovering()){
	deviceList.clear();
	bluetooth.startDiscovery();
}
BroadcastReceiver discoveryResult = new BroadcastReceiver() {
	@Override
	public void onReceive(Context context, Intent intent) {
		String remoteDeviceName = intent.getStringExtra(BluetoothDevice.EXTRA_NAME);
		BluetoothDevice remoteDevice = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
		deviceList.add(remoteDevice);
		Log.d(TAG, "Discovered " + remoteDeviceName);
	}
};
XSETm END
XSETm $audio_initAudio
`content^X('
let opt = tlib#input#List\("si", "", ["Audio from package resource","Audio from local file","Audio from online resource","Audio from Content Provider","initialize audio using MediaPlayer"])
if opt == 1
	return "MediaPlayer resourcePlayer = MediaPlayer.create(this, R.raw.my_audio);"
elseif opt == 2
	return ''MediaPlayer filePlayer = MediaPlayer.create(this, Uri.parse("file:///sdcard/localfile.mp3"));''
elseif opt == 3
	return ''MediaPlayer urlPlayer = MediaPlayer.create(this, Uri.parse("http://site.com/audio/audio.mp3"));''
elseif opt == 4
	return "MediaPlayer contentPlayer = MediaPlayer.create(this, Settings.System.DEFAULT_RINGTONE_URI);"
elseif opt == 5
	return ''MediaPlayer mediaPlayer = new MediaPlayer();
mediaPlayer.setDataSource("/sdcard/mydopetunes.mp3");
mediaPlayer.prepare();''
else
	return ""
endif
')^
XSETm END
XSETm $video_pbVV
// Get a reference to the Video View.
final VideoView videoView = (VideoView)findViewById(R.id.videoView);
// Configure the video view and assign a source video.
videoView.setKeepScreenOn(true);
videoView.setVideoPath("/sdcard/mycatvideo.3gp");
// Attach a Media Controller
MediaController mediaController = new MediaController(this);
videoView.setMediaController(mediaController);
XSETm END
XSETm $layout_lin
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
	android:orientation="vertical"
	android:gravity="center"
	android:layout_width="\`layout_width\^"
	android:layout_height="\`layout_height\^">
	`cursor^
</LinearLayout>
XSETm END
XSET layout_width=ChooseStr("fill_parent","wrap_content","")
XSET layout_height=ChooseStr("fill_parent","wrap_content","")
XSETm $view_text
`content^X('
let opt = tlib#input#List\("si", "", ["XML Code","Get View in code"])
if opt == 1
	return ''<TextView
	android:id="@+id/myTextView"
	android:layout_width="\`layout_width\^"
	android:layout_height="\`layout_height\^"
	android:textSize="30sp"
	android:text="@string/hello"
	\`cursor\^
/>''
elseif opt == 2
	return "TextView myTextView = (TextView)findViewById(R.id.myTextView);"
else
	return ""
endif
')^
XSETm END
XSETm $manifest
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.aide.trainer.myapp"
    android:versionCode="1"
    android:versionName="1.0" >

    <uses-sdk 
        android:minSdkVersion="11" 
        android:targetSdkVersion="17" />

    <application
        android:icon="@drawable/ic_launcher"
        android:label="@string/app_name" >
        <activity
            android:label="@string/app_name"
            android:theme="@android:style/Theme.Holo.Light"
            android:name=".MainActivity" >
            <intent-filter >
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
XSETm END
`choose^Z(pickL(GetVar("AndroidTemplatesDict")))^
