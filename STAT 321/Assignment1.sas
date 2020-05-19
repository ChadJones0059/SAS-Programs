*Chad Jones;

*manually enter data;
*name our variables ;
data impulse;
input ID $ Repoxodin $ Gender $ T1 T2 T3 T4;
datalines;
24 R F 40 55 48 46
25 R M 39 42 46 45
26 R F 42 48 45 44
27 R M 35 39 40 49
28 R M 38 41 39 40
29 R F 46 43 44 45
30 R F 47 52 41 47
31 R M 31 50 47 48
32 R M 32 39 43 45
33 R F 50 45 39 40
34 R M 36 46 48 45
35 R F 45 44 47 48
36 R F 43 38 45 40
37 R M 32 40 44 45
38 R M 31 45 49 47
39 R F 55 52 41 44
40 R F 46 44 43 45
01 C M 31 48 45 48
02 C F 43 47 48 43
03 C M 33 39 46 48
04 C F 48 40 43 44
05 C F 46 45 49 50
06 C M 35 36 45 47
07 C F 50 39 43 48
08 C M 47 48 56 50
09 C F 55 49 48 53
10 C M 60 54 55 59
;
run;
*print to output window;
proc print data=impulse;
run;
*data create new subset with ONLY Repoxodin;
data impulse_repox;
set impulse;
if Repoxodin = 'R';
run;
*print to output window;
proc print data=impulse_repox;
run;
*create another new data set with NO Repoxodin;
data impulse_NOrepox;
set impulse;
if Repoxodin = 'C';
run;
*print to output window;
proc print data=impulse_NOrepox;
run;
*create a new subset with only Males;
data impulse_male;
set impulse;
if Gender = 'M';
run;
*print to output window;
proc print data=impulse_male;
run;
*create a new subset with only Females;
data impulse_female;
set impulse;
if Gender = 'F';
run;
*print to output window;
proc print data=impulse_female;
run;
* get summary statistics for impulse;
proc means data=impulse;
var T1 T2 T3 T4;
run;
*get summary statistics for impulse_Repoxodin;
proc means data=impulse_repox;
var T1 T2 T3 T4;
run;
*get summary statistics for impulse_NOrepox;
proc means data=impulse_NOrepox;
var T1 T2 T3 T4;
run;
*get summary statistics for impulse_male;
proc means data=impulse_male;
var T1 T2 T3 T4;
run;
*get summary statistics for impulse_female;
proc means data=impulse_female;
var T1 T2 T3 T4;
run;

