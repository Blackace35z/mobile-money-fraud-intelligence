
SELECT
    step,
    type AS transaction_type,

    CASE
        WHEN step <= 354 THEN 'First half'
        ELSE 'Second half'
    END AS time_period,

    COUNT(*) AS total_transactions,

    SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        AS fraudulent_transactions,

    ROUND(
        100.0 * SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        4
    ) AS fraud_rate_percent,

    ROUND(SUM(amount), 2) AS total_transaction_amount,

    ROUND(
        SUM(CASE WHEN isFraud = 1 THEN amount ELSE 0 END),
        2
    ) AS fraud_labeled_transaction_amount

FROM read_csv_auto(
    'data/PS_20174392719_1491204439457_log.csv',
    header = true
)

GROUP BY
    step,
    type,
    time_period

ORDER BY
    step,
    type;
