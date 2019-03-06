[build-menu]
EX_00_LB=_Execute
EX_00_CM=pandoc -o %e.html %e.md; open %e.html
EX_00_WD=
FT_00_LB=
FT_00_CM=pandoc --template=mytemplate.latex -o %e.pdf %e.md; open %e.pdf
FT_00_WD=
