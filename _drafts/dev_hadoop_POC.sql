// Script to download datai
#!/bin/bash
year=1987
while [ $year -lt 1990 ]
do
for (( i=1; i <= 12; i++ ))
do
cd /home/hpuser/cloudera-data/airlines_data
str=$year"_"$i
echo "http://tsdata.bts.gov/PREZIP/On_Time_On_Time_Performance_$str.zip" &>> //home/hpuser/cloudera-data/airlines_data/links.txt
wget http://tsdata.bts.gov/PREZIP/On_Time_On_Time_Performance_$str.zip
done
year=$((year+1))
done

// unzip all the zipped files to get CSV
unzip -o '*.zip' -d /home/cygwin/airlines_data/unzipped

// Load to HDFS
hadoop fs -put * /user/cygwin/airlines_data 
HADOOP_USER_NAME=cygwin hdfs dfs -put * /user/cygwin/data

// beeline connection
!connect jdbc:hive2://localhost:10000

// create database
CREATE DATABASE IF NOT EXISTS airlines_data
comment 'Flight on time performance data from 1987 to 2016';

// Create table
CREATE EXTERNAL TABLE if not exists airlines (
Year int,
Quarter int,
Month int,
DayofMonth int,
DayOfWeek int,
FlightDate string,
UniqueCarrier string,
AirlineID int,
Carrier string,
TailNum string,
FlightNum int,
OriginAirportID int,
OriginAirportSeqID int, 
OriginCityMarketID int, 
Origin string,
OriginCityName string,
OriginState string,
OriginStateFips int,
OriginStateName string,
OriginWac int,
DestAirportID int,
DestAirportSeqID int,
DestCityMarketID int,
Dest string,
DestCityName string,
DestState string,
DestStateFips int,
DestStateName string,
DestWac int,
CRSDepTime int,
DepTime int,
DepDelay int,
DepDelayMinutes int, 
DepDel15 int,
DepartureDelayGroups int,
DepTimeBlk string,
TaxiOut int,
WheelsOff int,
WheelsOn int,
TaxiIn int, 
CRSArrTime int,
ArrTime int,
ArrDelay int,
ArrDelayMinutes int,
ArrDel15 int,
ArrivalDelayGroups int,
ArrTimeBlk string,
Cancelled int,
CancellationCodeDiverted int,
CRSElapsedTime int,
ActualElapsedTime int,
AirTime int,
Flights int,
Distance int,
DistanceGroup int,
CarrierDelay int,
WeatherDelay int, 
NASDelay int,
SecurityDelay int, 
LateAircraftDelay int,
FirstDepTime int,
TotalAddGTime int,
LongestAddGTime int,
DivAirportLandings int,
DivReachedDest int,
DivActualElapsedTime int,
DivArrDelay int,
DivDistance int,
Div1Airport string,
Div1AirportID  int,
Div1AirportSeqID int,
Div1WheelsOn int,
Div1TotalGTime int,
Div1LongestGTime int,
Div1WheelsOff int,
Div1TailNum string,
Div2Airport string,
Div2AirportID int,
Div2AirportSeqID int,
Div2WheelsOn int,
Div2TotalGTime int,
Div2LongestGTime int,
Div2WheelsOff int,
Div2TailNum string,
Div3Airport string,
Div3AirportID int,
Div3AirportSeqID int,
Div3WheelsOn int,
Div3TotalGTime int,
Div3LongestGTime int, 
Div3WheelsOff int,
Div3TailNum string,
Div4Airport string,
Div4AirportID int,
Div4AirportSeqID int,
Div4WheelsOn int,
Div4TotalGTime int,
Div4LongestGTime int,
Div4WheelsOff int,
Div4TailNum string,
Div5Airport string,
Div5AirportID int,
Div5AirportSeqID int,
Div5WheelsOn int,
Div5TotalGTime int,
Div5LongestGTime int,
Div5WheelsOff int,
Div5TailNum string
) 
COMMENT 'Data about Flight on time performance and delay from public source - bucketed by year'
CLUSTERED BY (year) INTO 30 BUCKETS
row format delimited 
fields terminated by ',' 
lines terminated by '\n'
STORED AS TEXTFILE
tblproperties ("skip.header.line.count"="1");

// load data
set hive.enforce.bucketing = true; 
Load data INPATH '/user/cygwin/data'
overwrite into TABLE airlines;

// query from buckets
SELECT count(*) FROM airlines tablesample(bucket 1 out of 30 on year);


//
#!/bin/bash

# Enable hive compression
SET hive.exec.compress.output=true;
SET mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type=BLOCK;

# enable bucketing
set hive.enforce.bucketing = true;

