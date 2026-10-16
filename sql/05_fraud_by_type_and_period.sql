
WITH transactions AS (
    SELECT
        step,
        type,
        isFraud,
        CASE
            WHEN step <= 354 THEN 'First half'
            ELSE 'Second half'
        END AS time_period
    FROM read_csv_auto(
        'data/PS_20174392719_1491204439457_log.csv',
        header = true
    )
)
SELECT
    time_period,
    type AS transaction_type,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        AS fraudulent_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        4
    ) AS fraud_rate_percent
FROM transactions
GROUP BY time_period, type
ORDER BY time_period, fraud_rate_percent DESC;
