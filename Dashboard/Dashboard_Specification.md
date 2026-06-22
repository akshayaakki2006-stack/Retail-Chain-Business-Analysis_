# Continuous Monitoring Dashboard — Specification

**Tooling:** Power BI / Tableau
**Refresh Cadence:** Daily (operational tiles), Monthly (CLV tier migration)
**Audience:** Operations, Marketing, Leadership (role-based views)

---

## 1. Dashboard Objectives

Provide a single source of truth for tracking:
1. Fulfillment SLA compliance
2. CLV tier migration rates
3. Returns processing TAT
4. Revenue recovery & cost savings against targets

## 2. Page 1 — Executive Summary

| Tile | Metric | Target | Visualization |
|---|---|---|---|
| Fulfillment SLA Compliance | % orders within SLA | ≥90% (from current 74%) | KPI card + trend line |
| Revenue Recovered (YTD) | ₹ recovered vs ₹32L annual target | ₹32L+ | Progress gauge |
| Cost Savings (YTD) | ₹ saved vs ₹59L annual target | ₹59L+ | Progress gauge |
| Bottlenecks Active | Count of bottlenecks above threshold | 0 | KPI card |

## 3. Page 2 — Fulfillment Operations

| Tile | Metric | Source | Notes |
|---|---|---|---|
| Delay Contribution by Process Node | % share: Picking, Last-Mile, Returns, Sync, Settlement | WMS / ERP | Stacked bar chart |
| Pick Accuracy | % accurate picks (target ≥95%) | WMS | Trend line, daily |
| On-Time Delivery Rate by 3PL | % on-time per partner (target ≥92%) | Logistics/3PL feed | Bar chart by partner |
| Returns TAT | Hours from initiation to refund (target <48 hrs) | Returns DB | Gauge + distribution histogram |
| Inventory Sync Latency | Minutes lag (target <1 min, replacing 4-hr batch) | WMS/E-comm integration logs | Line chart |

## 4. Page 3 — CLV & Marketing

| Tile | Metric | Source | Notes |
|---|---|---|---|
| CLV Tier Distribution | Count/% in High/Mid/Low | CLV Engine output | Donut chart |
| Tier Migration (Monthly) | # customers moving between tiers | CLV Engine output | Sankey diagram |
| High-CLV Retention Rate | % retained (target ≥85%) | CRM | KPI card + trend |
| Marketing Spend by Tier | ₹ allocated High/Mid/Low | Marketing Automation Platform | Bar chart, spend vs. revenue contribution |

## 5. Page 4 — Recommendations Tracker (R1–R4)

| Recommendation | KPI | Target | Status Indicator |
|---|---|---|---|
| R1: Automate Warehouse Picking | Pick accuracy | ≥95% | 🟢/🟡/🔴 |
| R2: Expand 3PL Partner Network | On-time rate | ≥92% | 🟢/🟡/🔴 |
| R3: CLV-Based Marketing Allocation | High-CLV retention | ≥85% | 🟢/🟡/🔴 |
| R4: Self-Service Returns Portal | Returns TAT | <48 hrs | 🟢/🟡/🔴 |

## 6. Alert Thresholds

| KPI | Warning (Amber) | Critical (Red) |
|---|---|---|
| Fulfillment SLA Compliance | <85% | <75% |
| Returns TAT | >40 hrs | >48 hrs |
| Pick Accuracy | <93% | <90% |
| On-Time Delivery Rate | <90% | <85% |
| High-CLV Retention | <80% | <70% |

Alerts are delivered via email/Slack to the relevant process owner (see BRD Section 5: Stakeholders) when a threshold is breached.

## 7. Data Refresh & Governance

- Operational tiles (SLA, TAT, pick accuracy, on-time rate): refreshed **daily** via WMS/ERP/Returns DB feeds.
- CLV tiles: refreshed **monthly** following the CLV Engine batch run (see `SQL/queries.sql`).
- Access control: role-based views (Ops, Marketing, Leadership) restrict visible pages per `FRD/Functional_Requirements_Document.md` FR-7.6.

## 8. Underlying Data Model (Star Schema, Simplified)

```
            ┌──────────────┐
            │ Dim_Store     │
            └──────┬───────┘
                   │
┌──────────────┐   │   ┌──────────────┐
│ Dim_Customer │───┼───│ Dim_Date     │
└──────────────┘   │   └──────────────┘
                   │
            ┌──────┴───────┐
            │ Fact_Orders   │  (order_id, store_id, customer_id, date_id,
            │               │   order_value, sla_status, delay_node)
            └──────┬───────┘
                   │
       ┌───────────┼────────────┐
┌──────┴──────┐ ┌──┴────────┐ ┌─┴────────────┐
│ Fact_Returns │ │ Fact_CLV  │ │ Fact_Delivery │
└──────────────┘ └───────────┘ └───────────────┘
```
