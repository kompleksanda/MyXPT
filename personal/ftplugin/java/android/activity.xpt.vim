XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.activity_snip = {
\ "setContentView" : 'setContentView\(R.layout.`main^);',
\}

XPT activity dyn
import android.app.Activity;
import android.os.Bundle;

public class MyActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.`main^);
    }
    `...^`actFunc^Trigger("activity_funcs")^
`...^
}

XPT activity_funcs alias=_chooseXSET
XSET $onConfigurationChanged=Trigger("activity_onConfigurationChanged")
XSET $onRestoreInstanceState Called after onCreate has finished, use to restore UI state=Trigger("activity_onRestoreInstanceState")
XSET $onRestart Called before subsequent visible lifetimes for an Activity process.=Trigger("activity_onRestart")
XSET $onStart Called at the start of the visible lifetime.=Trigger("activity_onStart")
XSET $onResume Called at the start of the active lifetime.=Trigger("activity_onResume")
XSET $onSaveInstanceState Called to save UI state changes at the end of the active lifecycle.=Trigger("activity_onSaveInstanceState")
XSET $onPause Called at the end of the active lifetime.=Trigger("activity_onPause")
XSET $onStop Called at the end of the visible lifetime.=Trigger("activity_onStop")
XSET $onDestroy Sometimes called at the end of the full lifetime.=Trigger("activity_onDestroy")
XSET $onActivityResult called after a sub activity returns=Trigger("activity_onActivityResult")
XSET $onNewIntent receive and handle new Intents after the Activity has been created.=Trigger("activity_onNewIntent")

XPT activity_onNewIntent
@Override
public void onNewIntent(Intent newIntent) {
    // TODO React to the new Intent
    super.onNewIntent(newIntent);
}

XPT activity_onActivityResult
@Override
public void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    switch(requestCode) {
        case (SELECT_HORSE):
        if (resultCode == Activity.RESULT_OK)
            selectedHorse = data.getData();
            break;
        case (SELECT_GUN):
            if (resultCode == Activity.RESULT_OK)
            selectedGun = data.getData();
            break;
        default: break;
    }
}

XPT activity_onDestroy
@Override
public void onDestroy(){
    // Clean up any resources including ending threads,
    // closing database connections etc.
    super.onDestroy();
}

XPT activity_onStop
@Override
public void onStop(){
    // Suspend remaining UI updates, threads, or processing
    // that aren’t required when the Activity isn’t visible.
    // Persist all edits or state changes
    // as after this call the process is likely to be killed.
    super.onStop();
}

XPT activity_onPause
@Override
public void onPause(){
    // Suspend UI updates, threads, or CPU intensive processes
    // that don’t need to be updated when the Activity isn’t
    // the active foreground Activity.
    super.onPause();
}

XPT activity_onSaveInstanceState
@Override
public void onSaveInstanceState(Bundle savedInstanceState) {
    // Save UI state changes to the savedInstanceState.
    // This bundle will be passed to onCreate and
    // onRestoreInstanceState if the process is
    // killed and restarted by the run time.
    super.onSaveInstanceState(savedInstanceState);
}


XPT activity_onResume
@Override
public void onResume(){
    super.onResume();
    // Resume any paused UI updates, threads, or processes required
    // by the Activity but suspended when it was inactive.
}

XPT activity_onStart
@Override
public void onStart(){
    super.onStart();
    // Apply any required UI change now that the Activity is visible.
}

XPT activity_onRestart
@Override
public void onRestart(){
    super.onRestart();
    // Load changes knowing that the Activity has already
    // been visible within this process.
}

XPT activity_onRestoreInstanceState
@Override
public void onRestoreInstanceState(Bundle savedInstanceState) {
    super.onRestoreInstanceState(savedInstanceState);
    // Restore UI state from the savedInstanceState.
    // This bundle has also been passed to onCreate.
    // Will only be called if the Activity has been
    // killed by the system since it was last visible.
}

XPT activity_onConfigurationChanged
@Override
public void onConfigurationChanged(Configuration newConfig) {
    super.onConfigurationChanged(newConfig);
    // [ ... Update any UI based on resource values ... ]
    if (newConfig.orientation == Configuration.ORIENTATION_LANDSCAPE) {
        // [ ... React to different orientation ... ]
    }
    if (newConfig.keyboardHidden == Configuration.KEYBOARDHIDDEN_NO) {
        // [ ... React to changed keyboard visibility ... ]
    }
}

XPT activity_snip alias=_snip