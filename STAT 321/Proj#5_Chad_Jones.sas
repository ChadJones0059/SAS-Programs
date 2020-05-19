* #1 Find the number of crimes using a Knife;
* Create a table that counts the number of times the weapon 'Knife' was used;
proc sql;
create table Knife as
select count(Total_Incidents) as Knife_Crimes
from BaltCrime
where Weapon='KNIFE';
quit;
* Print out the total;
* Double check to see if this is correct  *********  9,258;
proc sql;
select * from Knife;
quit;

* #2 Find the number of crimes by district;
proc sql;
select District, sum(Total_Incidents) as Number_of_Crimes
from BaltCrime
group by District;
quit;

* #3 Find the number of knife crimes by Neighborhood by year 
(you may want to use year() function first to extract year from a date variable);

proc sql;
select year(CrimeDate) as Year, Neighborhood, 
sum(Total_Incidents) as Knife_Crimes
from BaltCrime
where Weapon='KNIFE'
group by Neighborhood, year
order by year;
quit; * Confirm whats going on in those first 2 rows;

* #4 Find the number of knife crimes by year;
proc sql;
select year(CrimeDate) as Year, sum(Total_Incidents) as Annual_Knife_Crimes
from BaltCrime
where Weapon='KNIFE'
group by year
order by year;
quit;

* #5 Use CrimeCode to find the number of Aggravated Assaults by year;
proc sql;
select CrimeCode, year(CrimeDate) as Year, 
sum(Total_Incidents) as Number_of_Agg_Assault_Crimes
from BaltCrime
where Description='AGG. ASSAULT'
group by CrimeCode, year;
order by year;
quit; 
* There are 4 different Crime Codes 4A, 4B, 4C and 4D for Agg Assault;
* We need to summation these Crime Codes;
* Create new table where we only search by those 4 Crime Codes;
proc sql;
create table Agg_Data as
select year(CrimeDate) as Year, 
sum(Total_Incidents) as Number_of_Agg_Assault_Crimes
from BaltCrime
where CrimeCode in('4A','4B','4C','4D')
group by year
order by year;
quit;
proc sql;
select * from Agg_Data;
quit;

* #6 Use CrimeCode to find the number of Common Assaults by year;

proc sql;
select CrimeCode, year(CrimeDate) as Year, 
sum(Total_Incidents) as Number_of_Comm_Assault_Crimes
from BaltCrime
where Description='COMMON ASSAULT'
group by CrimeCode, year;
order by year;
quit;	* We only have Crime Code 4E with Common Assault;

* Create our new table with the same info we need for Common Assault;
proc sql;
create table Comm_Data as
select year(CrimeDate) as Year, 
sum(Total_Incidents) as Number_of_Comm_Assault_Crimes
from BaltCrime
where CrimeCode='4E'
group by year
order by year;
quit;
proc sql;
select * from Comm_Data;
quit;

* #7 Create a dataset that has year, number of Aggravated Assaults 
and number of Common Assaults;

proc sql;
create table Agg_Comm_Data as
select Agg.year as Year, 
Agg.Number_of_Agg_Assault_Crimes, Comm.Number_of_Comm_Assault_Crimes
from Agg_Data as Agg, Comm_Data as Comm
where Agg.year=Comm.year;
quit;
proc sql;
select * from Agg_Comm_Data;
quit;

****** Double Check all this, but I think its correct;

