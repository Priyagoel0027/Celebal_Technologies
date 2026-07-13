# 🚨 Real-Time Credit Card Fraud Risk Scoring Pipeline

<p align="center">

![Python](https://img.shields.io/badge/Python-3.11-blue?style=for-the-badge&logo=python)
![PySpark](https://img.shields.io/badge/PySpark-Big%20Data-orange?style=for-the-badge&logo=apachespark)
![Databricks](https://img.shields.io/badge/Databricks-Lakehouse-red?style=for-the-badge&logo=databricks)
![Delta Lake](https://img.shields.io/badge/Delta-Lake-green?style=for-the-badge)
![SQL](https://img.shields.io/badge/SQL-Analytics-blueviolet?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-PPO%20Level-success?style=for-the-badge)

</p>

---

# 📌 Project Overview

Financial institutions process millions of credit card transactions every day. Detecting fraudulent transactions quickly is critical for minimizing financial loss and protecting customers.

This project implements an **end-to-end Real-Time Credit Card Fraud Risk Scoring Pipeline** using **Databricks, PySpark, SQL, and Delta Lake** following the **Medallion Architecture (Bronze → Silver → Gold)**.

The pipeline ingests transaction data, validates and enriches records, applies multiple fraud detection rules, computes fraud risk scores, and generates business-ready datasets for dashboards and reporting.

---

# 🎯 Project Objectives

- Build an end-to-end fraud detection pipeline
- Implement Medallion Architecture
- Apply real-world fraud detection rules
- Generate fraud risk scores
- Create customer risk profiles
- Perform business analytics using SQL
- Produce dashboard-ready datasets
- Follow Data Engineering best practices

---

# 🏗️ Solution Architecture

```
                Transaction Dataset
                        │
                        ▼
              Customer Profile Dataset
                        │
                        ▼
            ┌────────────────────────┐
            │    Bronze Layer        │
            │ Raw Data Ingestion     │
            └────────────────────────┘
                        │
                        ▼
            ┌────────────────────────┐
            │    Silver Layer        │
            │ Data Cleaning          │
            │ Validation             │
            │ Enrichment             │
            └────────────────────────┘
                        │
                        ▼
            ┌────────────────────────┐
            │     Gold Layer         │
            │ Fraud Detection Engine │
            │ Risk Scoring           │
            │ Fraud Alerts           │
            └────────────────────────┘
                        │
                        ▼
            SQL Analytics & Dashboard
```

---

# ⚙️ Technology Stack

| Technology | Purpose |
|------------|----------|
| Python | Programming Language |
| PySpark | Distributed Data Processing |
| Databricks | Data Engineering Platform |
| Delta Lake | ACID Storage Layer |
| SQL | Analytics & Reporting |
| Unity Catalog | Data Governance |
| Medallion Architecture | Data Pipeline Design |

---

# 📂 Project Structure

```
Real_Time_Credit_Card_Fraud_Risk_Scoring_Pipeline
│
├── data
│   ├── transaction.csv
│   └── customer_profile.csv
│
├── notebooks
│   └── Real_Time_Credit_Card_Fraud_Risk_Scoring_Pipeline.ipynb
│
├── sql
│   └── analytics_queries.sql
│
├── screenshots
│   ├── bronze_layer.png
│   ├── silver_layer.png
│   ├── gold_layer.png
│   ├── fraud_dashboard.png
│   └── sql_queries.png
│
├── README.md
└── requirements.txt
```

---

# 📊 Dataset Information

## Transaction Dataset

| Column |
|---------|
| transaction_id |
| customer_id |
| card_id |
| transaction_time |
| amount |
| merchant |
| merchant_category |
| location |

**Total Records : 1200**

---

## Customer Profile Dataset

| Column |
|---------|
| customer_id |
| home_location |
| avg_spend_per_day |
| preferred_category |

**Total Records : 10**

---

# 🥉 Bronze Layer

### Objective

Store raw transactional data exactly as received from the source system.

### Operations Performed

- Raw Data Ingestion
- Metadata Addition
- Delta Table Creation
- Data Lineage
- Batch Tracking

### Metadata Columns

- ingestion_timestamp
- source_file
- batch_id

---

# 🥈 Silver Layer

### Objective

Improve data quality before applying fraud detection logic.

### Operations Performed

- Duplicate Removal
- Missing Value Handling
- Invalid Transaction Filtering
- Future Timestamp Validation
- Customer Profile Enrichment
- Delta Table Storage

---

# 🥇 Gold Layer

### Objective

Generate fraud intelligence using multiple business rules.

---

# 🚨 Fraud Detection Rules

## Rule 1

High Amount Detection

Condition

```
Transaction Amount >
5 × Average Daily Spend
```

Risk Score

```
30 Points
```

---

## Rule 2

Late Night Transaction

Condition

```
01:00 AM – 04:00 AM
```

Risk Score

```
10 Points
```

---

## Rule 3

Unusual Merchant Category

Condition

```
Merchant Category
!=
Preferred Category
```

Risk Score

```
20 Points
```

---

## Rule 4

Location Hop Detection

Condition

```
Different Location

within

30 Minutes
```

Risk Score

```
35 Points
```

---

## Rule 5

Multiple Transactions

Condition

```
More than 5 Transactions

within

15 Minutes
```

Risk Score

```
15 Points
```

---

# 📈 Fraud Risk Score

```
Fraud Score

=

High Amount Score

+

Late Night Score

+

Merchant Score

+

Location Hop Score

+

Multiple Transaction Score
```

Maximum Score

```
100
```

---

# 🚦 Risk Categories

| Score | Risk Level |
|---------|------------|
| 0–29 | LOW |
| 30–59 | MEDIUM |
| 60–79 | HIGH |
| 80–100 | CRITICAL |

---

# 📊 Gold Layer Outputs

The pipeline generates the following analytical datasets.

### Gold Fraud Alerts

- Fraud Risk Score
- Fraud Rules Triggered
- Fraud Alert
- Risk Level

### Customer Risk Profile

- Total Transactions
- Average Transaction Amount
- Maximum Fraud Score
- Average Fraud Score
- Total Fraud Alerts
- Customer Risk Level

---

# 📈 Business Analytics

The project includes SQL analytics for:

- Fraud Distribution
- Risk Level Analysis
- Merchant Risk Analysis
- Customer Risk Analysis
- Location-wise Fraud Detection
- Daily Fraud Trend
- High Risk Transactions
- Fraud Alert Summary

---

# 💡 Key Data Engineering Concepts

- Medallion Architecture
- Delta Lake
- PySpark DataFrames
- Window Functions
- Delta Tables
- SQL Analytics
- Data Enrichment
- Fraud Risk Scoring
- Data Validation
- Incremental Processing
- Business Rules Engine

---

# 🚀 Project Highlights

✔ End-to-End Data Engineering Pipeline

✔ Industry Standard Medallion Architecture

✔ Real-Time Fraud Detection Logic

✔ Window Function Implementation

✔ Delta Lake Storage

✔ Customer Risk Profiling

✔ SQL Analytics

✔ Dashboard Ready Data

✔ PPO-Level Documentation

✔ Modular Notebook Design

---

# ▶️ How to Run

### Step 1

Upload both datasets into Databricks.

### Step 2

Create the Unity Catalog database.

### Step 3

Execute the notebook sequentially.

### Step 4

Generate Bronze Layer.

### Step 5

Generate Silver Layer.

### Step 6

Generate Gold Layer.

### Step 7

Execute SQL analytics queries.

### Step 8

Visualize the results using Databricks SQL or Power BI.

---

# 📷 Project Screenshots

Include screenshots for:

- Bronze Layer
- Silver Layer
- Gold Layer
- SQL Analytics
- Fraud Dashboard

---

# 👩‍💻 Author

**Priya**

Data Engineering Project

Real-Time Credit Card Fraud Risk Scoring Pipeline

---

# ⭐ If you found this project useful, consider giving it a Star.
