# 🚀 End-to-End Retail ETL Pipeline using Snowflake

## 📌 Project Overview

This project demonstrates an end-to-end ETL pipeline built using Snowflake following a modern layered architecture. The pipeline ingests retail data from CSV files, validates and transforms the data, loads clean records into curated tables, stores invalid records in reject tables, supports incremental loading using MERGE, and maintains execution logs for monitoring.

The project simulates a production-style retail data warehouse for four business entities:

- Customers
- Products
- Orders
- Payments

---

## 🏗️ Architecture


![Architecture](Architecture/architecture.png)

---

## 🛠️ Technology Stack

- Snowflake
- SQL
- Snowflake Internal Stage
- COPY INTO
- MERGE
- Window Functions (ROW_NUMBER)
- Data Validation
- ETL Audit Logging

---

## 📂 Project Structure

```
Retail_ETL_Pipeline/

│
├── SQL/
│   ├── Customer_ETL.sql
│   ├── Product_ETL.sql
│   ├── Order_ETL.sql
│   ├── Payment_ETL.sql
│
├── Sample_Data/
│   ├── Customers.csv
│   ├── Products.csv
│   ├── Orders.csv
│   └── Payments.csv
│
├── Architecture/
│   └── architecture.png
│
└── README.md
```

---

## 🔄 Pipeline Workflow

1. Upload source CSV files.
2. Load files into Snowflake Internal Stage.
3. Load data into RAW tables using COPY INTO.
4. Validate data using business rules.
5. Remove duplicate records using ROW_NUMBER().
6. Load valid records into CURATED tables.
7. Store invalid records in REJECT tables.
8. Perform incremental loading using MERGE.
9. Record pipeline execution details in AUDIT_LOG.
10. Execute the workflow through orchestration.

---

## 📁 Database Architecture

```
RETAIL_DB
│
├── RAW
│     ├── CUSTOMERS_STG
│     ├── PRODUCTS_STG
│     ├── ORDERS_STG
│     └── PAYMENTS_STG
│
├── CURATED
│     ├── CUSTOMERS
│     ├── PRODUCTS
│     ├── ORDERS
│     └── PAYMENTS
│
├── REJECT
│     ├── CUSTOMERS_REJECT
│     ├── PRODUCTS_REJECT
│     ├── ORDERS_REJECT
│     └── PAYMENTS_REJECT
│
└── METADATA
      └── AUDIT_LOG
```

---

## ✅ Data Validation

The pipeline performs multiple data quality checks before loading records into the curated layer.

Examples include:

- NULL value validation
- Duplicate record detection
- Email format validation
- Positive quantity validation
- Positive price validation
- Mandatory field validation

Invalid records are redirected to reject tables along with the rejection reason.

---

## 🔁 Incremental Loading

Incremental loading is implemented using the Snowflake MERGE command.

The pipeline:

- Updates existing records.
- Inserts new records.
- Prevents duplicate business keys.
- Uses ROW_NUMBER() to retain only the latest record based on LAST_UPDATED.

---

## 📊 Audit Logging

The pipeline maintains execution details in an AUDIT_LOG table.

Information captured includes:

- Pipeline Name
- File Name
- Start Time
- End Time
- Pipeline Status
- Rows Read
- Rows Loaded
- Rows Rejected
- Error Message

---

## 🚀 Future Enhancements

- Complete MERGE implementation for Products, Orders, and Payments
- Automate orchestration using Informatica Cloud or Apache Airflow
- Email notification on pipeline success/failure
- SCD Type 2 implementation for dimension tables

---

## 👩‍💻 Author

**Shweta Mujmer**

Aspiring Data Engineer passionate about building scalable ETL pipelines and cloud-based data solutions.
