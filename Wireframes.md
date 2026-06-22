# Wireframes (Low-Fidelity)

Text-based wireframe layouts for the three primary user-facing screens introduced by this initiative: the Returns Self-Service Portal, the CLV Marketing Console, and the Operations Monitoring Dashboard.

---

## 1. Returns Self-Service Portal — "Start a Return"

```
┌──────────────────────────────────────────────────────────┐
│  [Logo]      My Orders | Returns | Support        [👤]   │
├──────────────────────────────────────────────────────────┤
│  Start a Return                                           │
│  ┌────────────────────────────────────────────────────┐  │
│  │  Order #: [ 10293848         ]   [ Find Order ]     │  │
│  └────────────────────────────────────────────────────┘  │
│                                                            │
│  Order Summary                                             │
│  ┌────────────┬───────────────┬───────────┬────────────┐ │
│  │ Item       │ Qty           │ Price     │ Select     │ │
│  ├────────────┼───────────────┼───────────┼────────────┤ │
│  │ Item A     │ 1             │ ₹420      │ [✔]        │ │
│  │ Item B     │ 2             │ ₹1,200    │ [ ]        │ │
│  └────────────┴───────────────┴───────────┴────────────┘ │
│                                                            │
│  Reason for Return:  [ Dropdown ▾ ]                       │
│                                                            │
│  ┌──────────────────────────────────────────────────┐    │
│  │  STATUS: Order value < ₹500 → AUTO-APPROVED        │    │
│  └──────────────────────────────────────────────────┘    │
│                                                            │
│              [ Submit Return ]   [ Cancel ]                │
└──────────────────────────────────────────────────────────┘
```

**Notes:**
- If selected item total ≥ ₹500 or fraud-flagged, status banner instead reads "Pending Manual Review — response within 48 hours."
- On approval, a "Download Return Label" button appears immediately.

---

## 2. Returns Status Tracker

```
┌──────────────────────────────────────────────────────────┐
│  Return #RT-88213                          Status: ●Active│
├──────────────────────────────────────────────────────────┤
│  ① Submitted   →   ② Approved   →   ③ Picked Up   →  ④ Refunded │
│      ✔                ✔                ○                 ○      │
│                                                            │
│  TAT Clock: 14h 22m elapsed / 48h target                  │
│  [▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░] 30%                       │
│                                                            │
│              [ Download Return Label ]                    │
└──────────────────────────────────────────────────────────┘
```

---

## 3. CLV Marketing Console (Internal — Marketing Team)

```
┌──────────────────────────────────────────────────────────┐
│  CLV Segmentation Console            Refresh: Monthly ▾   │
├──────────────────────────────────────────────────────────┤
│  Filter Tier:  [ All ] [ High ] [ Mid ] [ Low ]           │
│                                                            │
│  ┌───────────┬───────────┬───────────────┬─────────────┐ │
│  │ Tier      │ % of Base │ Avg Revenue   │ Strategy     │ │
│  ├───────────┼───────────┼───────────────┼─────────────┤ │
│  │ High      │ 15%       │ ₹18L+         │ VIP loyalty  │ │
│  │ Mid       │ 42%       │ ₹8–18L        │ Upsell       │ │
│  │ Low       │ 43%       │ <₹8L          │ Win-back     │ │
│  └───────────┴───────────┴───────────────┴─────────────┘ │
│                                                            │
│  Tier Migration (Last 30 Days)                             │
│  [ Mid → High: 142 ]  [ Low → Mid: 310 ]  [ High → Mid: 38]│
│                                                            │
│  [ Export Segment to Marketing Automation Platform ]       │
└──────────────────────────────────────────────────────────┘
```

---

## 4. Operations Monitoring Dashboard

```
┌──────────────────────────────────────────────────────────┐
│  Operations Command Center        Role View: [Ops ▾]      │
├──────────────────────────────────────────────────────────┤
│  ┌───────────────┐ ┌───────────────┐ ┌──────────────────┐│
│  │ SLA Compliance │ │ Returns TAT   │ │ Revenue Recovery ││
│  │   74% ▼        │ │  41 hrs  ●OK  │ │   ₹19.2L / ₹32L  ││
│  │ Target: ≥90%   │ │ Target <48hrs │ │   YTD             ││
│  └───────────────┘ └───────────────┘ └──────────────────┘│
│                                                            │
│  Bottleneck Breakdown                 CLV Tier Migration   │
│  [ Bar chart: Picking 38%,            [ Sankey/flow chart  │
│    Last-Mile 29%, Returns 19%,          High/Mid/Low ]     │
│    Sync 9%, Settlement 5% ]                                │
│                                                            │
│  ⚠ Alerts: Returns TAT in Store #7 breached 48hr threshold │
└──────────────────────────────────────────────────────────┘
```

**Design Notes (applies to all screens):**
- Color coding: Green (within target), Amber (approaching threshold), Red (breached).
- Role-based view selector (Ops / Marketing / Leadership) shown top-right on the dashboard.
- All screens are responsive; Returns Portal must support mobile web.
