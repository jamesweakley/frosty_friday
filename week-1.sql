create database frosty_friday;
create schema challenge_1;
 
create stage challenge_1_stage url='s3://frostyfridaychallenges/challenge_1/';
  
list @challenge_1_stage;
-- can see a few csvs in there

create or replace file format csv_format type = 'csv' field_delimiter = ',';
-- hope it's a true csv :)

select t.$1,t.$2 from @challenge_1_stage (file_format => 'csv_format', pattern=>'challenge_1/1.csv') t;
-- second column is all null, assuming single column file

create table challenge_1_table(column_1 varchar);

copy into challenge_1_table from @challenge_1_stage;

select * from challenge_1_table;
