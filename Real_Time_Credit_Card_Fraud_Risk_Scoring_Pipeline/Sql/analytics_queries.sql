-- ==========================================================
-- Project : Real-Time Credit Card Fraud Risk Scoring Pipeline
-- File    : analytics_queries.sql
-- Author  : Priyanshu Tiwari
-- ==========================================================

-- ==========================================================
-- Query 1 : Total Transactions and Fraud Alerts
-- ==========================================================

SELECT
    COUNT(*) AS total_transactions,
    SUM(
        CASE
            WHEN fraud_alert = 'YES' THEN 1
            ELSE 0
        END
    ) AS total_fraud_alerts
FROM workspace.fraud_db.gold_fraud_alerts;

-- ==========================================================
-- Query 2 : Risk Level Distribution
-- ==========================================================

SELECT
    risk_level,
    COUNT(*) AS total_transactions
FROM workspace.fraud_db.gold_fraud_alerts
GROUP BY risk_level
ORDER BY total_transactions DESC;

-- ==========================================================
-- Query 3 : Top High-Risk Customers
-- ==========================================================

SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    MAX(fraud_risk_score) AS maximum_risk_score,
    AVG(fraud_risk_score) AS average_risk_score
FROM workspace.fraud_db.gold_fraud_alerts
GROUP BY customer_id
ORDER BY maximum_risk_score DESC;

-- ==========================================================
-- Query 4 : Merchant Fraud Analysis
-- ==========================================================

SELECT
    merchant,
    COUNT(*) AS total_transactions,
    AVG(fraud_risk_score) AS average_risk_score,
    MAX(fraud_risk_score) AS maximum_risk_score
FROM workspace.fraud_db.gold_fraud_alerts
GROUP BY merchant
ORDER BY average_risk_score DESC;

-- ==========================================================
-- Query 5 : Merchant Category Analysis
-- ==========================================================

SELECT
    merchant_category,
    COUNT(*) AS total_transactions,
    AVG(fraud_risk_score) AS average_fraud_score,
    MAX(fraud_risk_score) AS maximum_fraud_score
FROM workspace.fraud_db.gold_fraud_alerts
GROUP BY merchant_category
ORDER BY average_fraud_score DESC;

-- ==========================================================
-- Query 6 : Location-wise Fraud Analysis
-- ==========================================================

SELECT
    location,
    COUNT(*) AS total_transactions,
    AVG(fraud_risk_score) AS average_risk_score
FROM workspace.fraud_db.gold_fraud_alerts
GROUP BY location
ORDER BY average_risk_score DESC;

-- ==========================================================
-- Query 7 : Top 10 Highest Risk Transactions
-- ==========================================================

SELECT
    transaction_id,
    customer_id,
    merchant,
    merchant_category,
    amount,
    location,
    fraud_risk_score,
    risk_level,
    fraud_alert
FROM workspace.fraud_db.gold_fraud_alerts
ORDER BY fraud_risk_score DESC
LIMIT 10;

-- ==========================================================
-- Query 8 : Fraud Rules Triggered
-- ==========================================================

SELECT
    transaction_id,
    customer_id,
    fraud_rules_triggered,
    fraud_risk_score,
    risk_level
FROM workspace.fraud_db.gold_fraud_alerts
WHERE fraud_alert = 'YES'
ORDER BY fraud_risk_score DESC;

-- ==========================================================
-- Query 9 : Daily Fraud Trend
-- ==========================================================

SELECT
    DATE(transaction_time) AS transaction_date,
    COUNT(*) AS total_transactions,
    SUM(
        CASE
            WHEN fraud_alert = 'YES' THEN 1
            ELSE 0
        END
    ) AS fraud_alerts
FROM workspace.fraud_db.gold_fraud_alerts
GROUP BY DATE(transaction_time)
ORDER BY transaction_date;

-- ==========================================================
-- Query 10 : Customer Risk Profile
-- ==========================================================

SELECT
    customer_id,
    total_transactions,
    average_transaction_amount,
    average_fraud_score,
    maximum_fraud_score,
    total_fraud_alerts,
    customer_risk_level
FROM workspace.fraud_db.gold_customer_risk_profile
ORDER BY maximum_fraud_score DESC;

-- ==========================================================
-- Query 11 : High Risk Transactions
-- ==========================================================

SELECT
    transaction_id,
    customer_id,
    amount,
    merchant,
    location,
    fraud_risk_score,
    risk_level
FROM workspace.fraud_db.gold_fraud_alerts
WHERE fraud_risk_score >= 60
ORDER BY fraud_risk_score DESC;

-- ==========================================================
-- Query 12 : Average Transaction Amount by Merchant
-- ==========================================================

SELECT
    merchant,
    COUNT(*) AS total_transactions,
    ROUND(AVG(amount),2) AS average_transaction_amount,
    ROUND(MAX(amount),2) AS highest_transaction_amount
FROM workspace.fraud_db.gold_fraud_alerts
GROUP BY merchant
ORDER BY average_transaction_amount DESC;

-- ==========================================================
-- Query 13 : Customer Transaction Summary
-- ==========================================================

SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount),2) AS total_amount,
    ROUND(AVG(amount),2) AS average_amount,
    ROUND(MAX(amount),2) AS highest_amount
FROM workspace.fraud_db.gold_fraud_alerts
GROUP BY customer_id
ORDER BY total_amount DESC;

-- ==========================================================
-- Query 14 : Fraud Alerts by Location
-- ==========================================================

SELECT
    location,
    SUM(
        CASE
            WHEN fraud_alert='YES' THEN 1
            ELSE 0
        END
    ) AS fraud_alerts
FROM workspace.fraud_db.gold_fraud_alerts
GROUP BY location
ORDER BY fraud_alerts DESC;

-- ==========================================================
-- Query 15 : Customer Risk Dashboard Summary
-- ==========================================================

SELECT
    customer_risk_level,
    COUNT(*) AS total_customers,
    ROUND(AVG(average_fraud_score),2) AS average_customer_risk
FROM workspace.fraud_db.gold_customer_risk_profile
GROUP BY customer_risk_level
ORDER BY average_customer_risk DESC;