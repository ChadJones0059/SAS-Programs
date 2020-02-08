* Declare new data set and input datalines;
data flu;
input Region $ Temp FluIncidence;
datalines;
NorthWest	2.1	0.08
NorthWest	2.9	0.22
NorthWest	10.7	0.02
NorthWest	30.7	0
NorthWest	6	0.28
NorthWest	10.8	0.1
NorthWest	32.7	0
NorthWest	8.6	0.03
NorthWest	-6	0.74
NorthWest	21.7	0
NorthWest	20.4	0.01
NorthWest	30.5	0
NorthWest	22.4	0
NorthWest	28.8	0
NorthWest	8.3	0.04
NorthWest	9.3	0.05
NorthWest	-2.2	0.23
NorthWest	14.2	0.02
NorthWest	23.6	0
NorthWest	6.6	0.03
NorthWest	37.3	0
NorthWest	26.6	0
NorthWest	34.4	0
NorthWest	16.5	0.01
NorthWest	19.4	0
NorthWest	4.8	0.07
NorthWest	20.5	0
NorthWest	20.3	0.01
NorthWest	33.4	0
NorthWest	9.8	0.04
NorthWest	36.4	0
NorthWest	3	0.04
NorthWest	24.4	0
NorthWest	28.2	0
NorthEast	-2.1	1.5
NorthEast	31.4	0.02
NorthEast	20	0.09
NorthEast	1	0.64
NorthEast	24.8	0.06
NorthEast	7.4	0.14
NorthEast	4.6	0.38
NorthEast	21.3	0.06
NorthEast	-1.2	0.93
NorthEast	4.9	0.28
NorthEast	23.1	0.04
NorthEast	8	0.17
NorthEast	30.4	0.02
NorthEast	-0.6	0.34
NorthEast	-0.1	0.99
NorthEast	12.8	0.09
NorthEast	26.4	0.04
NorthEast	0	0.49
NorthEast	31.8	0.02
NorthEast	11.9	0.07
NorthEast	12.1	0.13
NorthEast	31	0.02
NorthEast	25.7	0.04
NorthEast	6	0.33
NorthEast	20.7	0.05
NorthEast	21.2	0.04
NorthEast	24.9	0.05
NorthEast	33.7	0.01
NorthEast	24.3	0.03
NorthEast	-5.6	1.85
NorthEast	33.6	0.02
NorthEast	-5.2	0.41
NorthEast	24	0.04
NorthEast	37.2	0.02
;
run;
* Print data set;
proc print data=flu;
run;
* plot data of Flu Incidence on the y-axis and Temp on the x-axis;
proc plot data=flu;
plot FluIncidence*Temp;
* #1 By plotting this data, we can see that we do not have a linear relationship. We seem to have a quadratic;

label Temp="Temperature";
label FluIncidence="Flu Incidence";
run;
quit;
* #2 By plotting this data, we can see that we do not have a linear relationship. We seem to have a quadratic;
proc gplot data=flu;
plot FluIncidence*Temp;
label Temp="Temperature";
label FluIncidence="Flu Incidence";
run;
quit;

* #3 By plotting this data, we can see that we do not have a linear relationship. We seem to have a quadratic. 
The strength of the relationship is moderate;
proc sgplot data=flu;
scatter x=Temp y=FluIncidence;
label Temp="Temperature";
label FluIncidence="Flu Incidence";
run;
quit;

* #4 Create grouped scatter plot;
proc sgplot data=flu;
scatter x=Temp y=FluIncidence / group=Region;
label temp="Temperature";
label fluincidence="Flu Incidence";
run;

* #5 FluIncidence = 0.45103 -0.01693(Temp). Our intercept is 0.45103 with a std error of 0.05432.
We know that if the temperature is 0, then we have an average value of y = 0.45103;
proc reg data=flu;
model FluIncidence=Temp;
run;
quit;
*#6 37% of total variation can be explained by the model or by the temperature in our North West region;
*We reject null hypothesis of <0.05;
* In our North West region, our R squared is 37.40% This model is a poor fit
In our North East region 53% of total variation can be explained by the model. This model is a better fit, but still not strong;

data NWest;
set flu;
if Region='NorthWes';
run;

data NEast;
set flu;
if Region='NorthEas';
run;
proc reg data=NWest;
model FluIncidence=Temp;
run;
quit;
proc reg data=NEast;
model FluIncidence=Temp;
run;
quit;


