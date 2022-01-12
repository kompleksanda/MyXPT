XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
	  \ _common/common


XPT edge 
XSET color=ChooseStr("Red", "green", "Blue", "Cyan", "Grey", "Voilet", "darkgreen", "darkblue")
XSET style=ChooseStr("bold", "dotted")
XSET MORE\.\..post=BuildIfNoChange(", `prop!!^")
XSETm $prop!!
color=color=`color^`, `MORE..^
style=style=`style^`, `MORE..^
XSETm END
`edge^` `details...{{^ [`prop!!^]`}}^;

XPT connection setting=edge
XSET connection_type=ChooseStr("->", "--")
XSET node2.ontype=ACMB({'\V\^\zs{\$':NextC('{`nodes..^ExpandInsideEdge2(" ", "")^^}')})
XSET MORE\.\..post=BuildIfNoChange(", `prop!!^")
XSETm $prop!!
style=style=`style^`, `MORE..^
label=label="`str^"`, `MORE..^
penwidth=penwidth=`num^`, `MORE..^
fontcolor=fontcolor=`color^`, `MORE..^
XSETm END
`node1^ `connection_type^ `node2^` `edge_prop...{{^ [`prop!!^]`}}^;

XPT rankdir 
rankdir=LR

XPT nodesep 
nodesep=`1.0^

XPT rank 
{rank=`same^; `names..^ExpandInsideEdge2(" ", "")^^}

XPT label 
label="`name^"

XPT node setting=edge " .. [...]
XSET shape=Choose(['box',  'polygon',  'ellipse',  'circle',  'point',  'egg',  'triangle',  'plaintext',  'diamond',  'trapezium',  'parallelogram',  'house',  'pentagon',  'hexagon',  'septagon',  'octagon',  'doublecircle',  'doubleoctagon',  'tripleoctagon',  'invtriangle',  'invtrapezium',  'invhouse',  'Mdiamond',  'Msquare',  'Mcircle',  'rect',  'rectangle',  'none',  'note',  'tab',  'folder',  'box3d',  'component', 'record', 'Mrecord'])
XSET style=ChooseStr("filled","dummy")
XSET font=ChooseStr("Courier","dummy")
XSET MORE\.\..post=BuildIfNoChange(", `details!!^")
XSETm $details!!
shape=shape=`shape^`, `MORE..^
label=label="`label^"`, `MORE..^
color=color=`color^`, `MORE..^
fontcolor=fontcolor=`color^`, `MORE..^
fontsize=fontsize=`num^`, `MORE..^
style=style=`style^`, `MORE..^
fillcolor=fillcolor=`color^`, `MORE..^
fontname=fontname=`font^
XSETm END
`node^` `details...{{^[`details!!^]`}}^;
..XPT
