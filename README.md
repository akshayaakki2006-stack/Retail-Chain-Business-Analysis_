# Retail Chain Business Analysis

End-to-end operational review of a 12-store retail chain, covering order fulfillment gap analysis, Customer Lifetime Value (CLV) segmentation, and data-backed strategic recommendations.

## Project Snapshot

| Metric | Value | Target |
|---|---|---|
| Stores Analyzed | 12 | All Stores |
| Customers Segmented | 10,247 | 10,000+ |
| Fulfillment Delay Rate | 26% | <10% |
| Critical Bottlenecks | 3 | 0 |
| Projected Revenue Recovery | ₹32L/year | ₹32L+ |
| Projected Cost Reduction | ₹59L/year | ₹50L+ |

## Repository Structure

```
Retail-Chain-Business-Analysis/
│
├── README.md                  → This file
├── BRD/                        → Business Requirements Document
├── FRD/                        → Functional Requirements Document
├── User-Stories/               → User stories & acceptance criteria (Agile backlog)
├── Wireframes/                 → Low-fidelity UI wireframes (dashboard & portal)
├── Process-Flows/              → Order-to-delivery and returns process flow diagrams
├── Dashboard/                  → KPI dashboard specification (Power BI / Tableau)
├── SQL/                        → SQL queries for CLV scoring, bottleneck analysis, KPIs
└── Presentation/                → Source PPTX deck and DOCX report
```

## Project Domains

1. **Order Fulfillment Gap Analysis** — Identifies 3 critical bottlenecks (Warehouse Picking 38%, Last-Mile Delivery 29%, Returns Processing 19%) responsible for 26% of delays.
2. **CLV Segmentation** — Segments 10,247 customers into High (15%), Mid (42%), and Low (43%) CLV tiers using the BG/NBD + Gamma-Gamma model.
3. **Strategic Recommendations** — 4 prioritized initiatives (R1–R4) projected to recover ₹32L in revenue and save ₹59L in costs, phased across a 3-quarter roadmap.

## How to Navigate This Repo

| If you want to... | Go to |
|---|---|
| Understand business goals & scope | `BRD/Business_Requirements_Document.md` |
| See system/functional specifications | `FRD/Functional_Requirements_Document.md` |
| Review the Agile backlog | `User-Stories/User_Stories.md` |
| View UI layout concepts | `Wireframes/Wireframes.md` |
| See process maps for fulfillment & returns | `Process-Flows/` |
| Review the KPI dashboard spec | `Dashboard/Dashboard_Specification.md` |
| Run the analytical SQL | `SQL/queries.sql` |
| View the original deck/report | `Presentation/` |

---
*Prepared by: Business Analysis Division | FY 2024–25 | Confidential*
