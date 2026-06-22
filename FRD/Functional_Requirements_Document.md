# Functional Requirements Document (FRD)

**Project:** Retail Chain Business Analysis — Order Fulfillment, CLV Segmentation & Strategic Recommendations
**Prepared by:** Business Analysis Division
**Period:** FY 2024–25
**Classification:** Confidential

---

## 1. Purpose

This FRD translates the Business Requirements (see `BRD/Business_Requirements_Document.md`) into functional specifications for four systems: the Warehouse Picking module, the 3PL/Delivery Routing module, the Self-Service Returns Portal, and the CLV Segmentation Engine, plus the Continuous Monitoring Dashboard.

## 2. System Overview

| Module | Linked BR | Primary Users |
|---|---|---|
| FR-Module-1: Warehouse Picking Automation | BR-2 | Warehouse staff, Warehouse Managers |
| FR-Module-2: 3PL & Dynamic Routing | BR-3 | Logistics Coordinators |
| FR-Module-3: Returns Self-Service Portal | BR-4 | Customers, Returns Team |
| FR-Module-4: Inventory Real-Time Sync | BR-5 | WMS/E-commerce systems (integration) |
| FR-Module-5: Payment Settlement Automation | BR-6 | Finance, Payment Gateway |
| FR-Module-6: CLV Segmentation Engine | BR-7, BR-8 | Marketing, Data Science |
| FR-Module-7: Monitoring Dashboard | BR-9, BR-10 | Leadership, Ops Managers |

## 3. Functional Requirements

### 3.1 Warehouse Picking Automation (FR-Module-1)
- **FR-1.1**: System shall assign pick tasks based on warehouse zone to minimize travel distance (zone-picking).
- **FR-1.2**: System shall require barcode scan verification at pick and pack stages before order moves to dispatch.
- **FR-1.3**: System shall flag mis-picks in real time and route to a supervisor queue.
- **FR-1.4**: System shall report pick accuracy as a live KPI (target ≥95%).

### 3.2 3PL & Dynamic Routing (FR-Module-2)
- **FR-2.1**: System shall support configuration of multiple 3PL partners per delivery zone (minimum 3 total, including incumbent).
- **FR-2.2**: System shall dynamically assign a courier per order based on current zone load, cost, and historical on-time rate.
- **FR-2.3**: System shall recalculate ETA in real time and notify the customer on change.
- **FR-2.4**: System shall track and report on-time delivery rate by 3PL partner (target ≥92%).

### 3.3 Returns Self-Service Portal (FR-Module-3)
- **FR-3.1**: System shall auto-approve return requests with order value <₹500 without manual review.
- **FR-3.2**: System shall allow customers to initiate, track, and print return labels through a self-service web/app portal.
- **FR-3.3**: System shall route returns ≥₹500 or flagged for suspected fraud to manual review queue.
- **FR-3.4**: System shall track Returns Turnaround Time (TAT) and target <48 hours for auto-approved returns.

### 3.4 Inventory Real-Time Sync (FR-Module-4)
- **FR-4.1**: System shall replace batch-sync (4-hour lag) with an API-based real-time sync between WMS and e-commerce inventory.
- **FR-4.2**: System shall trigger stockout alerts within 5 minutes of inventory reaching zero at any store/SKU level.

### 3.5 Payment Settlement Automation (FR-Module-5)
- **FR-5.1**: System shall integrate with payment gateway webhook/API to automate settlement reconciliation.
- **FR-5.2**: System shall remove manual reconciliation as a blocking step for dispatch.

### 3.6 CLV Segmentation Engine (FR-Module-6)
- **FR-6.1**: System shall ingest 3 years (FY2022–FY2025) of transaction history per customer from the CRM/ERP.
- **FR-6.2**: System shall apply the BG/NBD model to estimate future purchase frequency per customer.
- **FR-6.3**: System shall apply the Gamma-Gamma model to estimate expected monetary value per transaction.
- **FR-6.4**: System shall classify each customer into High (top ~15%), Mid (~42%), or Low (~43%) CLV tier based on computed CLV score.
- **FR-6.5**: System shall recompute CLV scores and tier assignment on a recurring schedule (e.g., monthly) and track tier migration.
- **FR-6.6**: System shall expose CLV tier as a field consumable by the Marketing Automation Platform for targeted campaigns.

### 3.7 Continuous Monitoring Dashboard (FR-Module-7)
- **FR-7.1**: Dashboard shall display fulfillment SLA compliance rate, refreshed at least daily.
- **FR-7.2**: Dashboard shall display CLV tier migration rates (customers moving between High/Mid/Low).
- **FR-7.3**: Dashboard shall display Returns TAT against the <48-hour target.
- **FR-7.4**: Dashboard shall display cumulative revenue recovery and cost-savings against the ₹32L / ₹59L annual targets.
- **FR-7.5**: Dashboard shall support configurable alert thresholds with notification on breach (e.g., email/Slack).
- **FR-7.6**: Dashboard shall be built on Power BI or Tableau and support role-based access (Ops, Marketing, Leadership views).

## 4. Non-Functional Requirements

| ID | Requirement |
|---|---|
| NFR-1 | Inventory sync latency shall not exceed 1 minute (real-time API, replacing 4-hour batch). |
| NFR-2 | Dashboard shall support concurrent access by at least 50 users without performance degradation. |
| NFR-3 | CLV computation pipeline shall process 10,000+ customer records within a single batch run window (≤2 hours). |
| NFR-4 | Returns portal shall be accessible via web and mobile. |
| NFR-5 | All customer financial and transaction data shall be encrypted at rest and in transit. |
| NFR-6 | System uptime for the Returns Portal and Dashboard shall be ≥99.5%. |

## 5. Data Requirements

| Source System | Data Elements | Used By |
|---|---|---|
| ERP (Order Management) | Order ID, store ID, order value, timestamps | Gap analysis, FR-Module-1/2/5 |
| WMS | Pick/pack events, error codes, zone throughput, stockout records | FR-Module-1, FR-Module-4 |
| Returns Database | Return ID, reason code, refund TAT, fraud flag | FR-Module-3 |
| CRM | Purchase history, CSAT/NPS, contact touchpoints | FR-Module-6 |
| Marketing Automation Platform | Campaign spend, open/click rates, SMS delivery | FR-Module-6 |

## 6. Traceability Matrix (BRD → FRD)

| BRD Requirement | FRD Module(s) |
|---|---|
| BR-1 | Process-Flows + Gap Analysis (reporting layer of FR-Module-7) |
| BR-2 | FR-Module-1 |
| BR-3 | FR-Module-2 |
| BR-4 | FR-Module-3 |
| BR-5 | FR-Module-4 |
| BR-6 | FR-Module-5 |
| BR-7, BR-8 | FR-Module-6 |
| BR-9, BR-10 | FR-Module-7 |
