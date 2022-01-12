XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.fragment_snip = {
\ "Get the FragmentManager"     : 'FragmentManager fragmentManager = getFragmentManager\();',
\ "Add a fragment"      : "$add_a_frag",
\ "Add a fragment with no UI. specifying a tag to use to identify it. Because the Fragment has no UI, it should not be associated with a container View and generally shouldn’t be added to the back stack." : "$add_a_frag_no_ui",
\ "Remove a fragment"   : "$remove_a_frag",
\ "Replace a fragment"  : "$replace_a_frag",
\ "Find a Fragment with No UI" : 'MyFragment myFragment = (MyFragment)fragmentManager.findFragmentByTag\(MY_FRAGMENT_TAG);',
\ "Populate fragment layouts using container views at runtime" : "$pop_frag_lay",
\ "add to Back Stack. Make the back button reverse the previous Fragment Transaction and return the UI to the earlier layout." : "String tag = null;\nfragmentTransaction.addToBackStack\\\(tag);\nfragmentTransaction.commit\\\();",
\ "ANIMATING FRAGMENT TRANSACTIONS" : 
\  {"Apply default transition method" : 'transaction.setTransition\(FragmentTransaction.TRANSIT_FRAGMENT_`OPEN^);',
\   "Apply custom animations accepts two animation XML resources: one for Fragments that are being added to the layout by this transaction, and another for Fragments being removed:" : 'fragmentTransaction.setCustomAnimations\(R.animator.`slide_in_left^, R.animator.`slide_out_right^);',
\  },
\ "return a reference to the Activity within which a fragment is embedded using getActivity." : 'TextView textView = (TextView)getActivity\().findViewById\(R.id.textview);',
\ "Defining Fragment event callback interface" : "$event_cb_int",
\}


XPT fragment
import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class MySkeletonFragment extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        // Create, or inflate the Fragment’s UI, and return it.
        // If this Fragment has no UI then return null.
        return inflater.inflate(R.layout.my_fragment, container, false);
    }
    `...^`fragFunc^Trigger("fragment_funcs")^
`...^
}

XPT fragment_funcs alias=_chooseXSET
XSET $onAttach Called when the Fragment is attached to its parent Activity.=Trigger("fragment_onAttach")
XSET $onCreate Called to do the initial creation of the Fragment.=Trigger("fragment_onCreate")
XSET $onActivityCreated Called once the parent Activity and the Fragment’s UI have been created.=Trigger("fragment_onActivityCreated")
XSET $onStart Called at the start of the visible lifetime.=Trigger("fragment_onStart")
XSET $onResume Called at the start of the active lifetime.=Trigger("fragment_onResume")
XSET $onPause Called at the end of the active lifetime.=Trigger("fragment_onpause")
XSET $onSaveInstanceState Called to save UI state changes at the end of the active lifecycle.=Trigger("fragment_onSaveInstanceState")
XSET $onStop Called at the end of the visible lifetime.=Trigger("fragment_onStop")
XSET $onDestroyView Called when the Fragment’s View has been detached.=Trigger("fragment_onDestroyView")
XSET $onDestroy Called at the end of the full lifetime.=Trigger("fragment_onDestroy")
XSET $onDetach Called when the Fragment has been detached from its parent Activity.=Trigger("fragment_onDetach")

XPT fragment_onDetach
@Override
public void onDetach() {
    super.onDetach();
}

XPT fragment_onDestroy
@Override
public void onDestroy(){
    // Clean up any resources including ending threads,
    // closing database connections etc.
    super.onDestroy();
}

XPT fragment_onDestroyView
@Override
public void onDestroyView() {
    // Clean up resources related to the View.
    super.onDestroyView();
}

XPT fragment_onStop
@Override
public void onStop(){
    // Suspend remaining UI updates, threads, or processing
    // that aren’t required when the Fragment isn’t visible.
    super.onStop();
}

XPT fragment_onSaveInstanceState
@Override
public void onSaveInstanceState(Bundle savedInstanceState) {
    // Save UI state changes to the savedInstanceState.
    // This bundle will be passed to onCreate, onCreateView, and
    // onCreateView if the parent Activity is killed and restarted.
    super.onSaveInstanceState(savedInstanceState);
}

XPT fragment_onPause
@Override
public void onPause(){
    // Suspend UI updates, threads, or CPU intensive processes
    // that don’t need to be updated when the Activity isn’t
    // the active foreground activity.
    // Persist all edits or state changes
    // as after this call the process is likely to be killed.
    super.onPause();
}

XPT fragment_onResume
@Override
public void onResume(){
    super.onResume();
    // Resume any paused UI updates, threads, or processes required
    // by the Fragment but suspended when it became inactive.
}

XPT fragment_onStart
@Override
public void onStart(){
super.onStart();
    // Apply any required UI change now that the Fragment is visible.
}

XPT fragment_onActivityCreated
@Override
public void onActivityCreated(Bundle savedInstanceState) {
    super.onActivityCreated(savedInstanceState);
    // Complete the Fragment initialization – particularly anything
    // that requires the parent Activity to be initialized or the
    // Fragment’s view to be fully inflated.
}

XPT fragment_onCreate
@Override
public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    // Initialize the Fragment.
}

XPT fragment_onAttach
@Override
public void onAttach(Activity activity) {
    super.onAttach(activity);
    // Get a reference to the parent Activity.
}

XPT fragment_snip alias=_snip
XSETm $add_a_frag
FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
fragmentTransaction.add(R.id.ui_container, new MyListFragment());
fragmentTransaction.commit();
XSETm END
XSETm $add_a_frag_no_ui
FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
fragmentTransaction.add(workerFragment, MY_FRAGMENT_TAG);
fragmentTransaction.commit();
XSETm END
XSETm $remove_a_frag
FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
Fragment fragment = fragmentManager.findFragmentById(R.id.details_fragment);
fragmentTransaction.remove(fragment);
fragmentTransaction.commit();
XSETm END
XSETm $replace_a_frag
FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
fragmentTransaction.replace(R.id.details_fragment,
new DetailFragment(selected_index));
fragmentTransaction.commit();
XSETm END
XSETm $pop_frag_lay
public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    // Inflate the layout containing the Fragment containers
    setContentView(R.layout.fragment_container_layout);
    FragmentManager fm = getFragmentManager();

    // Check to see if the Fragment back stack has been populated
    // If not, create and populate the layout.
    DetailsFragment detailsFragment = (DetailsFragment)fm.findFragmentById(R.id.details_container);
    if (detailsFragment == null) {
        FragmentTransaction ft = fm.beginTransaction();
        ft.add(R.id.details_container, new DetailsFragment());
        ft.add(R.id.ui_container, new MyListFragment());
        ft.commit();
    }
}
XSET END
XSETm $event_cb_int
public interface OnSeasonSelectedListener {
    public void onSeasonSelected(Season season);
}

private OnSeasonSelectedListener onSeasonSelectedListener;
private Season currentSeason;

@Override
public void onAttach(Activity activity) {
    super.onAttach(activity);

    try {
        onSeasonSelectedListener = (OnSeasonSelectedListener)activity;
    } catch (ClassCastException e) {
        throw new ClassCastException(activity.toString() + " must implement OnSeasonSelectedListener");
    }
}

private void setSeason(Season season) {
    currentSeason = season;
    onSeasonSelectedListener.onSeasonSelected(season);
}
XSETm END