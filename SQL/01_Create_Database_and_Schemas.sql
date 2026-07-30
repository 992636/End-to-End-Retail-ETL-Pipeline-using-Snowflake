/*
=====================================================
Project : End-to-End Retail ETL Pipeline using Snowflake
Module  : Customer ETL
Author  : Shweta Mujmer
=====================================================
*/

//* CREATING A WAREHOUSE FOR Retail ETL Pipeline *//
CREATE OR REPLACE WAREHOUSE DE_WH
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE;

 //* CREATING DAT BASE - RETAIL_DB*//
CREATE DATABASE RETAIL_DB;

 //*CREATING SCHEMAS *//
   
CREATE SCHEMA RAW;
CREATE SCHEMA CURATED;
CREATE SCHEMA REJECT;
/* USING DATABASE AND SCHEMA*/
 USE DATABASE RETAIL_DB;
 USE SCHEMA RAW;
 USE SCHEMA CURATED;
 USE SCHEMA REJECT;
 

