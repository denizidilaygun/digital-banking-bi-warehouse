DROP VIEW IF EXISTS finance_dw.vw_2024_monthly_sector_spending;

CREATE VIEW finance_dw.vw_2024_monthly_sector_spending AS
SELECT
    d.year,
    d.month,
    d.month_name,
    s.sector_name,
    COUNT(*) AS total_transactions,
    ROUND(SUM(f.amount), 2) AS total_spent,
    ROUND(AVG(f.amount), 2) AS avg_transaction_amount
FROM finance_dw.fact_transaction f
JOIN finance_dw.dim_date d
    ON f.date_key = d.date_key
JOIN finance_dw.dim_merchant m
    ON f.merchant_key = m.merchant_key
JOIN finance_dw.dim_merchant_category c
    ON m.category_key = c.category_key
JOIN finance_dw.dim_sector s
    ON c.sector_key = s.sector_key
WHERE d.year = 2024
GROUP BY
    d.year,
    d.month,
    d.month_name,
    s.sector_name
ORDER BY
    d.month,
    total_spent DESC;

