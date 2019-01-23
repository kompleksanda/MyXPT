XPT feraiseexcept_TEMPLATE
#include <stdio.h> /* printf */
#include <fenv.h> /* feraiseexcept, fetestexcept, FE_ALL_EXCEPT, FE_INVALID */
#pragma STDC FENV_ACCESS on
double fn ( double x) { /* some function for which zero is a domain error */
	if (x==0.0) feraiseexcept(FE_INVALID);
	return x;
}
int main () {
	feclearexcept (FE_ALL_EXCEPT);
	fn (0.0);
	if (fetestexcept(FE_INVALID)) printf ( "FE_INVALID raised\n" );
	return 0;
}

XPT fesetround_TEMPLATE
printf ( "rounding using " );
switch (fegetround()) {
	case FE_DOWNWARD: printf ( "downward" ); break ;
	case FE_TONEAREST: printf ( "to-nearest" ); break ;
	case FE_TOWARDZERO: printf ( "toward-zero" ); break ;
	case FE_UPWARD: printf ( "upward" ); break ;
	default: printf ( "unknown" );
}

XPT feholdexcept_TEMPLATE
/* feholdexcept/feupdateenv example */
#include <stdio.h> /* printf, puts */
#include <fenv.h> /* feholdexcept, feclearexcept, fetestexcept, feupdateenv, FE_* */
#include <math.h> /* log */
#pragma STDC FENV_ACCESS on
double log_zerook ( double x) { 
	fenv_t fe; 
	feholdexcept(&fe); 
	x=log(x); 
	feclearexcept (FE_OVERFLOW|FE_DIVBYZERO); 
	feupdateenv(&fe);
	return x;
}
int main () {
	feclearexcept (FE_ALL_EXCEPT);   
	printf ( "log(0.0): %f\n" , log_zerook(0.0));
	if (!fetestexcept(FE_ALL_EXCEPT)) puts ( "no exceptions raised" );
	return 0; 
}

XPT fetestexcept_TEMPLATE
feclearexcept (FE_ALL_EXCEPT);
fn (0.0);
/* testing for single exception: */
if (fetestexcept(FE_OVERFLOW)) puts ( "FE_OVERFLOW is set" );
/* testing multiple exceptions: */
fe = fetestexcept (FE_ALL_EXCEPT);
puts ( "The following exceptions are set:" );
if (fe & FE_DIVBYZERO) puts ( "FE_DIVBYZERO" );
if (fe & FE_INEXACT)   puts ( "FE_INEXACT" );
if (fe & FE_INVALID)   puts ( "FE_INVALID" );
if (fe & FE_OVERFLOW)  puts ( "FE_OVERFLOW" );
if (fe & FE_UNDERFLOW) puts ( "FE_UNDERFLOW" );
