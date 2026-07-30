/*
=====================================================
Project : End-to-End Retail ETL Pipeline using Snowflake
Module  : Audit Log
Author  : Shweta Mujmer
=====================================================
*/

/*Insert audit record*/

INSERT INTO METADATA.AUDIT_LOG
(
    PIPELINE_NAME,
    FILE_NAME,
    LOAD_START_TIME,
    STATUS
)
VALUES
(
    'CUSTOMER_ETL',
    'CUSTOMERS.csv',
    CURRENT_TIMESTAMP(),
    'RUNNING'
);

/*Update audit record when sucessfull Loaded*/

UPDATE METADATA.AUDIT_LOG
SET
    LOAD_END_TIME = CURRENT_TIMESTAMP(),
    STATUS = 'SUCCESS',
    ROWS_READ = 10,
    ROWS_LOADED = 8,
    ROWS_REJECTED = 2,
    ERROR_MESSAGE = NULL
WHERE RUN_ID =
(
    SELECT MAX(RUN_ID)
    FROM METADATA.AUDIT_LOG
    WHERE PIPELINE_NAME = 'CUSTOMER_ETL'

);

/*Update audit record when fails*/

UPDATE METADATA.AUDIT_LOG
SET
    LOAD_END_TIME = CURRENT_TIMESTAMP(),
    STATUS = 'FAILED',
    ERROR_MESSAGE = 'COPY INTO failed'
WHERE RUN_ID =
(
    SELECT MAX(RUN_ID)
    FROM METADATA.AUDIT_LOG
    WHERE PIPELINE_NAME = 'CUSTOMER_ETL'
);

/*Sample verification query*/

SELECT *
FROM METADATA.AUDIT_LOG