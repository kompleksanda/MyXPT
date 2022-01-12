XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.intent_snip = {
\ "Explicitly start an activity"     : "Intent intent = new Intent\\\(MyActivity.this, MyOtherActivity.class);\nstartActivity\\\(intent);",
\ "Request a phone call on a number"    :  "Intent intent = new Intent\\\(Intent.ACTION_DIAL, Uri.parse\\\(\"tel:555-2368\"));\nstartActivity\\\(intent);",
\ "Check to see if intent will result into an activity"  : "$check_int_res",
\ "Explicitly starting a sub-Activity for a result"   :  "$exp_start_act_fr",
\ "Implicitly start an activity that picks a contact"   :   "$imp_pick_cont",
\ "Broadcasting an Intent optionally providing extra data" : "$broadcast_an_int",
\ "Get a given Intent data" : 'Uri data = `intent^.getData\();',
\ "Get a given Intent action" : 'String action = intent.getAction\();',
\ "Get a string type extra from an intent" : 'String type = `intent^.getStringExtra\(EXTRA_LIFEFORM_NAME);',
\ "Get a double type extra from an intent" : 'double lng = `intent^.getDoubleExtra\(EXTRA_LONGITUDE, 0);',
\ "Start an intent in a BroadCastReciever Class" : 'context.startService\(`startIntent^);',
\ "Find an intent that lauches an activity" : "$intent_lauches_act",
\ "Generating a list of possible actions to be performed on specific data in intent" : "$gene_action_for_snip",
\ "Get Contact name from URI" : "$get_cont_name_from_uri",
\}


XPT intent_snip alias=_snip
XSETm $get_cont_name_from_uri
Uri contactData = data.getData();
Cursor c = getContentResolver().query(contactData, null, null, null, null);
c.moveToFirst();
String name = c.getString(c.getColumnIndexOrThrow(ContactsContract.Contacts.DISPLAY_NAME_PRIMARY));
c.close();
TextView tv = (TextView)findViewById(R.id.selected_contact_textview);
tv.setText(name);
XSETm END
XSETm $gene_action_for_snip
// Create the intent used to resolve which actions
// should appear in the menu.
Intent intent = new Intent();
intent.setData(MoonBaseProvider.CONTENT_URI);
intent.addCategory(Intent.CATEGORY_SELECTED_ALTERNATIVE);
// Specify flags. In this case, to return only filters
// with the default category.
int flags = PackageManager.MATCH_DEFAULT_ONLY;
// Generate the list
List<ResolveInfo> actions;
actions = packageManager.queryIntentActivities(intent, flags);
// Extract the list of action names
ArrayList<String> labels = new ArrayList<String>();
Resources r = getResources();
for (ResolveInfo action : actions )
    labels.add(r.getString(action.labelRes));
XSETm END
XSETm $intent_lauches_act
Intent intent = getIntent();
String action = intent.getAction();
Uri data = intent.getData();
XSETm END
XSETm $broadcast_an_int
Intent intent = new Intent(`LifeformDetectedReceiver.NEW_LIFEFORM^);
`putExtra...^intent.putExtra(LifeformDetectedReceiver.EXTRA_LIFEFORM_NAME, detectedLifeform);
`putExtra...^
sendBroadcast(intent);
XSETm END
XSETm $imp_pick_cont
private static final int PICK_CONTACT_SUBACTIVITY = 2;
private void startSubActivityImplicitly() {
    Uri uri = Uri.parse(“content://contacts/people”);
    Intent intent = new Intent(Intent.ACTION_PICK, uri);
    startActivityForResult(intent, PICK_CONTACT_SUBACTIVITY);
}
XSETm END
XSETm $check_int_res
// Check if an Activity exists to perform this action.
PackageManager pm = getPackageManager();
ComponentName cn = intent.resolveActivity(pm);
if (cn == null) {
    // If there is no Activity available to perform the action
    // Check to see if the Google Play Store is available.
    Uri marketUri = Uri.parse("market://search?q=pname:com.myapp.packagename");
    Intent marketIntent = new Intent(Intent.ACTION_VIEW).setData(marketUri);
    // If the Google Play Store is available, use it to download an application
    // capable of performing the required action. Otherwise log an
    // error.
    if (marketIntent.resolveActivity(pm) != null)
        startActivity(marketIntent);
    else
        Log.d(TAG, "Market client not available.");
}
else
    startActivity(intent);
XSETm END
XSETm $exp_start_act_fr
private static final int SHOW_SUBACTIVITY = 1;
private void startSubActivity() {
    Intent intent = new Intent(this, MyOtherActivity.class);
    startActivityForResult(intent, SHOW_SUBACTIVITY);
}
XSETm END