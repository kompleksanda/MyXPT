XPTemplate priority=sub

XPTinclude
	\ c/c_library
XPT header_vector "<vector> example
//#include <vector>
vector<string> namevec;
namevec.push_back("alex");
namevec.push_back("is");
namevec.push_back("a");
namevec.push_back("boy");
std::cout << namevec.size() << std::endl;
vector<string>::iterator nameite = namevec.begin();
while ( nameite != namevec.end() )
{
        std::cout << *nameite << std::endl;
        nameite++;
}

XPT template_function " T <fName>( ... ) { ... }
template <typename `T^>
inline `T^ const& `Max^ (`T^ const& a, `T^ const& b){
        return a > b ? a : b;
}

XPT allocate " <type>* <name> = NULL; <name> = new <type>
`double^* `name^ = NULL;
if (!(`name^ = new `double^)) {
        std::cout << "Can't allocate: Out of Memory" << std::endl;
}
`cursor^
/* ... */
delete` `IS ARRAY?`{{^ []`}}^ `name^;

XPT file_write_TEMPLATE " <name>.open\(..); <name> << .. <<; <name>.close\(..)
XSET mode=Choose(["std::ios::app", "std::ios::ate", "std::ios::in", "std::ios::out", "std::ios:trunk"])
XSET mode.post=ExpandInsideEdge(' | ','')
//#include <fstream>
std::ofstream `outfile^;
`outfile^.open(`"assa.txt"^, `mode^);
`outfile^ << "Alexander the greatest" << std::endl;
`outfile^.close();

XPT file_read_TEMPLATE
//#include <fstream>
char data[100];
std::ifstream `outfile^;
`outfile^.open(`"assa.txt"^);
`outfile^ >> data;
std::cout << data << std::endl;
`outfile^.close();

XPT get_user_input "std::cin.getline\(<char[] var>, <bytes>)
char data[100];
std::cin.getline(data, 100);

XPT virtual_function " virtual <type> <name> = 0 \(Used in Classes, function must be defined by subclasses)
virtual `ret_type^ `func_name^( `^ ) = 0;

XPT class   " class ..
class `className^` `INHERITS...`{{^: public `otherClass^` `INHERIT...`{{^, public `otherClass^` `INHERIT...^`}}^`}}^
{
    public:
        `className^(`ctorParam?^);
        ~`className^();
        `className^(const `className^ &cpy);
        `cursor^
    private:
};

`className^::`className^(`ctorParam?^){
}

`className^::~`className^(){
}

`className^::`className^(const `className^ &cpy){
}

