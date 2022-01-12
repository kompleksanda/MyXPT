XPTemplate priority=sub

XPTinclude
    \ _common/personal
	\ c/c

let s:f = g:XPTfuncs()

XPT class
class `className^` `INHERITS...`{{^ : `public^ChooseStr("public", "private", "protected")^ `anoClass^`}}^
{``PROTECTED..`{{^
    protected:
        //protected expressions
        int handle;
        double main[];`}}^
``PRIVATE..`{{^
    private:
        //private expressions`}}^
    public:
        //public expressions
        double Main(int pShift=0);
        void Release();
        `className^();
    
    `className^::`className^(`params^) {

    }
};

