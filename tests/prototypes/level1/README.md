# Level 1 local prototype v0.4

**Source:** Notion Deliverable 023 / 022, retrieved from the Phygital Library on 19 November 2026.  
**Artifact:** `Phygital_Level1_Local_Prototype_v0_4.html`  
**Original file size:** 41,134 bytes.  
**Original SHA-256:** `c9799a7b1acdb1a3f646e1423deeca285b7016d58aab19f16f6da37d891ba1ef`.

## Purpose
A single-file, local, offline synthetic-only rehearsal aid for the Level 1 Digital Readiness Rehearsal. It includes 16 workflow steps, 12 negative controls, exception capture, quantity/lineage reconciliation and JSON/CSV report export.

## Use
Open locally in a modern browser. Use synthetic records only. Do not enter real personal, buyer, producer, commercial, payment, shipment or regulatory data. Store any resulting run report only in the approved controlled evidence location.

## Limitations
- No network calls, external services, database persistence, authentication, production authorization or security controls.
- Role selector is a local simulation, not authentication or access control.
- Workflow checkboxes are operator self-attestation.
- Negative tests exercise local functions and limited UI behaviour; they do not prove production controls or browser/OS tamper resistance.
- A successful local walkthrough is not independent review, database acceptance, legal approval or permission to trade/export.

## Status
This is a candidate rehearsal artifact, not proof that the browser rehearsal has passed. EVI-21 remains OPEN / Closure Accepted NO; DEF-L1-001 and DEF-L1-002 remain OPEN. Do not mark tests passed merely because the artifact exists or JavaScript logic tests passed.


## Verified v0.4 execution boundary (source update: 18 November 2026)

- Syntax check: PASS.
- Node.js V8 mocked-DOM logic harness: 12/12 negative assertions PASS, including N-01 through the actual UI runner.
- Positive simulated logic path: PASS (80.000 kg allocated; 15.000 kg remainder).
- Browser rendering: NOT VERIFIED. Two headless Chromium attempts produced no rendered DOM; this is an environment launch limitation, not a browser pass or prototype failure.
- Sixteen-step operator rehearsal: NOT RUN.
- Twelve negative tests in a supported real browser: NOT RUN.
- Screenshots/browser exports: NOT captured.
- Independent review: outstanding.

The v0.4 artifact is 41,134 bytes with SHA-256 `c9799a7b1acdb1a3f646e1423deeca285b7016d58aab19f16f6da37d891ba1ef`. Verify this identity before operator execution. EVI-21 remains OPEN / Closure Accepted NO; DEF-L1-001 and DEF-L1-002 remain OPEN. The logic harness is not browser execution, database acceptance, security certification or permission to trade.
