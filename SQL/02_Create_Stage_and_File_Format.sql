/*
=====================================================
Project : End-to-End Retail ETL Pipeline using Snowflake
Module  : Customer ETL
Author  : Shweta Mujmer
=====================================================
*/

/* CREATING STAGE UNDER RAW SCHEMA*/

USE DATABASE RETAIL_DB;
USE SCHEMA RAW ;
CRAETE STAGE RETAIL_STAGE;

/*CREATING FILE FORMAT */

CREATE OR REPLACE FILE FORMAT RAW.CSV_FILE_FORMAT
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
EMPTY_FIELD_AS_NULL = TRUE
NULL_IF = ('NULL','')
DATE_FORMAT = 'MM/DD/YYYY'
TIMESTAMP_FORMAT = 'MM/DD/YYYY HH24:MI';



