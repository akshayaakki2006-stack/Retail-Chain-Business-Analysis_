# User Stories & Acceptance Criteria

**Project:** Retail Chain Business Analysis
**Format:** As a [role], I want [capability], so that [benefit].

---

## Epic 1: Warehouse Picking Automation

### US-1.1
**As a** warehouse picker, **I want** pick tasks grouped by zone, **so that** I spend less time walking between aisles.
**Acceptance Criteria:**
- Given an open order, the system assigns pick tasks grouped by warehouse zone.
- Pick list displays zone sequence to minimize travel distance.

### US-1.2
**As a** warehouse picker, **I want** to scan a barcode to confirm each picked item, **so that** mis-picks are caught before packing.
**Acceptance Criteria:**
- System rejects pack confirmation if scanned barcode doesn't match the order line.
- Mismatches are logged and routed to a supervisor queue.

### US-1.3
**As a** warehouse manager, **I want** a live pick accuracy KPI, **so that** I can monitor performance against the 95% target.
**Acceptance Criteria:**
- Dashboard tile shows daily/weekly pick accuracy %.
- Accuracy below 95% triggers a visual alert.

---

## Epic 2: 3PL Expansion & Dynamic Routing

### US-2.1
**As a** logistics coordinator, **I want** to onboard additional 3PL partners per zone, **so that** I'm not dependent on a single courier.
**Acceptance Criteria:**
- System allows configuration of 2+ 3PL partners per high-demand zone.
- Each partner has configurable cost and SLA parameters.

### US-2.2
**As a** logistics coordinator, **I want** orders dynamically routed to the best-performing available courier, **so that** on-time delivery improves.
**Acceptance Criteria:**
- Routing engine selects courier based on current load, cost, and historical on-time rate.
- On-time delivery rate by partner is tracked and reported (target ≥92%).

### US-2.3
**As a** customer, **I want** to be notified if my delivery ETA changes, **so that** I can plan accordingly.
**Acceptance Criteria:**
- ETA changes trigger an automated SMS/email/app notification.

---

## Epic 3: Self-Service Returns Portal

### US-3.1
**As a** customer, **I want** to initiate a return online without waiting for manual approval on small orders, **so that** I get my refund faster.
**Acceptance Criteria:**
- Returns with order value <₹500 are auto-approved instantly.
- Customer receives a printable return label immediately after approval.

### US-3.2
**As a** returns team member, **I want** only high-value or flagged returns routed to my queue, **so that** I focus only on cases that need review.
**Acceptance Criteria:**
- Returns ≥₹500 or flagged for fraud risk are routed to a manual review queue.
- Auto-approved returns do not appear in the manual queue.

### US-3.3
**As an** operations manager, **I want** to track returns TAT, **so that** I can confirm we are meeting the <48-hour target.
**Acceptance Criteria:**
- TAT is measured from return initiation to refund completion.
- Dashboard displays current TAT vs. 48-hour target.

---

## Epic 4: Inventory Real-Time Sync

### US-4.1
**As an** e-commerce platform, **I want** real-time inventory updates from the WMS, **so that** customers never order an out-of-stock item.
**Acceptance Criteria:**
- Inventory changes in WMS propagate to e-commerce within 1 minute.
- Batch sync (4-hour lag) is fully decommissioned.

### US-4.2
**As an** inventory manager, **I want** an alert when any SKU hits zero stock, **so that** I can reorder or pause sales promptly.
**Acceptance Criteria:**
- Stockout alert fires within 5 minutes of inventory reaching zero.

---

## Epic 5: Payment Settlement Automation

### US-5.1
**As a** finance analyst, **I want** payment settlement reconciled automatically via gateway hooks, **so that** dispatch is no longer delayed by manual reconciliation.
**Acceptance Criteria:**
- Settlement status updates automatically on payment gateway webhook event.
- Dispatch is no longer blocked pending manual reconciliation.

---

## Epic 6: CLV Segmentation Engine

### US-6.1
**As a** marketing analyst, **I want** every customer scored with a CLV value, **so that** I can target campaigns by tier.
**Acceptance Criteria:**
- All active customers (10,247+) receive a computed CLV score using BG/NBD + Gamma-Gamma models.
- Each customer is tagged High / Mid / Low CLV tier.

### US-6.2
**As a** marketing manager, **I want** to see customers migrating between CLV tiers, **so that** I can act on emerging high-value or at-risk customers.
**Acceptance Criteria:**
- Tier migration is recomputed on a recurring (e.g., monthly) schedule.
- Migration trends are visible on the dashboard.

### US-6.3
**As a** marketing manager, **I want** to allocate budget differently by CLV tier, **so that** spend matches customer value.
**Acceptance Criteria:**
- Marketing Automation Platform can filter/target campaigns by CLV tier field.
- High-CLV retention rate is tracked against an 85% target.

---

## Epic 7: Continuous Monitoring Dashboard

### US-7.1
**As an** operations leader, **I want** a single dashboard showing fulfillment SLA, CLV migration, returns TAT, and revenue recovery, **so that** I can manage the program without pulling manual reports.
**Acceptance Criteria:**
- Dashboard refreshes at least daily.
- All four KPI categories (SLA, CLV migration, TAT, revenue/cost) are visible on one view.

### US-7.2
**As an** operations leader, **I want** to be alerted when a KPI breaches its threshold, **so that** I can intervene proactively.
**Acceptance Criteria:**
- Configurable thresholds trigger notifications (email/Slack) on breach.

### US-7.3
**As an** IT administrator, **I want** role-based dashboard access, **so that** each team only sees relevant views.
**Acceptance Criteria:**
- Ops, Marketing, and Leadership roles see tailored dashboard views.

---

## Backlog Prioritization (Aligned to Roadmap)

| Sprint Phase | Epics in Scope |
|---|---|
| Q1 (Months 1–3) | Epic 1 (Warehouse Picking), Epic 6 (CLV Engine — initial scoring) |
| Q2 (Months 4–6) | Epic 2 (3PL Expansion), Epic 3 (Returns Portal — build start) |
| Q3 (Months 7–9) | Epic 3 (Returns Portal — completion), Epic 7 (Dashboard go-live) |
