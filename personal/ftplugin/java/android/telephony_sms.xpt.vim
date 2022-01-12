XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.telephony_snip = {
\ "Checking for Telephony Hardware" : "$Checking_for_Telephony_Hardware",
\ "Initiating Phone Calls" : s:f.intent_snip["Request a phone call on a number"],
\}

XPT telephony_snip alias=_snip
XSETm $Checking_for_Telephony_Hardware
PackageManager pm = getPackageManager();
boolean telephonySupported = pm.hasSystemFeature(PackageManager.FEATURE_TELEPHONY);
boolean gsmSupported = pm.hasSystemFeature(PackageManager.FEATURE_TELEPHONY_CDMA);
boolean cdmaSupported = pm.hasSystemFeature(PackageManager.FEATURE_TELEPHONY_GSM);
XSETm END