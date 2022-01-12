XPTemplate priority=sub

let s:f = g:XPTfuncs()
let s:f.accessibility_snip = {
\ "Supporting Accessibility in Custom Views"   : "$support_acc_in_views",
\ "Customizing Accessibility Event properties" : "$customizing_acc_ev_prop",
\}

XPT accessibility_snip alias=_snip
XSETm $support_acc_in_views
/*
To be accessible, custom Views must implement the AccessibilityEventSource
interface and broadcast AccessibilityEvents using the sendAccessibilityEvent
method.
*/
sendAccessibilityEvent(AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED);
XSETm END
XSETm $customizing_acc_ev_prop
@Override
public boolean dispatchPopulateAccessibilityEvent(final AccessibilityEvent event) {
super.dispatchPopulateAccessibilityEvent(event);
    if (isShown()) {
        String seasonStr = Season.valueOf(season);
        if (seasonStr.length() > AccessibilityEvent.MAX_TEXT_LENGTH)
            seasonStr = seasonStr.substring(0, AccessibilityEvent.MAX_TEXT_LENGTH-1);
        event.getText().add(seasonStr);
        return true;
    }
    else
    return false;
}
XSETm END