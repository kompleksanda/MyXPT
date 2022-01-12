XPTemplate priority=sub
let s:f = g:XPTfuncs()
let s:f.resources_snip = {
\ "GET INSTANCE"     :
\     {"Step 1: get the resources in variables" : 'Resources myResources = getResources\();',
\      "Get string" : 'CharSequence styledText = myResources.getText\(R.string.`stop_message^);',
\      "Get Drawable"  :   'Drawable icon = myResources.getDrawable\(R.drawable.`app_icon^);',
\      "Get Color"     :    'int opaqueBlue = myResources.getColor\(R.color.`opaque_blue^);',
\      "Get dimension" :    'float borderWidth = myResources.getDimension\(R.dimen.`standard_border^);',
\      "Get Animation" :   'Animation tranOut = AnimationUtils.loadAnimation\(this, R.anim.`spin_shrink_fade^);',
\      "Get ObjectAnimator" : 'ObjectAnimator animator = (ObjectAnimator)AnimatorInflater.loadAnimator\(this, R.anim.`my_animator^);',
\      "Get String Array"   : 'String[] stringArray = myResources.getStringArray\(R.array.`string_array^);',
\      "Get Int Array"      : 'int[] intArray = myResources.getIntArray\(R.array.`integer_array^);',
\      "Get Frame by Frame animated resource":'AnimationDrawable androidAnimation = (AnimationDrawable)myResources.getDrawable\(R.drawable.`frame_by_frame^);',
\     },
\}

XPT res
XSET resourcetype=ChooseStr("dimen","string","drawable","color","layout")
@``packagename?`:^`resourcetype^/`resourceidentifier^

XPT R
XSET resourcetype.pre=resourcetype
XSET resourcetype=ChooseStr("dimen","string","drawable","color","layout","id")
R.`resourcetype^.`resourceidentifier^

XPT resources_snip alias=_snip
