# Process Flows

## 1. Order-to-Delivery Process Flow (As-Is, with Bottlenecks Marked)

```mermaid
flowchart LR
    A[Order Placed] --> B[Order Routed to Store/Warehouse]
    B --> C{Inventory Available?}
    C -- No --> C1[Stockout - Lost Sale] 
    C -- Yes --> D[Warehouse Picking]
    D -->|38% of delays - Manual pick, no zone optimization| E[Packing]
    E --> F[Payment Settlement Check]
    F -->|5% of delays - Manual reconciliation| G[Dispatch]
    G --> H[Last-Mile Delivery]
    H -->|29% of delays - Single 3PL dependency| I[Delivered]
    I --> J{Customer Satisfied?}
    J -- No / Return Requested --> K[Returns Processing]
    K -->|19% of delays - Manual approval for all returns| L[Refund / Restock]
    J -- Yes --> M[Order Closed]
```

## 2. Order-to-Delivery Process Flow (To-Be, Redesigned)

```mermaid
flowchart LR
    A[Order Placed] --> B[Real-Time Inventory Check]
    B -->|Real-time API sync, no 4hr lag| C{In Stock?}
    C -- No --> C1[Stockout Alert within 5 min]
    C -- Yes --> D[Zone-Based Picking + Barcode Scan]
    D --> E[Packing]
    E --> F[Automated Settlement via Gateway Hooks]
    F --> G[Dispatch]
    G --> H[Dynamic Multi-3PL Routing]
    H --> I[Delivered]
    I --> J{Return Requested?}
    J -- Yes, <Rs500 --> K1[Auto-Approved Return + Self-Service Label]
    J -- Yes, >=Rs500 or Fraud Flag --> K2[Manual Review Queue]
    K1 --> L[Refund within 48 hrs TAT]
    K2 --> L
    J -- No --> M[Order Closed]
```

## 3. CLV Segmentation Process Flow

```mermaid
flowchart TD
    A[Extract 3yr Transaction History - CRM/ERP] --> B[Apply BG/NBD Model]
    B --> C[Estimate Purchase Frequency]
    A --> D[Apply Gamma-Gamma Model]
    D --> E[Estimate Monetary Value per Transaction]
    C --> F[Compute CLV Score per Customer]
    E --> F
    F --> G{Assign Tier}
    G -- Top ~15% --> H[High CLV - VIP loyalty, early access]
    G -- ~42% --> I[Mid CLV - Upsell, retention offers]
    G -- ~43% --> J[Low CLV - Win-back, low-cost channels]
    H --> K[Push Tier to Marketing Automation Platform]
    I --> K
    J --> K
    K --> L[Recompute Monthly - Track Tier Migration]
```

## 4. Returns Process Flow (Detail)

```mermaid
flowchart TD
    A[Customer Initiates Return via Portal] --> B{Order Value < Rs500 AND Not Fraud-Flagged?}
    B -- Yes --> C[Auto-Approve Instantly]
    C --> D[Generate Self-Service Return Label]
    D --> E[Customer Ships Item]
    E --> F[Warehouse Receives & Verifies]
    F --> G[Refund Issued]
    B -- No --> H[Route to Manual Review Queue]
    H --> I[Returns Team Reviews]
    I -->|Approved| D
    I -->|Rejected| J[Notify Customer - Return Denied]
    G --> K[TAT Logged - Target less than 48 hrs]
```

## 5. Root Cause Analysis Method

Bottleneck root causes were derived using the **5-Why technique** supplemented by **Fishbone (Ishikawa) diagrams** built in stakeholder workshops with warehouse managers and logistics coordinators, cross-referencing WMS event logs against the ERP order management module.

| Bottleneck | 5-Why Summary |
|---|---|
| Warehouse Picking | No zone optimization → pickers walk full warehouse → manual process not redesigned → no investment prioritized → root cause: lack of zone-based WMS configuration |
| Last-Mile Delivery | Single 3PL → no failover during demand spikes → contract structured for one vendor → root cause: vendor concentration risk never addressed |
| Returns Processing | All returns need manual approval → no value-based routing rule exists → policy designed for fraud prevention without segmentation → root cause: no auto-approval threshold defined |
