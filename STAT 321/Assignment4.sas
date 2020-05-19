* #1 Convert the data format from wide to long. ;
* Import data;
* Need to combined Time values into one column;
* Declare new variable to hold all Times from Time1 Time2 Time3;
* Declare new variable 'Position' to keep track of Time;
data Rxdata;
infile 'C:\Users\Chads Laptop\Documents\VCU\STAT 321\RXData.csv'
	dsd delimiter=',' firstobs=2;
input Subject $ Treatment $ Time1 Time2 Time3;
run;
* Print out original formatting of data;
proc print data=Rxdata;
run;
* Put into sql format;
proc sql;
select * from Rxdata;
quit;
* Making new dataset for Time1 with new variables;
data RxdataT1;
set Rxdata;
Time=Time1;
Position=1;
drop Time1 Time2 Time3;
run;
* Making new dataset for Time2 with new variables;
data RxdataT2;
set Rxdata;
Time=Time2;
Position=2;
drop Time1 Time2 Time3;
run;
* Making new dataset for Time3 with new variables;
data RxdataT3;
set Rxdata;
Time=Time3;
Position=3;
drop Time1 Time2 Time3;
run;
* Making new dataset from wide to long;
data LongRxdata;
set RxdataT1 RxdataT2 RxdataT3;
run;
quit;
* Print data set in sql;
proc sql;
select * from LongRxdata;
quit;

* #2 Conduct an ANOVA test to determine if differences in mean time differs across treatment.
Be sure to state your hypothesis, significance level, decision rule and conclusion in the comments. 
Test using alpha = 0.05;

* Hypothesis for Time1:
* H0: mu1 = mu2 = mu3;
* HA: at least 2 mu differ;
* Significance level: alpha = 0.05;

proc glm data=Rxdata;
class Treatment;
model Time1=Treatment;
run;
quit;
* Our p-value is < 0.0001 which is much smaller than our alpha
of 0.05, therefore we reject the null hypothesis;

* Hypothesis for Time2:
* H0: mu1 = mu2 = mu3;
* HA: at least 2 mu differ;
* Significance level: alpha = 0.05;

proc glm data=Rxdata;
class Treatment;
model Time2=Treatment;
run;
quit;
* Again we can see our p-value is < 0.0001 which is much smaller than our alpha
of 0.05, therefore we reject the null hypothesis;

* Hypothesis for Time3:
* H0: mu1 = mu2 = mu3;
* HA: at least 2 mu differ;
* Significance level: alpha = 0.05;

proc glm data=Rxdata;
class Treatment;
model Time3=Treatment;
run;
quit;
* Again we can see our p-value is < 0.0001 which is much smaller than our alpha
of 0.05, therefore we reject the null hypothesis;

* #3 Conduct a post hoc test to determine where the differences exist in the
data using Tukey's HSD procedure;
* Find where these differences exist;

* Time1;
proc glm data=Rxdata;
class Treatment;
model Time1=Treatment;
lsmeans Treatment / adjust=Tukey;
run;
quit;
* From our results we see that Control and High have the largest statistical differences
with a p-value of 0.0007 which is less than our alpha of 0.05;

* Time2;
proc glm data=Rxdata;
class Treatment;
model Time2=Treatment;
lsmeans Treatment / adjust=Tukey;
run;
quit;
* From our results we see that Low and High, have the largest statistical differences
with a p-value of 0.0001 which is less than our alpha of 0.05;

* Time3;
proc glm data=Rxdata;
class Treatment;
model Time3=Treatment;
lsmeans Treatment / adjust=Tukey;
run;
quit;
* From our results we see that Medium and High have the largest statistical differences
with a p-value of 0.0001 which is less than our alpha of 0.05;