XPT operator_overload " <cl> operator+(const <cl>& <name>){ ... }
XSET $_preValues_={"arg":1,"block":1,"type":"","className":1}
XSET ComeFirst=sign
XSET $sign=+ - * / % ^ & | ~ ! , = < > <= >= ++ -- << >> == != && || += -= /= %= ^= &= |= *= <<= >>= [] () -> ->* new new[] Delete delete[]
XSET $sign=split($sign,' ')
XSET $arg=execut('if g:_Sign == "<<"
XSET $arg+=|        echo "ostream &output, const '.R\("className").'& obj"
XSET $arg+=|        elseif g:_Sign == ">>"
XSET $arg+=|          echo "istream &input, const '.R\("className").'& obj"
XSET $arg+=|   elseif index\(["<",">","<=",">=","==","!=","="],g:_Sign)!=-1
XSET $arg+=|          echo "const `className^& otherObj"
XSET $arg+=|        elseif index\(["++","--"],g:_Sign)!=-1
XSET $arg+=|          echo "``POSTFIX...`{{^int`}}^"
XSET $arg+=|        elseif g:_Sign == "()"
XSET $arg+=|          echo "`argg^ExpandInsideEdge2(\", \",\"\")^^"
XSET $arg+=|        elseif g:_Sign == "[]"
XSET $arg+=|          echo "int i"
XSET $arg+=|        else
XSET $arg+=|echo "``NON_UNARY...`{{^const `R\("className")^& otherObj`}}^" 
XSET $arg+=|        endif')
XSET $type=execut('let g:_Sign = "'.R\("sign").'" 
XSET $type+=|       echo index\(["<<",">>"], g:_Sign) != -1 ? "friend ":""')
XSET $className+=execut('if g:_Sign == "<<" 
XSET $className+=|           echo "ostream" 
XSET $className+=|         elseif g:_Sign == ">>" 
XSET $className+=|           echo "istream" 
XSET $className+=|elseif index\(["<",">","<=",">=","==","!="],g:_Sign)!=-1 
XSET $className+=|           echo "bool" 
XSET $className+=|         elseif g:_Sign == "=" 
XSET $className+=|           echo "void" 
XSET $className+=|         elseif g:_Sign == "[]" 
XSET $className+=|           echo "`className^ &" 
XSET $className+=|          else | echo "`className^" 
XSET $className+=|         endif')
XSET $blk=execut('if g:_Sign == "<<" 
XSET $blk+=|           echo "output << `cursor^;\nreturn output;" 
XSET $blk+=|         elseif g:_Sign == ">>" 
XSET $blk+=|           echo "input >> `cursor^;\nreturn input;" 
XSET $blk+=|       elseif index\(["<",">","<=",">=","==","!="],g:_Sign)!=-1 
XSET $blk+=|           echo "`cursor^\nreturn false;" 
XSET $blk+=|         elseif g:_Sign == "=" 
XSET $blk+=|           echo "`cursor^;" 
XSET $blk+=|         elseif g:_Sign == "[]" 
XSET $blk+=|           echo "if (i > SIZE){\n\tcout << \"index out of 
XSET $blk+=            bounds\" << endl;\n}\n`cursor^;" 
XSET $blk+=|         else 
XSET $blk+=|           echo "'.R\("className").' returnObj;\n`cursor^
XSET $blk+=            \nreturn returnObj;" | endif ')
`type^Z($type)^`className^Z($className)^ operator`sign^$sign^(`arg^Z($arg)^)
{
    `block^Z($blk)^
}

XPT thread_TEMPLATE
XSETm $template
#include <iostream>
#include <pthread.h>
using namespace std;
#define NUM_THREADS 5
void *PrintHello(void *threadid)
{
	long tid;
	tid = (long)threadid;
	cout << "Hello World! Thread ID, " << tid << endl;
	pthread_exit(NULL);
}
int main ()
{
	pthread_t threads[NUM_THREADS];
	int rc;
	int i;
	for( i=0; i < NUM_THREADS; i++ ){
		cout << "main() : creating thread, " << i << endl;
		rc = pthread_create(&threads[i], NULL, PrintHello, (void *)i);
		if (rc){
			cout << "Error:unable to create thread," << rc << endl;
			exit(-1);
		}
	}
	pthread_exit(NULL);
}
XSETm END
XSETm $template_arg
#include <iostream>
#include <pthread.h>
using namespace std;
#define NUM_THREADS 5
struct thread_data{
	int thread_id;
	char *message;
};
void *PrintHello(void *threadarg)
{
	struct thread_data *my_data;
	my_data = (struct thread_data *) threadarg;
	cout << "Thread ID : " << my_data->thread_id ;
	cout << " Message : " << my_data->message << endl;
	pthread_exit(NULL);
}
int main ()
{
	pthread_t threads[NUM_THREADS];
	struct thread_data td[NUM_THREADS];
	int rc;
	int i;
	for( i=0; i < NUM_THREADS; i++ ){
		cout <<"main() : creating thread, " << i << endl;
		td[i].thread_id = i;
		td[i].message = "This is message";
		rc = pthread_create(&threads[i], NULL,
		PrintHello, (void *)&td[i]);
		if (rc){
			cout << "Error:unable to create thread," << rc << endl;
			exit(-1);
		}
	}
	pthread_exit(NULL);
}
XSETm END
XSET choose=NextC(pickL({"Creating Threads":{"action":"text","text":$template},"Passing argument to Thread":{"action":"text","text":$template_arg}}))
`choose^

XPT thread_create
XSET thread=ChooseStr("pthread_t `name^","")
XSET $_postValues_={"thread|routine_arg": "Embed(V())"}
XSET attribute=Choose([{"word":"NULL","info":"An opaque attribute object that may be used to set thread attributes. You can specify a thread attributes object, or NULL for the default values."},{"word":""}])
XSET routine=Choose([{"word":"func_name","info":"callback function name"},{"word":""}])
XSET routine_arg=Choose([{"word":"(void *)&`arg^","info":"A single argument that may be passed to start_routine. It must be passed by reference as a pointer cast of type void. NULL may be used if no argument is to be passed."},{"word":"NULL"}])
pthread_create(`thread^, `attribute^, `routine^, `routine_arg^);

XPT thread_exit
pthread_exit(NULL)

XPT signal "signal\( .. )
XSET signal=Choose([{"word":"SIGABRT","menu":"Abnormal termination of the program, such as a call to abort"},{"word":"SIGFPE","menu":"An erroneous arithmetic operation, such as a divide by zero or an operation resulting in overflow."},{"word":"SIGILL","menu":"Detection of an illegal instruction"},{"word":"SIGINT","menu":"Receipt of an interactive attention signal."},{"word":"SIGSEGV","menu":"An invalid access to storage."},{"word":"SIGTERM","menu":"A termination request sent to the program."}])
signal(`signal^, `signalHandlingFunction^);

XPT signal_TEMPLATE
#include <iostream>
#include <csignal>
using namespace std;
void signalHandler( int signum )
{
	cout << "Interrupt signal (" << signum << ") received.\n";
	// cleanup and close up stuff here 
	// terminate program 
	exit(signum); 
}
int main ()
{
	// register signal SIGINT and signal handler 
	signal(SIGINT, signalHandler); 
	while(1){
		cout << "Going to sleep...." << endl;
		sleep(1);
	}
	return 0;
}

XPT signal_raise " raise\( <signal> )
XSET $_import_={"signal":{"defaultValues":"signal"}}
raise(`signal^);

XPT define "#define <name> <value>
XSET value=Embed(XS('if xfunc.R\("name") =~ ''\V\^\w\*(\.\*)''|retu"( `cursor^ )"|el|retu "`Value^"|en'))
#define `name^UpperCase(V())^  `value^

XPT template_TEMPLATE
#include <iostream>
#include <vector>
#include <cstdlib>
#include <string>
#include <stdexcept>
using namespace std;
template <class T>
class Stack {
	private:
		vector<T> elems; // elements 
	public:
		void push(T const&); // push element 
		void pop(); // pop element 
		T top() const; // return top element 
		bool empty() const{ // return true if empty.
			return elems.empty();
		}
};
template <class T>
void Stack<T>::push (T const& elem)
{
	// append copy of passed element 
	 elems.push_back(elem); 
}
template <class T>
void Stack<T>::pop ()
{
	if (elems.empty()) {
	throw out_of_range("Stack<>::pop(): empty stack");
	}
	// remove last element 
	elems.pop_back(); 
}
template <class T>
T Stack<T>::top () const
{
	if (elems.empty()) {
		throw out_of_range("Stack<>::top(): empty stack");
	}
	// return copy of last element 
	return elems.back(); 
}
int main()
{
	try {
		Stack<int> intStack; // stack of ints 
		Stack<string> stringStack; // stack of strings 
		// manipulate int stack 
		intStack.push(7);
		cout << intStack.top() <<endl;
		// manipulate string stack 
		stringStack.push("hello");
		cout << stringStack.top() << std::endl;
		stringStack.pop();
		stringStack.pop();
	}
	catch (exception const& ex) {
		cerr << "Exception: " << ex.what() <<endl;
		return -1;
	}
}

XPT try alias=try
XSET except=ChooseStr("const char* msg","std::exception& e")

XPT datetime_TEMPLATE
XSETm $datetime
#include <iostream>
#include <ctime>
using namespace std;
int main( )
{
	// current date/time based on current system
	time_t now = time(0);

	// convert now to string form
	char* dt = ctime(&now);
	cout << "The local date and time is: " << dt << endl;
	// convert now to tm struct for UTC
	tm *gmtm = gmtime(&now);
	dt = asctime(gmtm);
	cout << "The UTC date and time is:"<< dt << endl;
}
XSETm END
XSETm $datetime_tm
#include <iostream>
#include <ctime>
using namespace std;
int main( )
{
	// current date/time based on current system
	time_t now = time(0);
	cout << "Number of sec since January 1,1970:" << now << endl;
	tm *ltm = localtime(&now);
	// print various components of tm structure.
	cout << "Year: "<< 1900 + ltm->tm_year << endl;
	cout << "Month: "<< 1 + ltm->tm_mon<< endl;
	cout << "Day: "<< ltm->tm_mday << endl;
	cout << "Time: "<< 1 + ltm->tm_hour << ":";
	cout << 1 + ltm->tm_min << ":";
	cout << 1 + ltm->tm_sec << endl;
}
XSETm END
`choose^NextC(pickL({"Current date & time":{"action":"text","text":$datetime},"Format time using struct tm":{"action":"text","text":$datetime_tm}}))^

