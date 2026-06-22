-- =====================================================================
-- Retail Chain Business Analysis — SQL Queries
-- Covers: Fulfillment Gap Analysis, CLV Segmentation, KPI Tracking
-- Schema assumptions: Fact_Orders, Fact_Delivery, Fact_Returns,
--                      Dim_Customer, Dim_Store, Dim_Date, Fact_CLV
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. Fulfillment Delay Rate (Overall)
-- ---------------------------------------------------------------------
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN sla_status = 'BREACHED' THEN 1 ELSE 0 END) AS delayed_orders,
    ROUND(100.0 * SUM(CASE WHEN sla_status = 'BREACHED' THEN 1 ELSE 0 END) / COUNT(*), 2) AS delay_rate_pct
FROM Fact_Orders
WHERE order_date BETWEEN '2024-01-01' AND '2025-03-31';


-- ---------------------------------------------------------------------
-- 2. Bottleneck Contribution by Process Node
-- ---------------------------------------------------------------------
SELECT
    delay_node,
    COUNT(*) AS delayed_order_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_total_delays
FROM Fact_Orders
WHERE sla_status = 'BREACHED'
GROUP BY delay_node
ORDER BY pct_of_total_delays DESC;
-- Expected output ~ Warehouse Picking 38%, Last-Mile Delivery 29%,
-- Returns Processing 19%, Inventory Syncing 9%, Payment Settlement 5%


-- ---------------------------------------------------------------------
-- 3. On-Time Delivery Rate by 3PL Partner
-- ---------------------------------------------------------------------
SELECT
    d.partner_name,
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN d.delivered_on_time = 1 THEN 1 ELSE 0 END) AS on_time_count,
    ROUND(100.0 * SUM(CASE WHEN d.delivered_on_time = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS on_time_rate_pct
FROM Fact_Delivery d
GROUP BY d.partner_name
ORDER BY on_time_rate_pct DESC;


-- ---------------------------------------------------------------------
-- 4. Returns TAT (Turnaround Time) Distribution
-- ---------------------------------------------------------------------
SELECT
    r.return_id,
    r.order_value,
    DATEDIFF(HOUR, r.initiated_at, r.refunded_at) AS tat_hours,
    CASE WHEN r.order_value < 500 THEN 'AUTO_APPROVED' ELSE 'MANUAL_REVIEW' END AS approval_path
FROM Fact_Returns r
WHERE r.refunded_at IS NOT NULL;

-- Aggregate TAT compliance vs <48hr target
SELECT
    approval_path,
    COUNT(*) AS total_returns,
    AVG(tat_hours) AS avg_tat_hours,
    ROUND(100.0 * SUM(CASE WHEN tat_hours < 48 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_within_target
FROM (
    SELECT
        DATEDIFF(HOUR, initiated_at, refunded_at) AS tat_hours,
        CASE WHEN order_value < 500 THEN 'AUTO_APPROVED' ELSE 'MANUAL_REVIEW' END AS approval_path
    FROM Fact_Returns
    WHERE refunded_at IS NOT NULL
) t
GROUP BY approval_path;


-- ---------------------------------------------------------------------
-- 5. CLV Inputs — Customer Purchase Frequency & Monetary Value
--    (Pre-aggregation feeding the BG/NBD + Gamma-Gamma model, typically
--     run in Python/R; this SQL prepares the RFM-style input table)
-- ---------------------------------------------------------------------
SELECT
    c.customer_id,
    COUNT(o.order_id) AS frequency,                        -- # repeat purchases
    DATEDIFF(DAY, MIN(o.order_date), MAX(o.order_date)) AS recency_span_days,
    DATEDIFF(DAY, MAX(o.order_date), CURRENT_DATE) AS days_since_last_purchase,
    AVG(o.order_value) AS avg_order_value,
    SUM(o.order_value) AS total_spend
FROM Dim_Customer c
JOIN Fact_Orders o ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2022-01-01' AND '2025-03-31'
GROUP BY c.customer_id;


-- ---------------------------------------------------------------------
-- 6. CLV Tier Assignment (assumes Fact_CLV.clv_score already computed
--    by the BG/NBD + Gamma-Gamma model pipeline)
-- ---------------------------------------------------------------------
WITH ranked AS (
    SELECT
        customer_id,
        clv_score,
        PERCENT_RANK() OVER (ORDER BY clv_score DESC) AS pct_rank
    FROM Fact_CLV
    WHERE score_date = (SELECT MAX(score_date) FROM Fact_CLV)
)
SELECT
    customer_id,
    clv_score,
    CASE
        WHEN pct_rank <= 0.15 THEN 'High'
        WHEN pct_rank <= 0.57 THEN 'Mid'     -- 0.15 + 0.42 = 0.57
        ELSE 'Low'
    END AS clv_tier
FROM ranked;


-- ---------------------------------------------------------------------
-- 7. CLV Tier Distribution Summary
-- ---------------------------------------------------------------------
SELECT
    clv_tier,
    COUNT(*) AS customer_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_base,
    AVG(annual_revenue) AS avg_annual_revenue
FROM Fact_CLV_Tiered     -- materialized view from Query #6 joined to revenue
GROUP BY clv_tier
ORDER BY avg_annual_revenue DESC;


-- ---------------------------------------------------------------------
-- 8. CLV Tier Migration (Month-over-Month)
-- ---------------------------------------------------------------------
SELECT
    prev.clv_tier AS tier_last_month,
    curr.clv_tier AS tier_this_month,
    COUNT(*) AS customer_count
FROM Fact_CLV curr
JOIN Fact_CLV prev
    ON curr.customer_id = prev.customer_id
    AND prev.score_date = DATEADD(MONTH, -1, curr.score_date)
WHERE curr.score_date = (SELECT MAX(score_date) FROM Fact_CLV)
GROUP BY prev.clv_tier, curr.clv_tier
ORDER BY tier_last_month, tier_this_month;


-- ---------------------------------------------------------------------
-- 9. Revenue Recovery & Cost Savings Tracking (vs. Annual Targets)
-- ---------------------------------------------------------------------
SELECT
    initiative,           -- 'R1','R2','R3','R4'
    SUM(revenue_recovered) AS revenue_recovered_ytd,
    SUM(cost_saved) AS cost_saved_ytd
FROM Fact_Initiative_Impact
WHERE fiscal_year = 'FY2024-25'
GROUP BY initiative;
-- Compare to targets: R1 Rs14L revenue | R2 Rs10L cost | R3 Rs8L revenue | R4 Rs27L cost


-- ---------------------------------------------------------------------
-- 10. High-CLV Retention Rate
-- ---------------------------------------------------------------------
SELECT
    ROUND(100.0 * SUM(CASE WHEN still_active = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS high_clv_retention_pct
FROM Fact_CLV_Tiered
WHERE clv_tier = 'High'
  AND score_date = (SELECT MAX(score_date) FROM Fact_CLV_Tiered);
-- Target >= 85%
