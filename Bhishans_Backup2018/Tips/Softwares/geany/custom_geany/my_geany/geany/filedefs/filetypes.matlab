
# Author  : Bhishan Poudel
# Date    : June 15, 2016
# Version : 1.0


[styling]
# Edit these in the colorscheme .conf file intead
default=default
comment=comment
command=function
number=number_1
keyword=keyword_1
string=string_1
operator=operator
identifier=identifier_1
doublequotedstring=string_2

[keywords]
# all items must be in one line
primary=all ans argv atexit bar3 base2dec base64encode bin2dec bitadd bitand bitcmp bitget bitor bitmax bitrotate bitpack bitset bitshift bitxor blanks break case cast catch cd cell cell2mat cell2struct cellslices cellindexmat cellstr ceil celldisp char class classdef clc cleanpu clear close columns complex continue contour copyfile cos cstrcat deblank dec2base dec2bin dec2hex delete deps diary dir disp display dlmread do doc double echo else elseif end endclassdef endenumeration endevents endfor endfunction endif endmethods endparfor endproperties endswitch endwhile enumeration eol error events exist exp ezplot false fclose flintmax fflush fgets  fieldnames figure file  fileattrib findstr fopen for fprintf function fwrite gca gcf genvarname getfield global help hex2dec hex2num history hold on off idivide if ind2sub index info inline input int2str int8 int16 int32 int64 intmax intmin inv isa isalnum isalpha isascii isbanded iscell iscellstr ischar iscntrl iscolumn iscomplex isdefinite isdiag isdigit isdir isempty isfield isfloat isglobal isgraph ishermitian isindex isinteger isletter islogical islower isprint isupper isna ismatrix isnull isspace isprime inumeric ispunct isreal isrow isscalar isstrprop issquare isstruct issymmetric istril istrilu isvarname isvector isxdigit legend length line linspace load log logical logspace lookfor ls mat2cell mat2str mean meshgrid methods mkdir mod movefile NA namelengthmax ndims news num2cell num2hex num2str numel numfields ones orderfields ostrsplit otherwise output pack parfor pause persistent pinv pkg plot precision print properties protect pwd quad quit recycle regexp regexpi regexprep regextranslate repmat reshape return rindex rmfield rows save set setfield sigmoid sin single size sizemax sizeof source sprintf squeeze std stdout str2double str2num strcat strchr strcmp strcmpi strfind strjoin strjust strmatch strncmpi strlen strread strrep strsplit strtok strtrim strtrunc struct struct2cell strvcat sub2ind substr substruct sum surf swapbites switch sym tan textread title toascii tolower toupper true try type typecast typeinfo uint8 uint16 uint32 uint64 untabify until unwind unwind visdiff what which while who whos xlabel ylabel zeros ... axis eye find fminunc optimset sparse


# words after zeros are added later

[settings]
# default extension used when saving files
extension=m

# the following characters are these which a "word" can contains, see documentation
wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# single comments, like # in this file
comment_single=%
# multiline comments
#comment_open=
#comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[indentation]
#width=4
# 0 is spaces, 1 is tabs, 2 is tab & spaces
#type=1

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
compiler=
run_cmd=

[build-menu]
FT_00_LB=Execute
FT_00_CM=/usr/local/octave/3.8.0/bin/octave '%f'
FT_00_WD=
EX_00_LB=_Execute
EX_00_CM=/usr/local/octave/3.8.0/bin/octave '%f'
EX_00_WD=
