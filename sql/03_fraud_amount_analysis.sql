
SELECT
    isFraud,
    COUNT(*) AS transaction_count,
    ROUND(AVG(amount), 2) AS average_amount,
    ROUND(MEDIAN(amount), 2) AS median_amount,
    ROUND(MAX(amount), 2) AS maximum_amount
FROM read_csv_auto(
    'data/PS_20174392719_1491204439457_log.csv',
    header = true
)
GROUP BY isFraud
ORDER BY isFraud;
