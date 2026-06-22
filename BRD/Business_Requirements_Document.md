# Business Requirements Document (BRD)

**Project:** Retail Chain Business Analysis — Order Fulfillment, CLV Segmentation & Strategic Recommendations
**Prepared by:** Business Analysis Division
**Period:** FY 2024–25
**Classification:** Confidential

---

## 1. Document Control

| Version | Date | Author | Notes |
|---|---|---|---|
| 1.0 | FY 2024–25 | Business Analysis Division | Initial baseline |

---

## 2. Business Background

The retail chain operates 12 stores and faces three interrelated operational challenges that undermine profitability, customer satisfaction, and competitive positioning:

1. **Order Fulfillment Inefficiency** — 26% of orders exceed internal SLA targets. Customer satisfaction (CSAT) has declined by 11 points over 18 months, directly correlated with delay rates.
2. **Revenue Leakage** — An estimated ₹32L/year is at risk from cart abandonment (late delivery estimates), stockout-driven lost sales, and unresolved returns (refund fraud, shrinkage). Leakage is projected to grow 8% YoY without intervention.
3. **Absence of a CLV-Based Marketing Strategy** — Marketing budgets are allocated uniformly regardless of customer revenue contribution, causing over-investment in low-value segments and under-investment in high-value, high-churn-risk customers.

## 3. Business Objectives

| # | Objective | Success Metric |
|---|---|---|
| BO-1 | Reduce order fulfillment delays | Delay rate from 26% → <10% |
| BO-2 | Recover leaking revenue | Recover ₹32L+/year |
| BO-3 | Reduce operational costs | Reduce costs by ₹50L+/year |
| BO-4 | Establish CLV-based marketing | High-CLV retention ≥85% |
| BO-5 | Enable continuous monitoring | Real-time dashboard live by Q3 |

## 4. Scope

### 4.1 In Scope
- Gap analysis of the order-to-delivery workflow across all 12 stores (Lean process mapping).
- CLV scoring for 10,247 customers using BG/NBD + Gamma-Gamma models, segmented into High/Mid/Low tiers.
- Development of 4 prioritized, ROI-ranked strategic recommendations (R1–R4).
- Design of a real-time operational KPI dashboard (Power BI / Tableau).
- 3-quarter phased implementation roadmap.

### 4.2 Out of Scope
- New store openings or physical infrastructure changes.
- Replacement of the core ERP/WMS platforms (only integration/automation layers are in scope).
- International or cross-border fulfillment operations.

## 5. Stakeholders

| Stakeholder | Role | Interest |
|---|---|---|
| COO / Operations Leadership | Sponsor | Fulfillment efficiency, cost reduction |
| Warehouse Managers | Process Owner | Picking, zone optimization |
| Logistics Coordinators | Process Owner | Last-mile delivery, 3PL management |
| Marketing Leadership | Process Owner | CLV-based budget allocation |
| Customer Service / Returns Team | Process Owner | Returns automation, TAT |
| IT / Data Engineering | Implementation | WMS-ERP integration, dashboard build |
| Finance | Governance | ROI validation, cost-savings tracking |

## 6. Business Requirements

| ID | Requirement | Priority | Linked Objective |
|---|---|---|---|
| BR-1 | Identify and prioritize the critical bottlenecks driving fulfillment delays | High | BO-1 |
| BR-2 | Redesign warehouse picking with zone optimization and barcode verification | High | BO-1, BO-3 |
| BR-3 | Diversify 3PL partnerships and enable dynamic delivery routing | High | BO-1, BO-3 |
| BR-4 | Automate low-value returns approval and provide self-service returns | High | BO-1, BO-3 |
| BR-5 | Implement real-time inventory sync between WMS and e-commerce | Medium | BO-1 |
| BR-6 | Automate payment settlement reconciliation | Medium | BO-1 |
| BR-7 | Compute CLV scores for all active customers and segment into tiers | High | BO-4 |
| BR-8 | Reallocate marketing spend by CLV tier | High | BO-4 |
| BR-9 | Deploy a continuous monitoring dashboard with alert thresholds | High | BO-5 |
| BR-10 | Define and track KPIs for each strategic recommendation | High | BO-2, BO-3, BO-4 |

## 7. Current State (As-Is) Summary

| Bottleneck | Delay Contribution | Root Cause |
|---|---|---|
| Warehouse Picking | 38% | Manual pick process, no zone optimization |
| Last-Mile Delivery | 29% | Single 3PL dependency in high-demand zones |
| Returns Processing | 19% | All returns require manual approval |
| Inventory Syncing | 9% | Batch-sync causing 4-hour lag |
| Payment Settlement | 5% | Manual reconciliation delays dispatch |

## 8. Future State (To-Be) Vision

A retail operation where:
- Fulfillment delays are below 10% via automated picking, multi-3PL routing, and self-service returns.
- All 10,247+ customers are continuously scored and segmented by CLV, driving differentiated marketing and service spend.
- Leadership has real-time visibility into SLA compliance, CLV migration, and revenue recovery via a live dashboard.

## 9. Assumptions & Constraints

**Assumptions**
- Historical transaction data (FY2022–FY2025) is complete and reliable for CLV modeling.
- WMS and ERP systems expose APIs sufficient for real-time sync.

**Constraints**
- Implementation must be phased across 3 quarters (9 months) due to vendor onboarding and IT capacity.
- Budget for 3PL expansion limited to 2 additional regional partners in Year 1.

## 10. Strategic Recommendations Summary (Business View)

| # | Recommendation | Projected Impact | Timeline |
|---|---|---|---|
| R1 | Automate Warehouse Picking | ₹14L revenue recovered | Q1 (3 months) |
| R2 | Expand 3PL Partner Network | ₹10L cost reduction | Q2 (3 months) |
| R3 | CLV-Based Marketing Allocation | ₹8L revenue uplift | Q1–Q2 (ongoing) |
| R4 | Self-Service Returns Portal | ₹27L ops cost saved | Q2–Q3 (4 months) |

## 11. Approval

| Name | Role | Signature | Date |
|---|---|---|---|
| | Project Sponsor | | |
| | Business Analyst | | |
| | IT Lead | | |
