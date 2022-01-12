XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.android_snip = {
\   "ARRAY ADAPTERS"     :  {
\       "Create ArrayList, Create ArrayAdapter and bind them, then bind ArrayAdapter to a ListView"     : "$create_arraylist_adapter_bind",
\       "Customizing the Array Adapter" : "$cust_arra_adap",
\   },
\}

XPT android_snip alias=_snip
XSETm $create_arraylist_adapter_bind
// Create the Array List of to do items
final ArrayList<`String^> todoItems = new ArrayList<`String^>();

// Create the Array Adapter to bind the array to the List View
final ArrayAdapter<`String^> aa;
aa = new ArrayAdapter`String^>(this, android.R.layout.simple_list_item_1, todoItems);

// Bind the Array Adapter to the List View
`myListView^.setAdapter(aa);
XSETm END
XSETm $cust_arra_adap
public class MyArrayAdapter extends ArrayAdapter<MyClass> {
    int resource;
    public MyArrayAdapter(Context context, int _resource, List<MyClass> items) {
        super(context, _resource, items);
        resource = _resource;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Create and inflate the View to display
        LinearLayout newView;
        if (convertView == null) {
            // Inflate a new view if this is not an update.
            newView = new LinearLayout(getContext());
            String inflater = Context.LAYOUT_INFLATER_SERVICE;
            LayoutInflater li;
            li = (LayoutInflater)getContext().getSystemService(inflater);
            li.inflate(resource, newView, true);
        } else {
            // Otherwise we’ll update the existing View
            newView = (LinearLayout)convertView;
        }
        MyClass classInstance = getItem(position);
        // TODO Retrieve values to display from the
        // classInstance variable.
        // TODO Get references to the Views to populate from the layout.
        // TODO Populate the Views with object property values.
        return newView;
    }
}
XSETm END