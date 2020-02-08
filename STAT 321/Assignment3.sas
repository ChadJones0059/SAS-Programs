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
*h0: mu1 = mu2 The null hypothesis is the mean task completion time for T1 of participants on Repoxodin being equal 
to the mean task completion time for participants NOT on repoxodin;
*hA: mu1 != mu2 The alternative hypothesis is that the mean task completion times are NOT equal (Repoxodin usage affects completion time);
proc ttest data=impulse alpha=0.035;
var T1;
class Repoxodin;
run;
*Results from T1 at the alpha = 0.035, there is some evidence to conclude that Repoxodin treatment can have different mean 
response times for T1;
*Reject if p-value is less than alpha. P-value = 0.3109 > 0.035 we fail to reject the null hypothesis
*We can see between the Control and Repoxodin our distributions have only become slightly left skewed;

*h0: mu1 = mu2 The null hypothesis is the mean task completion time for T2 of participants on Repoxodin being equal 
to the mean task completion time for participants NOT on repoxodin;
*hA: mu1 != mu2 The alternative hypothesis is that the mean task completion times are NOT equal (Repoxodin usage affects completion time);
proc ttest data=impulse alpha=0.035;
var T2;
class Repoxodin;
run;
*Results from T2 at the alpha = 0.035, there is evidence to conclude that Repoxodin treatment can have different mean 
response times for T2;
*Reject if p-value is less than alpha. P-value = 0.6404 > 0.035 we fail to reject the null hypothesis;
*Our distributions of Control and Repoxodin have only become slightly left skewed;

*h0: mu1 = mu2 The null hypothesis is the mean task completion time for T3 of participants on Repoxodin being equal 
to the mean task completion time for participants NOT on repoxodin;
*hA: mu1 != mu2 The alternative hypothesis is that the mean task completion times are NOT equal (Repoxodin usage affects completion time);
proc ttest data=impulse alpha=0.035;
var T3;
class Repoxodin;
run;
*Results from T3 at the alpha = 0.035, there is significant evidence to conclude that Repoxodin treatment can have different mean 
response times for T3;
*Reject if p-value is less than alpha. P-value = 0.2247 > 0.035 we fail to reject the null hypothesis;

*h0: mu1 = mu2 The null hypothesis is the mean task completion time for T4 of participants on Repoxodin being equal 
to the mean task completion time for participants NOT on repoxodin;
*hA: mu1 != mu2 The alternative hypothesis is that the mean task completion times are NOT equal (Repoxodin usage affects completion time);
proc ttest data=impulse alpha=0.035;
var T4;
class Repoxodin;
run;
*Results from T4 at the alpha = 0.035, there is evidence to conclude that Repoxodin treatment can have different mean 
response times for T4;
*Reject if p-value is less than alpha. P-value = 0.0735 > 0.035 we fail to reject the null hypothesis;
*At the alpha = 0.035 level of significance, there is 

*Part 2 TTest for gender;



*h0: mu1 = mu2 The null hypothesis is the mean task completion time for T1 male participants being equal to the 
mean task completion time for female participants;
*hA: mu1 != mu2 The alternative hypothesis is that the mean task completion times are NOT equal;
*alpha=0.05;
proc ttest data=impulse alpha=0.05;
var T1;
class Gender;
run;
*Results from T1 at the alpha = 0.05, there is significant evidence to conclude that Gender treatments can have different mean 
response times for T1;
*Reject if p-value is less than alpha. P-value = 0.0370 < 0.05 we reject the null hypothesis;

*h0: mu1 = mu2 The null hypothesis is the mean task completion time for T2 male participants being equal to the 
mean task completion time for female participants;
*hA: mu1 != mu2 The alternative hypothesis is that the mean task completion times are NOT equal;
*alpha=0.05;
proc ttest data=impulse alpha=0.05;
var T2;
class Gender;
run;
*Results from T2 at the alpha = 0.05, there is not enough evidence to conclude that Gender treatments can have different mean 
response times for T2;
*Reject if p-value is less than alpha. P-value = 0.8646 > 0.05 we fail to reject the null hypothesis;
*We have insufficient evidence to conclude that gender causes statistically different mean response times;

*h0: mu1 = mu2 The null hypothesis is the mean task completion time for T3 male participants being equal to the 
mean task completion time for female participants;
*hA: mu1 != mu2 The alternative hypothesis is that the mean task completion times are NOT equal;
*alpha=0.05;
proc ttest data=impulse alpha=0.05;
var T3;
class Gender;
run;
*Results from T3 at the alpha = 0.05, there is not enough evidence to conclude that Gender treatments can have different mean 
response times for T3;
*Reject if p-value is less than alpha. P-value = 0.1100 > 0.05 we fail to reject the null hypothesis;
*We have insufficient evidence to conclude that gender causes statistically different mean response times;

*h0: mu1 = mu2 The null hypothesis is the mean task completion time for T4 male participants being equal to the 
mean task completion time for female participants;
*hA: mu1 != mu2 The alternative hypothesis is that the mean task completion times are NOT equal;
*alpha=0.05;
proc ttest data=impulse alpha=0.05;
var T4;
class Gender;
run;
*Results from T4 at the alpha = 0.05, there is not enough evidence to conclude that Gender treatments can have different mean 
response times for T4;
*Reject if p-value is less than alpha. P-value = 0.5074 > 0.05 we fail to reject the null hypothesis;
*We have insufficient evidence to conclude that gender causes statistically different mean response times;


*Part 3 Test assumptions;



proc glm data=impulse;
class Repoxodin;
model T1=Repoxodin;
lsmeans Repoxodin / adjust=tukey;
run;

proc glm data=impulse;
class Repoxodin;
model T2=Repoxodin;
lsmeans Repoxodin / adjust=tukey;
run;

proc glm data=impulse;
class Repoxodin;
model T3=Repoxodin;
lsmeans Repoxodin / adjust=tukey;
run;

proc glm data=impulse;
class Repoxodin;
model T4=Repoxodin;
lsmeans Repoxodin / adjust=tukey;
run;

proc glm data=impulse;
class Gender;
model T1=Gender;
lsmeans Gender / adjust=tukey;
run;
