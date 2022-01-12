XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.broadcast_snip = {
\ "Create a new Broadcast Receiver"     : "$create_new_br",
\ "Registering and unregistering a Broadcast Receiver in code. Normally done for Broadcast Receivers that affect the UI of a particular Activity" : "$reg_broad_in_act",
\ "Broadcasting Ordered Intents" : "String requiredPermission = \"com.paad.MY_BROADCAST_PERMISSION\";\nsendOrderedBroadcast\\\(intent, requiredPermission);",
\ "sendordered broadcasts is to broadcast Intents for which you want to receive result data. you specify a Broadcast Receiver that will be placed at the end of the Receiver queue, ensuring that it will receive the Broadcast Intent after it has been handled (and modified) by the ordered set of registered Broadcast Receivers." : "$send_ordered_broadcast_spec_last_reciever",
\ "Send Custom sticky intent" : "To broadcast your own sticky Intents, your application must have the BROADCAST_STICKY uses-permission\nbefore calling sendStickyBroadcast\nsendStickyBroadcast\\\(intent);",
\ "Remove Custom sticty intent" : 'removeStickyBroadcast\(intent);',
\ "LOCAL BROADCAST MANAGER" : {
\    "Get the LocalBroadcastManager" : 'LocalBroadcastManager lbm = LocalBroadcastManager.getInstance\(this);',
\    "Register a local broadcast" : '$reg_local_broad',
\    "Transmit a local broadcast" : 'lbm.sendBroadcast\(new Intent\(LOCAL_ACTION));',
\ },
\}



XPT broadcast_snip alias=_snip
XSETm $reg_local_broad
lbm.registerReceiver(new BroadcastReceiver() {
    @Override
    public void onReceive(Context context, Intent intent) {
        // TODO Handle the received local broadcast
    }
}, new IntentFilter(LOCAL_ACTION));
XSETm END
XSETm $reg_broad_in_act
private IntentFilter filter = new IntentFilter(LifeformDetectedReceiver.NEW_LIFEFORM);
private LifeformDetectedReceiver receiver = new LifeformDetectedReceiver();

@Override
public void onResume() {
    super.onResume();
    // Register the broadcast receiver.
    registerReceiver(receiver, filter);
}
@Override
public void onPause() {
    // Unregister the receiver
    unregisterReceiver(receiver);
    super.onPause();
}
XSETm END
XSETm $create_new_br
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class MyBroadcastReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        //TODO: React to the Intent received.
    }
}
XSETm END
XSETm $send_ordered_broadcast_spec_last_reciever
// Specify the default result, data, and extras.
// The may be modified by any of the Receivers who handle the broadcast
// before being received by the final Receiver.
int initialResult = Activity.RESULT_OK;
String initialData = null;
String initialExtras = null;
// A special Handler instance on which to receive the final result.
// Specify null to use the Context on which the Intent was broadcast.
Handler scheduler = null;
sendOrderedBroadcast(intent, requiredPermission, finalResultReceiver, scheduler, initialResult, initialData, initialExtras);
XSETm END