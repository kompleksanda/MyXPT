XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.view_snip = {
\ "Find a stub view, inflate it and find the root node of the inflated stub layout"     : "$stub_vis",
\ "Obtain Reference to View in code" : '`TextView^ my`TextView^ = (`TextView^)findViewById\(R.id.`myTextView^);',
\ "setOnKeyListener for onKey of a view(myEditText) if enter key pressed and update ArrayAdapter" : "$setOnKeyListener_onKey",
\ "Find a view inside another view by its ID" : 'final EditText myEditText =(EditText)view.findViewById\(R.id.myEditText);',
\ "Extend a view(TextView)" : "$text_v_ext",
\}

XPT _view setting=_layout
<`name^
    android:layout_width="`layout_width^"
    android:layout_height="`layout_height^"
    android:id="@+id/`myEditText^"
    `viewAttr^` `RELATIVELAYOUT NODE ALIGNMENT SETTINGS{{^
`rel_set^Trigger("_rel_lay_node_set")^`}}^` `GRIDLAYOUT NODE GRAVITY SETTINGS{{^
`rel_set^Trigger("_grid_lay_node_set")^`}}^
    `Snippet("_chooseXSET")^
/>

XPT view synonym=layout_nodes alias=_chooseXSET
XSET $text=Trigger("view_text")
XSET $edit text=Trigger("view_edittext")
XSET $button=Trigger("view_button")
XSET $List view=Trigger("view_list")
XSET $Layouts=Trigger("layout")
XSET $image=Trigger("view_image")
XSET $view stub=Trigger("view_stub")
XSET $fragment=Trigger("view_fragment")
XSET $FrameLayout view=Trigger("view_frameLayout")

XPT _rel_lay_node_set alias=_cx hidden
XSET $ParentBottom=android:layout_alignParentBottom="`true^"
XSET $above=android:layout_above="@id/`button_bar^"
XSET $ParentLeft=android:layout_alignParentLeft="`true^"
XSET $id=android:id="@+id/`button_bar^"

XPT _grid_lay_node_set alias=_cx hidden
XSET $gravity=android:layout_gravity="`layout_gravity^"
XSET $dummy=text

XPT view_funcs alias=_chooseXSET
XSETm $onDraw override to modify theView’s appearance
@Override
public void onDraw(Canvas canvas) {
    [ ... Draw things on the canvas under the text ... ]
    // Render the text as usual using the TextView base class.
    super.onDraw(canvas);
    [ ... Draw things on the canvas over the text ... ]
}
XSETm END
XSETm $onKeyDown override to allow custom key-press handling.
@Override
public boolean onKeyDown(int keyCode, KeyEvent keyEvent) {
    [ ... Perform some special processing ... ]
    [ ... based on a particular key press ... ]
    // Use the existing functionality implemented by
    // the base class to respond to a key press event.
    return super.onKeyDown(keyCode, keyEvent);
}
XSETm END
XSETm $onMeasure called when the control’s parent is laying out its child controls. It asks the question, "How much space will you use?"
@Override
protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
    int measuredHeight = measureHeight(heightMeasureSpec);
    int measuredWidth = measureWidth(widthMeasureSpec);
    setMeasuredDimension(measuredHeight, measuredWidth);
}
private int measureHeight(int measureSpec) {
    int specMode = MeasureSpec.getMode(measureSpec);
    int specSize = MeasureSpec.getSize(measureSpec);
    // Default size if no limits are specified.
    int result = 500;
    if (specMode == MeasureSpec.AT_MOST) {
        // Calculate the ideal size of your
        // control within this maximum size.
        // If your control fills the available
        // space return the outer bound.
        result = specSize;
    } else if (specMode == MeasureSpec.EXACTLY) {
        // If your control can fit within these bounds return that value.
        result = specSize;
    }
    return result;
}
XSETm END
XSETm $onKeyUp
@Override
public boolean onKeyUp(int keyCode, KeyEvent keyEvent) {
    // Return true if the event was handled.
    return true;
}
XSETm END
XSETm $onTrackballEvent
@Override
public boolean onTrackballEvent(MotionEvent event ) {
    // Get the type of action this event represents
    int actionPerformed = event.getAction();
    // Return true if the event was handled.
    return true;
}
XSETm END
XSETm $onTouchEvent
@Override
public boolean onTouchEvent(MotionEvent event) {
    // Get the type of action this event represents
    int actionPerformed = event.getAction();
    // Return true if the event was handled.
    return true;
}
XSETm END

XPT view_snip alias=_snip
XSETm $stub_vis
View stub = findViewById(R.id.`download_progress_panel_stub^);
stub.setVisibility(View.VISIBLE);
// Find the root node of the inflated stub layout
View downloadProgressPanel = findViewById(R.id.`download_progress_panel^);
XSETm END
XSETm $setOnKeyListener_onKey
`myEditText^.setOnKeyListener(new View.OnKeyListener() {
    public boolean onKey(View v, int keyCode, KeyEvent event) {
        if (event.getAction() == KeyEvent.ACTION_DOWN)
            if ((keyCode == KeyEvent.KEYCODE_DPAD_CENTER) || (keyCode == KeyEvent.KEYCODE_ENTER)) {
                todoItems.add(0, myEditText.getText().toString());
                aa.notifyDataSetChanged();
                myEditText.setText(“”);
                return true;
            }
        return false;
    }
});
XSETm END
XSETm $text_v_ext
import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.widget.TextView;

public class MyTextView extends TextView {
    public MyTextView (Context context, AttributeSet attrs, int defStyle)
    {
        super(context, attrs, defStyle);
    }
    public MyTextView (Context context) {
        super(context);
    }
    public MyTextView (Context context, AttributeSet attrs) {
        super(context, attrs);
    }
    `...^`viewmeth^Trigger("view_funcs")^
`...^
}
XSETm END