# create textfile format table
CREATE EXTERNAL TABLE if not exists air1 (
Year int,
Quarter int,
Month int,
DayofMonth int,
DayOfWeek int,
FlightDate string,
UniqueCarrier string,
AirlineID int,
Carrier string,
TailNum string,
FlightNum int,
OriginAirportID int,
OriginAirportSeqID int, 
OriginCityMarketID int, 
Origin string,
OriginCityName string,
OriginState string,
OriginStateFips int,
OriginStateName string,
OriginWac int,
DestAirportID int,
DestAirportSeqID int,
DestCityMarketID int,
Dest string,
DestCityName string,
DestState string,
DestStateFips int,
DestStateName string,
DestWac int,
CRSDepTime int,
DepTime int,
DepDelay int,
DepDelayMinutes int, 
DepDel15 int,
DepartureDelayGroups int,
DepTimeBlk string,
TaxiOut int,
WheelsOff int,
WheelsOn int,
TaxiIn int, 
CRSArrTime int,
ArrTime int,
ArrDelay int,
ArrDelayMinutes int,
ArrDel15 int,
ArrivalDelayGroups int,
ArrTimeBlk string,
Cancelled int,
CancellationCodeDiverted int,
CRSElapsedTime int,
ActualElapsedTime int,
AirTime int,
Flights int,
Distance int,
DistanceGroup int,
CarrierDelay int,
WeatherDelay int, 
NASDelay int,
SecurityDelay int, 
LateAircraftDelay int,
FirstDepTime int,
TotalAddGTime int,
LongestAddGTime int,
DivAirportLandings int,
DivReachedDest int,
DivActualElapsedTime int,
DivArrDelay int,
DivDistance int,
Div1Airport string,
Div1AirportID  int,
Div1AirportSeqID int,
Div1WheelsOn int,
Div1TotalGTime int,
Div1LongestGTime int,
Div1WheelsOff int,
Div1TailNum string,
Div2Airport string,
Div2AirportID int,
Div2AirportSeqID int,
Div2WheelsOn int,
Div2TotalGTime int,
Div2LongestGTime int,
Div2WheelsOff int,
Div2TailNum string,
Div3Airport string,
Div3AirportID int,
Div3AirportSeqID int,
Div3WheelsOn int,
Div3TotalGTime int,
Div3LongestGTime int, 
Div3WheelsOff int,
Div3TailNum string,
Div4Airport string,
Div4AirportID int,
Div4AirportSeqID int,
Div4WheelsOn int,
Div4TotalGTime int,
Div4LongestGTime int,
Div4WheelsOff int,
Div4TailNum string,
Div5Airport string,
Div5AirportID int,
Div5AirportSeqID int,
Div5WheelsOn int,
Div5TotalGTime int,
Div5LongestGTime int,
Div5WheelsOff int,
Div5TailNum string
) 
COMMENT 'Data about Flight on time performance and delay from public source - bucketed by year'
CLUSTERED BY (year) INTO 30 BUCKETS
row format delimited 
fields terminated by ',' 
lines terminated by '\n'
STORED AS TEXTFILE
tblproperties ("skip.header.line.count"="1");


# Load into Text table
# Load data INPATH '/user/cygwin/airlines_data' overwrite into TABLE air1;

# create ORC format table
CREATE EXTERNAL TABLE if not exists air2 (
Year int,
Quarter int,
Month int,
DayofMonth int,
DayOfWeek int,
FlightDate string,
UniqueCarrier string,
AirlineID int,
Carrier string,
TailNum string,
FlightNum int,
OriginAirportID int,
OriginAirportSeqID int, 
OriginCityMarketID int, 
Origin string,
OriginCityName string,
OriginState string,
OriginStateFips int,
OriginStateName string,
OriginWac int,
DestAirportID int,
DestAirportSeqID int,
DestCityMarketID int,
Dest string,
DestCityName string,
DestState string,
DestStateFips int,
DestStateName string,
DestWac int,
CRSDepTime int,
DepTime int,
DepDelay int,
DepDelayMinutes int, 
DepDel15 int,
DepartureDelayGroups int,
DepTimeBlk string,
TaxiOut int,
WheelsOff int,
WheelsOn int,
TaxiIn int, 
CRSArrTime int,
ArrTime int,
ArrDelay int,
ArrDelayMinutes int,
ArrDel15 int,
ArrivalDelayGroups int,
ArrTimeBlk string,
Cancelled int,
CancellationCodeDiverted int,
CRSElapsedTime int,
ActualElapsedTime int,
AirTime int,
Flights int,
Distance int,
DistanceGroup int,
CarrierDelay int,
WeatherDelay int, 
NASDelay int,
SecurityDelay int, 
LateAircraftDelay int,
FirstDepTime int,
TotalAddGTime int,
LongestAddGTime int,
DivAirportLandings int,
DivReachedDest int,
DivActualElapsedTime int,
DivArrDelay int,
DivDistance int,
Div1Airport string,
Div1AirportID  int,
Div1AirportSeqID int,
Div1WheelsOn int,
Div1TotalGTime int,
Div1LongestGTime int,
Div1WheelsOff int,
Div1TailNum string,
Div2Airport string,
Div2AirportID int,
Div2AirportSeqID int,
Div2WheelsOn int,
Div2TotalGTime int,
Div2LongestGTime int,
Div2WheelsOff int,
Div2TailNum string,
Div3Airport string,
Div3AirportID int,
Div3AirportSeqID int,
Div3WheelsOn int,
Div3TotalGTime int,
Div3LongestGTime int, 
Div3WheelsOff int,
Div3TailNum string,
Div4Airport string,
Div4AirportID int,
Div4AirportSeqID int,
Div4WheelsOn int,
Div4TotalGTime int,
Div4LongestGTime int,
Div4WheelsOff int,
Div4TailNum string,
Div5Airport string,
Div5AirportID int,
Div5AirportSeqID int,
Div5WheelsOn int,
Div5TotalGTime int,
Div5LongestGTime int,
Div5WheelsOff int,
Div5TailNum string
) 
COMMENT 'Data about Flight on time performance and delay from public source - bucketed by year'
CLUSTERED BY (year) INTO 30 BUCKETS
row format delimited 
fields terminated by ',' 
lines terminated by '\n'
STORED AS ORC
TBLPROPERTIES ("ORC.compress"="SnappyCodec");

# Copy to ORC table
INSERT INTO TABLE air2 SELECT * FROM air1;

set hive.enforce.bucketing = true;
FROM air2 insert into table air3 select * ;

hive.auto.convert.join=false;
