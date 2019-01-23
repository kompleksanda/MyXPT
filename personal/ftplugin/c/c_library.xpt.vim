XPTemplate priority=sub

XPT include
#include <`header^>

"----------assert.h--------
XPT assert "<assert.h>
assert(`cursor^)

"----------ctype.h--------
XPT isalnum synonym=isalpha|isblank|iscntrl|isdigit|isgraph|islower|isupper|isprint|ispunct|isspace|isxdigit|tolower|toupper "<ctype.h>
`$_xSnipName^(`int^)

"----------errno.h--------
XPT errno synonym=EDOM|ERANGE|EILSEQ "<errno.h>
`$_xSnipName^

"----------fenv.h--------
XPT _fenvAccPrag hidden
//#pragma STDC FENV_ACCESS on

..XPT
XPT feclearexcept text=_fenvAccPrag "<fenv.h> Clear floating-point exceptions (function )
XSET FE_EXCEPTION=Choose([{"word":"FE_DIVBYZERO","menu":"Pole error exception"},{"word":"FE_INEXACT","menu":"Inexact result exception"},{"word":"FE_OVERFLOW","menu":"Overflow range error exception"},{"word":"FE_UNDERFLOW","menu":"Underflow range error exception"},{"word":"FE_ALL_EXCEPT","menu":"All exceptions"},{"word":"FE_INVALID","menu":"Invalid argument exception"}])
XSET FE_EXCEPTION.post=BuildIfChanged(sCat(V() . "` || `FE_EXCEPTION^"))
feclearexcept(`FE_EXCEPTION^);
XPT feraiseexcept text=_fenvAccPrag setting=feclearexcept "<fenv.h> Raise floating-point exception (function )
feraiseexcept(`FE_EXCEPTION^);
XPT fegetexceptflag setting=feclearexcept "<fenv.h> Get floating-point exception flags (function ) ret 0 if representation successfully stored else non-zero
fegetexceptflag(fexcept_t* `flagp^, `FE_EXCEPTION^)
XPT fesetexceptflag setting=feclearexcept "<fenv.h> Set floating-point exception flags (function )
fesetexceptflag(const fexcept_t* `flagp^, `FE_EXCEPTION^)
XPT fegetround "<fenv.h> Get rounding direction mode (function )
`_xSnipName^()
XPT fesetround "<fenv.h> Set rounding direction mode (function) ret 0 if successfully established stored else non-zero
XSET FE_ROUND_VAL=ChooseStr("FE_DOWNWARD","FE_TONEAREST","FE_TOWARDZERO","FE_UPWARD")
fesetround(`FE_ROUND_VAL^)
XPT fegetenv text=_fenvAccPrag "<fenv.h> Get floating-point environment (function )ret 0 if state successfully stored else non-zero
`$_xSnipName^(fenv_t* `envp^)
XPT fesetenv text=_fenvAccPrag "<fenv.h> Set floating-point environment (function )
XSET opt=Choose([{"word":"const fenv_t* `envp^"},{"word":"FE_DFL_ENV","menu":"Default floating-point environment(same as at program startup)"}])
XSET opt.post=Embed(V())
`$_xSnipName^(`opt^)
XPT feholdexcept alias=fegetenv "<fenv.h> Hold floating-point exceptions (function )
XPT feupdateenv alias=fesetenv "<fenv.h> Update floating-point environment (function )
XPT fetestexcept text=_fenvAccPrag setting=feclearexcept "<fenv.h> Test for floating-point exceptions (function ) ret 0 is none of args are set else the exception among arg that is set
fetestexcept(`FE_EXCEPTION^)
XPT fenv_t "<fenv.h> Floating-point environment type (type )
`$_xSnipName^ `name^;
XPT fexcept_t alias=fenv_t "<fenv.h> Floating-point exceptions type (type )
XPT FE_DIVBYZERO "<fenv.h> Pole error exception (macro )
XPT FE_INEXACT "<fenv.h> Inexact result exception (macro )
XPT FE_INVALID "<fenv.h> Invalid argument exception (macro )
XPT FE_OVERFLOW "<fenv.h> Overflow range error exception (macro )
XPT FE_UNDERFLOW "<fenv.h> Underflow range error exception (macro )
XPT FE_ALL_EXCEPT "<fenv.h> All exceptions (macro )
XPT FE_DOWNWARD "<fenv.h> Downward rounding direction mode (macro )
XPT FE_TONEAREST "<fenv.h> To-nearest rounding direction mode (macro )
XPT FE_TOWARDZERO "<fenv.h> Toward-zero rounding direction mode (macro )
XPT FE_UPWARD "<fenv.h> Upward rounding direction mode (macro )
XPT FE_DFL_ENV "<fenv.h> Default environment (macro ) fenv_t* can be used to select default env for fesetenv, feupdateenv
XPT FENV_ACCESS "<fenv.h> Access to Floating-point environment (pragma )
