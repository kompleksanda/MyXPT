if !g:XPTloadBundle( 'python', 'django' )
    finish
endif

XPTemplate priority=lang

XPTinclude
	  \ python/django/_common
	  \ python/django/*

